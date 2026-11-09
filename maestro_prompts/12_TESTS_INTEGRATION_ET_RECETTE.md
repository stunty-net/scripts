# Étape 11 — Tests d'intégration et recette générale

## Mission

Vérifier que l'organisation Maestro fonctionne réellement de bout en bout, et corriger les défauts avant de considérer le système comme opérationnel.

## Scénarios de recette

### 1. Demande simple
Chef demande une tâche courte. Maestro la cadre, l'assigne, la fait réaliser et rend compte.

### 2. Travail parallèle
Une demande est découpée en lots indépendants confiés à plusieurs agents, puis consolidée.

### 3. Collaboration directe
Deux agents échangent une information nécessaire à leur travail sans que Maestro retransmette chaque message, si la capacité est disponible.

### 4. Mémoire
Un agent retrouve une décision ou une connaissance dans le wiki et la met à jour proprement.

### 5. Kanban
Une tâche traverse les statuts, expose ses dépendances et n'est clôturée qu'après revue.

### 6. Infrastructure
Les services sont vérifiés via Portainer/API. Confirmer qu'aucun accès Docker direct n'a été accordé à `ai`.

### 7. GitHub
Un changement non sensible est versionné dans le bon dépôt. Vérifier la confidentialité de `hub` et le contrôle de publication de `scripts`.

### 8. Automatisation
Une routine pilote s'exécute une fois, ne crée pas de doublon et produit un rapport exploitable.

### 9. Sécurité
Vérifier les permissions, la protection des secrets, les journaux et les actions soumises à approbation.

### 10. Reprise
Interrompre/reprendre un travail de test et vérifier que l'état utile est conservé.

## Méthode

Pour chaque scénario :
- préconditions ;
- procédure ;
- résultat attendu ;
- résultat observé ;
- preuve ;
- statut `PASS`, `FAIL` ou `NOT TESTED` ;
- anomalie et tâche de correction.

Ne jamais marquer `PASS` sans preuve.

## Livrables

- Plan de recette.
- Rapport de résultats.
- Liste des anomalies priorisées.
- Tâches de correction.
- Décision de mise en service : prête, prête avec réserves ou non prête.

## Critères de sortie

Les scénarios critiques passent, les réserves sont explicites et Chef dispose d'une vision fiable de ce qui fonctionne réellement.
