# Parcours de déploiement de Maestro — Guide d'utilisation

## Objectif

Ce dossier contient une suite de prompts autonomes, à transmettre **un par un et dans l'ordre** à Hermes/Maestro. Le but est de construire progressivement une organisation d'agents fiable, collaborative, documentée et capable de s'améliorer.

Il ne s'agit pas de tout installer en une seule fois. Chaque étape doit être auditée, exécutée, vérifiée et documentée avant de passer à la suivante.

## Ordre d'exécution

| Ordre | Fichier | Résultat attendu |
|---:|---|---|
| 0 | `00_LIRE_AVANT_DE_COMMENCER.md` | Comprendre le parcours et ses règles |
| 1 | `01_CONTEXTE_ET_REGLES_PERMANENTES.md` | Socle de gouvernance commun |
| 2 | `02_AUDIT_ET_REPRISE_DE_LEXISTANT.md` | État réel de l'installation et reprise sans casse |
| 3 | `03_ARCHITECTURE_CIBLE_ET_PLAN_DE_MIGRATION.md` | Architecture cible et feuille de route validée |
| 4 | `04_AUDIT_ET_GESTION_DES_SKILLS.md` | Skills évaluées, installées et testées |
| 5 | `05_INFRASTRUCTURE_VIA_PORTAINER.md` | Services Docker administrés exclusivement via Portainer |
| 6 | `06_WIKI_MEMOIRE_COLLECTIVE.md` | Wiki structuré et initialisé |
| 7 | `07_EQUIPE_AGENTS_ET_PROFILS.md` | Agents principaux, profils et limites |
| 8 | `08_COLLABORATION_DELEGATION_ET_SESSIONS.md` | Collaboration, délégation et travail parallèle |
| 9 | `09_KANBAN_ET_GESTION_DES_TACHES.md` | Pilotage persistant des tâches |
| 10 | `10_GITHUB_ET_GOUVERNANCE_DU_CODE.md` | Dépôts privés/publics et flux Git sécurisés |
| 11 | `11_AUTOMATISATIONS_ET_RYTHMES_DEQUIPE.md` | Routines quotidiennes, hebdomadaires et mensuelles |
| 12 | `12_TESTS_INTEGRATION_ET_RECETTE.md` | Vérification de bout en bout et corrections |
| 13 | `13_AMELIORATION_CONTINUE_ET_EVOLUTION.md` | Boucle d'amélioration progressive |

## Mode opératoire recommandé

1. Commencer par lire `01_CONTEXTE_ET_REGLES_PERMANENTES.md`.
2. Envoyer à Maestro le prompt de l'étape 2, puis attendre son rapport final.
3. Examiner les décisions proposées et répondre aux éventuelles demandes d'arbitrage.
4. N'envoyer l'étape suivante que lorsque les critères de sortie de l'étape en cours sont satisfaits.
5. À chaque nouvelle session, joindre ou référencer le fichier de contexte permanent et le dernier rapport d'avancement.
6. Conserver les rapports, décisions et preuves dans le wiki, sans recopier les secrets.

**Ne pas lancer tous les prompts en rafale.** L'intérêt de cette décomposition est précisément de laisser à Maestro le temps d'observer, d'exécuter et de vérifier chaque fondation.

## Règle de reprise

Le système a déjà commencé à être configuré à partir d'un premier prompt. Les instructions sont donc des consignes de **continuité et de réconciliation**, pas une demande de réinstallation. Maestro doit préserver ce qui fonctionne, identifier les écarts, puis proposer des modifications minimales et réversibles.

## Gestion des blocages

Maestro doit distinguer :
- `BLOQUANT` : impossible de continuer sans décision ou action humaine ;
- `À_ARBITRER` : plusieurs choix raisonnables avec impact réel ;
- `NON_BLOQUANT` : peut être reporté sans compromettre la suite ;
- `HYPOTHÈSE` : information non vérifiée.

Il doit demander une seule action humaine clairement formulée à la fois, si possible, et continuer les travaux indépendants.

## Définition générale de « terminé »

Une étape n'est terminée que si :
- le résultat existe réellement ;
- il a été testé selon des critères explicites ;
- les erreurs et limites connues sont consignées ;
- le wiki et le Kanban sont à jour ;
- les changements sont réversibles ou leur risque est accepté ;
- Maestro fournit un rapport court avec preuves, chemins et prochaines étapes.
