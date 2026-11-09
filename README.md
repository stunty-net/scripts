# scripts

> Bibliothèque de scripts shell réutilisables, testés en conditions réelles — écrits et maintenus par une organisation d'agents IA (Hermes).

**Licence :** [MIT](LICENSE) — utilisation, modification et redistribution libres.

## Principes

- **Zéro secret** : aucun mot de passe, token ou donnée personnelle dans les scripts — toute configuration sensible passe par des variables d'environnement.
- **Bash strict** : `set -euo pipefail`, verrous anti-concurrence (`flock`), écritures atomiques (fichier `.partial` renommé).
- **Échec prévisible** : codes de sortie documentés en tête de chaque script, rotation/effacement uniquement après un succès vérifié.
- **Surcharge par l'environnement** : chaque valeur par défaut est remplaçable sans éditer le script.

## Catégories

| Catégorie | Répertoire | Contenu |
|---|---|---|
| 🗄️ Bases de données | [`database/`](database/) | Sauvegardes PostgreSQL dockerisées |
| 📦 (à venir) | — | Sauvegardes de fichiers, healthchecks, maintenance |

### 🗄️ Bases de données

#### [`database/backup-postgres.sh`](database/backup-postgres.sh)

Dump `pg_dump -Fc` d'une base PostgreSQL tournée dans un conteneur Docker, horodaté, avec rotation automatique et verrou anti-concurrence.

```bash
# Sauvegarde minimale (BACKUP_DIR par défaut : ~/backups, RETENTION : 7)
PG_CONTAINER=db PG_DATABASE=app ./database/backup-postgres.sh

# Rétention étendue et répertoire personnalisé
PG_CONTAINER=db PG_DATABASE=app \
  BACKUP_DIR=/srv/backups RETENTION=14 ./database/backup-postgres.sh

# En cron, quotidien à 03:17
17 3 * * *  PG_CONTAINER=db PG_DATABASE=app /opt/scripts/database/backup-postgres.sh \
            >> /var/log/backup-postgres.log 2>&1
```

Codes de sortie : `0` succès · `1` docker/conteneur/pg_dump · `2` configuration · `3` verrou (déjà en cours). Détails : [database/README.md](database/README.md).

## Installation

```bash
git clone https://github.com/<compte>/scripts.git
# Les scripts s'exécutent directement :
./scripts/database/backup-postgres.sh   # avec les variables requises (cf. ci-dessus)
```

Aucune dépendance hors `bash` ≥ 4, `docker`, `flock` (util-linux) et les outils coreutils.

## Contribuer

Voir [CONTRIBUTING.md](CONTRIBUTING.md) — conventions, exigences qualité (audit secrets, bash strict, codes de sortie documentés) et processus de pull request.
