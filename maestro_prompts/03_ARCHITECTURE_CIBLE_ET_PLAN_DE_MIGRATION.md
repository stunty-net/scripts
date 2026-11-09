# Étape 2 — Architecture cible et plan de migration

## Mission

À partir de l'audit validé, définir une architecture cible pragmatique pour l'organisation Maestro. Ne pas implémenter l'ensemble à cette étape.

## Principes

- L'architecture doit correspondre aux capacités réelles de la version Hermes installée.
- Préférer le natif, le simple et le maintenable.
- Éviter les composants redondants, les dépendances non nécessaires et les abstractions prématurées.
- Conserver les installations et configurations qui fonctionnent.
- Toute migration doit être progressive, traçable et réversible.

## Travaux

1. Décrire l'architecture actuelle.
2. Décrire l'architecture cible : Maestro, agents, sous-agents, mémoire/wiki, Kanban, collaboration, outils, infrastructure et automatisations.
3. Définir les flux :
   - demande de Chef → cadrage par Maestro ;
   - décomposition → attribution aux agents ;
   - collaboration et délégation ;
   - contrôle qualité ;
   - documentation et mise à jour des tâches ;
   - compte rendu à Chef.
4. Définir les frontières de permissions et les actions nécessitant une approbation.
5. Identifier les capacités Hermes natives à utiliser et les éventuels composants externes réellement nécessaires.
6. Construire une feuille de route avec dépendances, risques, effort relatif et critères de sortie.
7. Définir les points de retour arrière pour les changements sensibles.

## Décisions à soumettre à Chef

Ne demander un arbitrage que lorsque plusieurs options ont un impact concret sur sécurité, coût, maintenance, réversibilité ou expérience d'utilisation. Présenter une recommandation argumentée, pas une liste de choix sans analyse.

## Livrables

- Schéma d'architecture (Mermaid si adapté).
- ADR (Architecture Decision Records) pour les décisions structurantes.
- Matrice des composants et responsabilités.
- Plan de migration par étapes.
- Liste des prérequis et validations humaines.
- Mise à jour du Kanban.

## Critères de sortie

L'architecture est compréhensible, réaliste, proportionnée et validée par Chef avant les changements structurants.
