# Étape 1 — Audit initial et reprise de l'existant

## Mission

Faire un état des lieux factuel de l'environnement Hermes et de tout le travail déjà engagé. Il s'agit d'une reprise contrôlée, pas d'une réinstallation.

## Règle absolue

**Ne rien supprimer, réinstaller, réinitialiser ou écraser pendant cet audit.** Ne pas modifier les permissions Docker. Toute modification non nécessaire à l'observation est interdite à cette étape.

## Travaux

### A. État de Hermes
- Identifier la version exacte, le mode d'installation et les chemins de configuration.
- Examiner la documentation locale et les capacités effectivement disponibles.
- Vérifier les mécanismes natifs : agents, sous-agents, délégation, sessions/groupes, mémoire, tâches persistantes, cron, outils, skills et permissions.
- Distinguer les fonctionnalités disponibles, absentes, expérimentales et non vérifiées.

### B. État de l'environnement
Auditer sans divulguer de secrets :
- OS, noyau, architecture, ressources CPU/RAM/disque ;
- utilisateur courant et permissions ;
- Python, Node.js, Git et outils de développement ;
- Docker/Compose uniquement en lecture d'information non privilégiée si accessible ;
- Portainer : disponibilité réseau/HTTPS, URL non secrète, état de connectivité ;
- GitHub : présence de GitHub CLI, configuration Git et méthode d'authentification existante ;
- modèles, fournisseurs, limites et configuration Hermes ;
- répertoires de travail, wiki, dépôts et sauvegardes existants.

Ne jamais afficher le contenu des tokens, clés, mots de passe ou fichiers secrets. Rapporter uniquement leur présence, leur emplacement protégé et leur validité si cela peut être vérifié sans les révéler.

### C. État du travail déjà commencé
- Inventorier les agents existants et leurs profils.
- Identifier les skills déjà installées et leurs versions.
- Recenser les fichiers de configuration, prompts, wiki, tâches et automatisations.
- Identifier ce qui fonctionne, ce qui est partiel, ce qui est cassé et ce qui est seulement prévu.
- Repérer les doublons et les divergences entre les consignes initiales et les consignes permanentes.

### D. Risques et écarts
Créer une liste priorisée :
- sécurité et permissions ;
- perte de données ;
- dette technique ;
- coûts et consommation de contexte ;
- dépendances manquantes ;
- limitations Hermes ;
- éléments nécessitant une décision de Chef.

## Livrables

Créer ou mettre à jour un rapport d'audit daté dans le wiki, si celui-ci existe déjà. Sinon, préparer le contenu et indiquer le chemin cible.

Inclure :
- inventaire ;
- matrice `existant / état / preuve / action recommandée` ;
- carte des dépendances ;
- liste des risques ;
- décisions à demander ;
- recommandation de séquencement.

## Critères de sortie

- Aucun élément existant n'a été détruit ou réinitialisé.
- Les capacités Hermes sont décrites avec preuves.
- Les contraintes de sécurité, en particulier Docker, sont respectées.
- Les inconnues sont explicitement signalées.
- Chef reçoit un rapport synthétique et une proposition de suite.

**Arrêt :** ne passe pas à l'installation ni à la reconfiguration avant validation du rapport d'audit.
