# Étape 5 — Wiki et mémoire collective

## Mission

Créer ou consolider un wiki Markdown qui sert de mémoire commune, de documentation technique et de source de vérité pour Maestro et son équipe.

## Avant toute création

- Inventorier l'existant.
- Réutiliser les contenus valides.
- Ne jamais écraser une page sans comparaison et sauvegarde.
- Définir les conventions de nommage, liens, métadonnées et statut documentaire.

## Arborescence cible

```text
wiki/
├── pro/
│   └── hub/
│       ├── README.md
│       ├── project-brief.md
│       ├── statement-of-work.md
│       ├── changelog.md
│       ├── decisions/
│       ├── open-points.md
│       ├── architecture/
│       ├── backend/
│       ├── frontend/
│       ├── database/
│       ├── team/
│       ├── skills/
│       ├── infrastructure/
│       ├── processes/
│       ├── tasks/
│       └── audits/
└── doc/
    ├── dev/
    │   ├── db/
    │   │   ├── postgresql/
    │   │   └── redis/
    │   ├── backend/
    │   │   ├── api/
    │   │   ├── websocket/
    │   │   ├── rust/
    │   │   ├── nodejs/
    │   │   ├── go/
    │   │   ├── php/
    │   │   ├── python/
    │   │   └── dotnet/
    │   └── frontend/
    │       ├── html/
    │       ├── css/
    │       └── js/
    │           ├── jquery/
    │           └── svelte/
    └── ideas/
        ├── cook/
        ├── voyage/
        └── philo/
```

Adapter les noms uniquement si une contrainte réelle l'exige, en documentant l'écart.

## Conventions documentaires

Chaque page utile devrait, selon le contexte, indiquer :
- titre et objectif ;
- statut : `VERIFIED`, `PROPOSED`, `HYPOTHESIS`, `DEPRECATED` ;
- date de dernière vérification ;
- sources et liens ;
- contenu synthétique et exploitable ;
- liens vers les pages liées ;
- propriétaire ou rôle responsable si pertinent.

Ne pas remplir les répertoires avec des pages vides. Créer les index et les pages réellement utiles. Distinguer explicitement les connaissances vérifiées des hypothèses et opinions.

## Mémoire

Définir trois niveaux :
1. **Mémoire organisationnelle** : gouvernance, règles, décisions, rôles et processus.
2. **Mémoire métier** : pratiques techniques, skills, guides et références.
3. **Mémoire projet** : contexte, objectifs, tâches, décisions, historique et livrables propres à chaque projet.

Vérifier comment Hermes consomme réellement ces mémoires. Ne pas dupliquer inutilement une même information dans plusieurs systèmes.

## Livrables

- Arborescence réelle.
- README et index navigables.
- Conventions de contribution.
- Pages de gouvernance et d'équipe.
- Rapport des contenus migrés, conservés, fusionnés ou reportés.
- Procédure de sauvegarde et de revue documentaire.

## Critères de sortie

Le wiki est navigable, cohérent, sourcé et sans remplissage artificiel. Les agents savent où lire et où écrire.
