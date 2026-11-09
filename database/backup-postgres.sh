#!/usr/bin/env bash
# ============================================================================
# backup-postgres.sh — Sauvegarde d'une base PostgreSQL dockerisée (pg_dump -Fc)
# ----------------------------------------------------------------------------
# Objectif :
#   Dump au format « custom » de pg_dump (-Fc) d'une base PostgreSQL tournée
#   dans un conteneur Docker, horodaté, écrit dans BACKUP_DIR, puis
#   rotation : seuls les RETENTION backups les plus récents sont conservés.
#
# Usage :
#   backup-postgres.sh            # toute la configuration vient de l'environnement
#
#   Variables requises :
#     PG_CONTAINER   nom du conteneur Docker qui tourne PostgreSQL
#     PG_DATABASE    nom de la base à sauvegarder
#   Variables optionnelles :
#     PG_USER        utilisateur de connexion (défaut : postgres)
#     BACKUP_DIR     répertoire de sortie (défaut : $HOME/backups)
#     RETENTION      nombre de sauvegardes conservées (défaut : 7)
#
#   Exemples :
#     PG_CONTAINER=db PG_DATABASE=app ./backup-postgres.sh
#     PG_CONTAINER=db PG_DATABASE=app RETENTION=14 BACKUP_DIR=/srv/backups \
#       ./backup-postgres.sh
#
#   Exemple cron (sauvegarde quotidienne à 03:17, journal dans backups/) :
#     17 3 * * *  PG_CONTAINER=db PG_DATABASE=app \
#                 /opt/scripts/database/backup-postgres.sh \
#                 >> /var/log/backup-postgres.log 2>&1
#
# Prérequis :
#   - `docker` accessible pour l'utilisateur qui invoque le script ;
#   - image PostgreSQL officielle (ou dérivée) : l'authentification locale à
#     l'intérieur du conteneur est « trust » par défaut → pg_dump n'a besoin
#     d'AUCUN mot de passe (source : https://hub.docker.com/_/postgres).
#     Si votre image impose un mot de passe : définissez PGPASSWORD ou un
#     ~/.pgpass dans le conteneur.
#
# Codes de sortie :
#   0  sauvegarde créée (et rotation appliquée)
#   1  échec : docker inaccessible, conteneur arrêté, ou erreur pg_dump
#   2  erreur de configuration (variables manquantes, RETENTION invalide,
#      docker absent)
#   3  une sauvegarde est déjà en cours (verrou flock)
#
# Garanties :
#   - bash strict : set -euo pipefail ;
#   - verrou anti-concurrence (flock) : une seule exécution à la fois ;
#   - fichier atomique : le dump est écrit en « .partial » puis renommé —
#     une sauvegarde n'est jamais visible à moitié faite ;
#   - rotation APRÈS un dump réussi : un échec ne supprime jamais les
#     sauvegardes existantes ;
#   - rotation limitée au motif `postgres-<base>-*.dump` : aucun autre
#     fichier de BACKUP_DIR n'est touché ;
#   - idempotent : relancer est sans danger (nouveau fichier horodaté,
#     rotation bornée, verrou) ;
#   - aucun secret ici : aucun mot de passe n'apparaît dans ce script.
# ============================================================================

set -euo pipefail

# --------------------------- Configuration ---------------------------------
PG_CONTAINER="${PG_CONTAINER:-}"
PG_DATABASE="${PG_DATABASE:-}"
PG_USER="${PG_USER:-postgres}"
BACKUP_DIR="${BACKUP_DIR:-$HOME/backups}"
RETENTION="${RETENTION:-7}"

# ------------------------------ Contrôles ----------------------------------
command -v docker >/dev/null 2>&1 || {
  echo "ERREUR : docker n'est pas installé (commande introuvable)." >&2
  exit 2
}
if [[ -z "$PG_CONTAINER" || -z "$PG_DATABASE" ]]; then
  echo "ERREUR : PG_CONTAINER et PG_DATABASE sont requis." >&2
  echo "        Exemple : PG_CONTAINER=db PG_DATABASE=app $0" >&2
  echo "        (liste des conteneurs : docker ps)" >&2
  exit 2
fi
if [[ ! "$RETENTION" =~ ^[1-9][0-9]*$ ]]; then
  echo "ERREUR : RETENTION doit être un entier ≥ 1 (valeur : '$RETENTION')." >&2
  exit 2
fi

mkdir -p -- "$BACKUP_DIR"

# ----------------- Verrou anti-concurrence (flock) -------------------------
LOCK_FILE="$BACKUP_DIR/.backup-postgres.lock"
exec 9>"$LOCK_FILE"
if ! flock -n 9; then
  echo "ERREUR : une sauvegarde est déjà en cours (verrou $LOCK_FILE)." >&2
  exit 3
fi

# ------------------------------ Pre-flight ---------------------------------
# Un seul appel docker valide l'accès au démon, l'existence du conteneur ET
# son état, pour donner un message d'erreur précis.
if ! status=$(docker container inspect -f '{{.State.Status}}' "$PG_CONTAINER" 2>/dev/null); then
  echo "ERREUR : docker inaccessible ou conteneur '$PG_CONTAINER' introuvable." >&2
  echo "        → vérifier le nom du conteneur ('docker ps') et les droits" >&2
  echo "          d'accès au démon docker de l'utilisateur courant." >&2
  exit 1
fi
if [[ "$status" != "running" ]]; then
  echo "ERREUR : le conteneur '$PG_CONTAINER' n'est pas en cours d'exécution (état : $status)." >&2
  exit 1
fi

# -------------------------------- Dump -------------------------------------
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
FILE_FINAL="$BACKUP_DIR/postgres-${PG_DATABASE}-${TIMESTAMP}.dump"
FILE_PARTIAL="$FILE_FINAL.partial"

cleanup() { rm -f -- "$FILE_PARTIAL"; }
trap cleanup EXIT

echo "→ Sauvegarde de la base '$PG_DATABASE' (utilisateur '$PG_USER') depuis '$PG_CONTAINER'…"
# Pas d'option -t : docker exec sans TTY préserve le flux binaire du dump.
if ! docker exec "$PG_CONTAINER" pg_dump -U "$PG_USER" -Fc "$PG_DATABASE" >"$FILE_PARTIAL"; then
  echo "ERREUR : pg_dump a échoué." >&2
  echo "        → vérifier le nom de la base ('$PG_DATABASE') et l'utilisateur" >&2
  echo "          ('$PG_USER') : psql -U '$PG_USER' -l dans le conteneur." >&2
  exit 1
fi
if [[ ! -s "$FILE_PARTIAL" ]]; then
  echo "ERREUR : dump absent ou vide : $FILE_PARTIAL" >&2
  exit 1
fi
mv -- "$FILE_PARTIAL" "$FILE_FINAL"

# ------------------------- Rotation (rétention) ----------------------------
# Après succès uniquement : suppression des sauvegardes au-delà de RETENTION.
# Le motif glob est trié par bash dans l'ordre lexical, qui est ici l'ordre
# chronologique (horodatage %Y%m%d-%H%M%S).
shopt -s nullglob
backups=( "$BACKUP_DIR/postgres-${PG_DATABASE}-"*.dump )
excedent=$(( ${#backups[@]} - RETENTION ))
if (( excedent > 0 )); then
  for old in "${backups[@]:0:excedent}"; do
    if rm -f -- "$old"; then
      echo "→ Rotation : $old supprimé"
    else
      echo "ATTENTION : rotation : '$old' impossible à supprimer (rétention à revérifier)." >&2
    fi
  done
fi

size="$(du -h -- "$FILE_FINAL" | cut -f1)"
echo "✅ Sauvegarde créée : $FILE_FINAL ($size)"
