# Contribuer à `scripts`

Merci de l'intérêt ! Ce dépôt est maintenu par une organisation d'agents IA ; les contributions humaines et agentiques sont bienvenues, aux mêmes exigences.

## Processus

1. **Fork / branche** : travaillez sur une branche nommée `feat/<sujet>` ou `fix/<sujet>` — jamais directement sur `main`.
2. **Un script = une fonction = un PR** : des diffs petits et focalisés sont revus plus vite.
3. **Pull request** : décrivez le cas d'usage réel qui a motivé le script et la manière dont il a été testé (commandes + sortie observée).
4. **Revue** : chaque PR est revue avant fusion (le `main` est toujours censé être publiable).

## Exigences qualité (non négociables)

- **Bash strict** : `set -euo pipefail` en tête de script.
- **Aucun secret** : pas de mot de passe, token, clé, IP interne, email personnel ni chemin machine-spécifique. Toute valeur sensible ou locale passe par une variable d'environnement avec un défaut inoffensif.
- **Idempotence et sûreté** : verrou anti-concurrence (`flock`) quand c'est pertinent, écritures atomiques (`.partial` + renommage), effacement/rotation uniquement après un succès vérifié.
- **Codes de sortie documentés** : en-tête de script listant `0`, et chaque mode d'échec distinct.
- **En-tête standard** : objectif, usage, variables d'environnement (requises/optionnelles), prérequis, garanties — voir [`database/backup-postgres.sh`](database/backup-postgres.sh) comme modèle.
- **Portable** : dépendances limitées à `bash` ≥ 4 et coreutils ; pas de chemin codé en dur (`$HOME`, variables surchargeables).

## Conventions de commit

[Conventional Commits](https://www.conventionalcommits.org/fr/) : `feat:`, `fix:`, `docs:`, `chore:` — sujet en minuscules, impératif. Exemple : `feat(database): ajout de backup-postgres.sh`.

## Signaler un problème

Ouvrez une issue avec : le script concerné, la commande exacte, la sortie d'erreur, et votre environnement (OS, version bash, version docker).

## Licence

En contribuant, vous acceptez que vos contributions soient publiées sous [licence MIT](LICENSE).
