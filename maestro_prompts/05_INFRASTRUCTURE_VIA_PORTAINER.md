# Étape 4 — Infrastructure Docker pilotée par Portainer

## Mission

Préparer et, après vérification des accès, déployer les services nécessaires en utilisant exclusivement Portainer comme plan de contrôle Docker autorisé.

## Interdiction non négociable

L'utilisateur Linux `ai` ne doit pas obtenir d'accès direct à Docker :
- ne pas l'ajouter au groupe `docker` ;
- ne pas changer les permissions du socket Docker ;
- ne pas utiliser sudo ou un contournement ;
- ne pas exposer le daemon Docker sur TCP.

Toute proposition allant dans ce sens doit être rejetée.

## Architecture de services souhaitée

Évaluer le besoin et la compatibilité des versions stables récentes au moment de l'exécution :
- PostgreSQL avec `pgvector` ;
- Redis ;
- pgAdmin ;
- RedisInsight.

Privilégier des images maintenues et officielles, des versions maîtrisées et des tags explicites plutôt que `latest` en production. Alpine peut être retenu si l'image officielle et les extensions nécessaires le supportent réellement. Pour PostgreSQL, vérifier précisément la compatibilité de `pgvector` avec la version et l'image choisies.

## Portainer API

1. Vérifier la connectivité HTTPS vers Portainer.
2. Vérifier le certificat TLS et corriger la confiance si nécessaire.
3. Utiliser une clé API dédiée, avec permissions minimales et si possible un compte technique limité.
4. Authentifier les appels avec `X-API-Key`.
5. Ne jamais afficher ni journaliser la clé.
6. Déterminer l'endpoint Portainer et les permissions réellement accordées.
7. Étudier les méthodes de déploiement de stacks disponibles (Git, Web Editor, méthode prise en charge par la version installée).
8. Ne pas supposer que Portainer peut lire les fichiers locaux de `ai` : vérifier le mode de déploiement.
9. Si la clé n'est pas encore fournie, préparer les fichiers et la procédure, puis demander à Chef de créer le token dans Portainer → My account → Access tokens → Add access token.

Référence : https://docs.portainer.io/api/access et https://api-docs.portainer.io/.

## Conception des services

Pour chaque service :
- rôle et dépendances ;
- image et version ;
- volumes persistants ;
- réseau privé ;
- variables d'environnement ;
- secrets ;
- healthcheck ;
- politique de redémarrage ;
- sauvegarde/restauration ;
- exposition réseau strictement nécessaire ;
- stratégie de mise à jour.

Utiliser des volumes persistants et des identifiants forts. Ne pas publier les interfaces d'administration sur Internet sans besoin explicite et protection appropriée.

## Déploiement

1. Préparer les fichiers Compose et les relire.
2. Vérifier les versions et compatibilités.
3. Faire valider par Chef les expositions réseau et les choix sensibles.
4. Déployer via Portainer.
5. Vérifier l'état des conteneurs, healthchecks, volumes et journaux sans révéler de secrets.
6. Tester les connexions applicatives.
7. Tester sauvegarde et restauration sur un périmètre non destructif.

## Livrables

- Schéma d'infrastructure.
- Fichiers Compose versionnés sans secrets.
- Procédure Portainer.
- Inventaire des services, versions et volumes.
- Procédures de sauvegarde/restauration.
- Rapport de tests et limites.

## Critères de sortie

Tous les services retenus sont sains, persistants, protégés et administrés via Portainer. Aucun accès Docker direct n'a été accordé à `ai`.
