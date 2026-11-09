# 🗄️ Bases de données

Scripts de sauvegarde et de maintenance pour bases de données dockerisées.

## backup-postgres.sh

**Objectif :** dump au format « custom » (`pg_dump -Fc`) d'une base PostgreSQL tournée dans un conteneur Docker — fichier horodaté, écriture atomique, rotation des anciens backups, verrou anti-concurrence.

### Configuration (variables d'environnement)

| Variable | Requise | Défaut | Rôle |
|---|---|---|---|
| `PG_CONTAINER` | ✅ | — | Nom du conteneur Docker (`docker ps`) |
| `PG_DATABASE` | ✅ | — | Base à sauvegarder |
| `PG_USER` | — | `postgres` | Utilisateur de connexion (authentification locale « trust » de l'image officielle PostgreSQL : aucun mot de passe requis) |
| `BACKUP_DIR` | — | `$HOME/backups` | Répertoire de sortie |
| `RETENTION` | — | `7` | Nombre de sauvegardes conservées (≥ 1) |

### Exemples

```bash
PG_CONTAINER=db PG_DATABASE=app ./backup-postgres.sh
# → ~/backups/postgres-app-20261109-031700.dump

BACKUP_DIR=/srv/backups RETENTION=14 \
  PG_CONTAINER=postgres PG_DATABASE=prod ./backup-postgres.sh
# → /srv/backups/postgres-prod-20261109-031700.dump (+ rotation à 14 fichiers)
```

### Restauration

Le format `-Fc` se restaure avec `pg_restore` :

```bash
# Schéma + données dans une base vierge
docker exec -i "$PG_CONTAINER" pg_restore -U postgres -d app_restaur \
  < ~/backups/postgres-app-20261109-031700.dump
```

### Codes de sortie

| Code | Signification |
|---|---|
| `0` | Sauvegarde créée et rotation appliquée |
| `1` | Docker inaccessible, conteneur arrêté/introuvable, ou échec `pg_dump` |
| `2` | Configuration invalide (variables manquantes, `RETENTION` non entier ≥ 1, docker absent) |
| `3` | Une sauvegarde est déjà en cours (verrou `flock`) |

### Garanties

- Écriture atomique : le dump est d'abord un `.partial`, renommé seulement une fois complet — jamais de sauvegarde à moitié faite.
- Rotation **après** succès uniquement : un échec ne supprime jamais les sauvegardes existantes ; la rotation ne touche que le motif `postgres-<base>-*.dump`.
- Aucun secret dans le script : aucun mot de passe n'apparaît ; si votre image impose une authentification, utilisez `PGPASSWORD` ou un `.pgpass` dans le conteneur.
