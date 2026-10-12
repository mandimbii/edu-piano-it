# Changelog

Toutes les modifications notables de ce projet seront documentées dans ce fichier.

Le format est basé sur [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/),
et ce projet adhère au [Semantic Versioning](https://semver.org/lang/fr/).

## [1.0.0] - 2024-12-15

### 🎉 Version initiale

#### Ajouté
- **Menu principal** avec navigation vers tous les modules
- **Module Piano** avec 5 sous-modules :
  - Notes (12 notes chromatiques)
  - Accords (11 types)
  - Gammes (12 tonalités majeures)
  - Clavier virtuel paramétrable (C4→C7)
  - Théorie musicale (12 chapitres)
- **Module Informatique** avec 7 matières :
  - HTML, CSS, JavaScript, Python, PHP, MySQL, Java
  - Théorie générale (14 chapitres)
- **Système multilingue** : FR / MG / EN
- **Persistance de la langue** dans `preferences.mat`
- **Mise à jour à chaud** de la langue (sans fermeture des modules)
- **Fenêtre À PROPOS** moderne avec cartes
- **Plein écran** sur tous les modules
- **Raccourcis clavier** : Échap, F11, flèches ← →
- **Son synthétisé** avec harmoniques et enveloppe ADSR

#### Corrigé
- Signature des fonctions pour compatibilité avec `piano.m`
- Appel `theorieGenerale(f, codeLangue)` corrigé
- Retour au parent correct dans tous les modules

#### Supprimé
- `accord_clavier.m` (fichier orphelin)

---

## [À venir]

### Prévu
- Module **Exercices** (quiz interactif)
- Mode **sombre**
- Support de **nouvelles langues** (Espagnol, Italien)
- **Export PDF** des cours
- **Sauvegarde de la progression** utilisateur