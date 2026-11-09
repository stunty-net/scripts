# Étape 9 — GitHub et gouvernance du code

## Mission

Mettre en place les dépôts GitHub prévus, en réutilisant les outils et authentifications existants et en protégeant strictement les données.

## Dépôts souhaités

- `hub` : **privé**, pour la gouvernance, les configurations non sensibles, les prompts, la documentation et les éléments internes versionnables.
- `scripts` : **public**, pour les scripts génériques et contenus dont la publication est explicitement sûre.

Vérifier les noms, l'existence et les droits avant toute création.

## Audit préalable

- Git installé et version.
- Configuration locale et dépôts existants.
- GitHub CLI présent ou absent.
- Authentification existante et permissions disponibles.
- Clés SSH et agents SSH sans jamais révéler de clé privée.
- Remotes, branches, historique et état de travail.

GitHub CLI est facultatif. Ne pas installer ni lancer une authentification interactive si une méthode existante suffit ou si la session ne permet pas l'interaction.

## Sécurité avant publication

Avant tout push :
1. scanner les fichiers et l'historique pour détecter secrets et données privées ;
2. vérifier `.gitignore` ;
3. exclure `.env`, tokens, clés, sauvegardes, données utilisateurs et configurations sensibles ;
4. vérifier les licences et droits de publication ;
5. relire le diff et le contenu du dépôt ;
6. confirmer que `scripts` ne contient que des éléments publiables.

Ne jamais publier automatiquement un contenu ambigu. Demander l'accord de Chef.

## Organisation proposée

Définir une structure cohérente, README, conventions de branches, commits, tags, issues et releases. Éviter les workflows CI/CD complexes tant qu'un besoin concret n'est pas établi.

## Livrables

- Dépôts créés ou état des dépôts existants.
- Arborescences et README.
- Politique de branches et commits.
- `.gitignore` et contrôles de secrets.
- Procédure de synchronisation wiki/code.
- Rapport des vérifications avant publication.

## Critères de sortie

`hub` est privé, `scripts` est public uniquement si sa sécurité a été validée, et aucune donnée sensible n'a été publiée.
