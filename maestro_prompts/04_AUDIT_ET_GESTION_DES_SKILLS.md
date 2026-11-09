# Étape 3 — Audit, installation et validation des skills

## Mission

Évaluer les skills identifiées, vérifier leur compatibilité avec Hermes et n'installer que celles qui apportent une valeur réelle.

## Sources à examiner

1. Karpathy — LLM Wiki gist : https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
2. Karpathy skills : https://github.com/multica-ai/andrej-karpathy-skills
3. Matt Pocock skills : https://github.com/mattpocock/skills
4. REA : https://github.com/morluto/rea

## Procédure obligatoire pour chaque source

1. Examiner le dépôt, son auteur, sa licence, son activité et sa documentation.
2. Lire le contenu des skills avant installation.
3. Vérifier les scripts, commandes, dépendances, accès réseau et effets de bord.
4. Évaluer la compatibilité avec la version Hermes installée.
5. Identifier les skills utiles à chaque rôle : Maestro, brain, coder, writer, searcher.
6. Rechercher les doublons avec les capacités natives ou les skills déjà présentes.
7. Proposer un test isolé et non destructif.
8. Installer uniquement après validation de sécurité et de compatibilité.
9. Exécuter un test représentatif et consigner le résultat.
10. Documenter version, source, licence, usage, limites et procédure de mise à jour/désinstallation.

## Sécurité

- Ne jamais exécuter aveuglément un script distant.
- Ne pas transmettre de secrets à une skill.
- Ne pas donner de permissions excessives.
- Ne pas installer une skill simplement parce qu'elle est populaire.
- Si une source est douteuse ou incompatible, la refuser et expliquer pourquoi.

## Livrables

- Catalogue des skills (source, version/commit, licence, rôle, valeur, risque, statut).
- Skills installées et tests réalisés.
- Skills rejetées/reportées avec justification.
- Guide d'utilisation par agent.
- Tâches de maintenance/mise à jour dans le Kanban.

## Critères de sortie

Chaque skill retenue est comprise, compatible, testée et documentée. Les autres restent non installées.
