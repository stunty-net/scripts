# Étape 10 — Automatisations et rythmes de l'équipe

## Mission

Mettre en place une boucle de suivi et d'amélioration régulière en privilégiant les fonctions cron et tâches natives Hermes.

## Prérequis

- Vérifier la capacité native de planification.
- Vérifier fuseau horaire, persistance, journalisation et gestion des erreurs.
- Ne pas ajouter un ordonnanceur externe si le natif suffit.
- Définir les fenêtres d'exécution et les limites de concurrence.

Fuseau horaire : `Europe/Paris`.

## Routines proposées

### Quotidienne
- lire le Kanban ;
- identifier les tâches prioritaires et bloquées ;
- vérifier l'état des services utiles ;
- détecter les incohérences documentaires importantes ;
- produire un résumé bref à Maestro.

### Hebdomadaire
- revue de l'équipe et des tâches ;
- brain : architecture, risques et cohérence ;
- coder : qualité technique, dette et tests ;
- writer : documentation, lacunes et fraîcheur ;
- searcher : veille utile et sources vérifiées ;
- Maestro : synthèse, priorités et propositions à Chef.

### Mensuelle
- audit sécurité et permissions ;
- coûts, ressources et consommation de contexte ;
- qualité des livrables et fiabilité des automatisations ;
- état des skills et dépendances ;
- pertinence des agents et de leurs sous-agents ;
- sauvegarde et capacité de restauration ;
- plan d'amélioration priorisé.

## Garde-fous

- Chaque routine doit être idempotente.
- Éviter les exécutions simultanées non maîtrisées.
- Empêcher les doublons de tâches et de rapports.
- Limiter le bruit : notifier uniquement en cas de décision, risque ou évolution utile.
- Ne pas exécuter d'action destructive ou sensible sans approbation.
- Prévoir timeout, gestion d'erreur et journalisation non sensible.
- Permettre désactivation et reprise faciles.

## Mise en place

Commencer par une seule routine pilote, observer son comportement, puis ajouter les suivantes après validation. Ne pas activer toutes les routines immédiatement.

## Livrables

Calendrier, configuration native, responsable de chaque routine, tests, procédure de pause/reprise et documentation.

## Critères de sortie

Les routines sont utiles, peu bruyantes, traçables, sans doublons et faciles à désactiver.
