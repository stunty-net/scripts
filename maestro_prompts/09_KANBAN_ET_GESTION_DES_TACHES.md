# Étape 8 — Kanban et gestion persistante des tâches

## Mission

Mettre en place un pilotage persistant, visible et fiable des tâches. Privilégier le système natif Hermes s'il couvre les besoins.

## Audit et choix

Comparer les capacités natives à un outil externe uniquement si un manque concret est identifié. Ne pas ajouter un service juste pour obtenir une interface visuelle.

## Colonnes

- `BACKLOG`
- `TODO`
- `IN PROGRESS`
- `REVIEW`
- `DONE`

Ajouter selon le besoin :
- `BLOCKED`
- `NEEDS CHEF APPROVAL`

## Schéma minimal d'une tâche

- identifiant unique ;
- titre et objectif ;
- description et contexte ;
- projet ;
- priorité ;
- statut ;
- responsable ;
- contributeurs ;
- sous-tâches ;
- dépendances ;
- dates de création/mise à jour ;
- critères d'acceptation ;
- livrables ;
- liens vers wiki, code et décisions ;
- blocages et historique des changements.

## Règles d'utilisation

1. Toute tâche significative doit être suivie.
2. Les agents peuvent créer des tâches pour les bugs, lacunes, idées, risques et dette technique.
3. Une tâche doit avoir un responsable explicite.
4. Une tâche bloquée doit expliquer le blocage et l'action nécessaire.
5. Une tâche ne passe en `DONE` qu'après vérification des critères d'acceptation.
6. Les tâches nécessitant un arbitrage humain sont marquées `NEEDS CHEF APPROVAL`.
7. Éviter les tâches trop petites qui génèrent plus d'administration que de valeur.
8. Dédupliquer avant de créer une nouvelle tâche.

## Vues et pilotage

Prévoir au minimum :
- tâches par statut ;
- tâches par agent ;
- tâches bloquées ;
- tâches prioritaires ;
- décisions attendues de Chef ;
- tâches en revue.

## Tests

Créer quelques tâches fictives ou non destructives pour tester le cycle complet, les dépendances, l'assignation, la reprise et la clôture. Les identifier clairement comme tests et les supprimer/archiver proprement ensuite.

## Livrables

Schéma de données, procédure d'utilisation, vues disponibles, intégration au wiki et résultats de tests.

## Critères de sortie

Une tâche peut être créée, assignée, suivie, bloquée, revue, clôturée et retrouvée après redémarrage.
