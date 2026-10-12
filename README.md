# 🎹 EDU-PIANO & IT 💻

> **Application éducative multilingue** pour apprendre la musique (piano) et l'informatique dans une interface simple, moderne et interactive.

![Statut](https://img.shields.io/badge/statut-stable-brightgreen)
![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Licence](https://img.shields.io/badge/licence-MIT-yellow)
![Octave](https://img.shields.io/badge/GNU%20Octave-6.0%2B-orange)

---

## 📋 Table des matières

- [Présentation](#-présentation)
- [Fonctionnalités](#-fonctionnalités)
- [Captures d'écran](#-captures-décran)
- [Architecture](#-architecture-du-projet)
- [Prérequis](#-prérequis)
- [Installation](#-installation)
- [Utilisation](#-utilisation)
- [Système multilingue](#-système-multilingue)
- [Raccourcis clavier](#-raccourcis-clavier)
- [Compatibilité](#-compatibilité)
- [Auteur](#-auteur)
- [Licence](#-licence)

---

## 🎯 Présentation

**EDU-PIANO & IT** est une application éducative développée avec **GNU Octave** qui combine :

- 🎵 **Apprentissage musical** : notes, accords, gammes, clavier virtuel et théorie musicale
- 💻 **Apprentissage informatique** : HTML, CSS, JavaScript, Python, PHP, MySQL, Java et théorie générale

L'application propose une interface unifiée, traduite en **3 langues** (Français, Malagasy, Anglais), adaptée aux débutants comme aux étudiants en informatique.

---

## ✨ Fonctionnalités

### 🎼 Module Musique

| Module | Description |
|--------|-------------|
| **Notes** | 12 notes (7 naturelles + 5 altérées) avec fréquences et équivalents enharmoniques |
| **Accords** | 11 types d'accords (majeur, mineur, 7ème, 9ème...) avec lecture audio |
| **Gammes** | 12 tonalités majeures avec affichage des degrés |
| **Clavier** | Clavier virtuel paramétrable (C4→C7 par défaut) avec sélecteur d'octaves |
| **Théorie musicale** | 12 chapitres : fondamentaux, intervalles, harmonie, rythme, pratique |

### 💻 Module Informatique

| Module | Description |
|--------|-------------|
| **HTML** | Structure, balises sémantiques, formulaires, multimédia |
| **CSS** | Sélecteurs, Box Model, Flexbox, Grid, Responsive Design |
| **JavaScript** | Variables, DOM, événements, validation |
| **Python** | Algorithmique, fonctions, POO, fichiers, exceptions |
| **PHP** | Sessions, formulaires, MySQL, CRUD |
| **MySQL** | Bases relationnelles, jointures, agrégation, modélisation |
| **Java** | POO, héritage, interfaces, polymorphisme, exceptions |
| **Théorie générale** | 14 chapitres couvrant les fondamentaux de l'informatique |

### 🌍 Fonctionnalités transverses

- ✅ **Multilingue** : FR / MG / EN
- ✅ **Persistance de la langue** (sauvegardée dans `preferences.mat`)
- ✅ **Mise à jour à chaud** de la langue (sans fermer les modules)
- ✅ **Plein écran** sur tous les modules
- ✅ **Raccourcis clavier** (Échap, F11, flèches ← →)
- ✅ **Son synthétisé** : aucune dépendance externe requise
- ✅ **Interface unifiée** : palette de couleurs cohérente

---

## 🖼️ Captures d'écran

*(Ajoutez vos propres captures d'écran dans un dossier `captures/`)*

```
📁 captures/
├── main.png             → Menu principal
├── piano.png            → Hub musical
├── notes.png            → Module notes
├── accords.png          → Module accords
├── gammes.png           → Module gammes
├── clavier.png          → Clavier virtuel
├── theorie.png          → Théorie musicale
├── informatique.png     → Hub informatique
├── theorie_generale.png → Cours théorique général
└── a_propos.png         → Fenêtre À PROPOS
```

---

## 🏗️ Architecture du projet

```
📁 EDU-PIANO-IT/
│
├── 📄 main.m                    → Point d'entrée (menu principal)
├── 📄 langue.m                  → Système central de traduction
├── 📄 preferences.mat           → Sauvegarde de la langue (généré)
│
├── 📁 MUSIQUE/
│   ├── piano.m                  → Hub musical
│   ├── notes.m                  → Module notes
│   ├── accords.m                → Module accords
│   ├── gammes.m                 → Module gammes
│   ├── clavier.m                → Clavier virtuel paramétrable
│   └── theorie.m                → Théorie musicale
│
├── 📁 INFORMATIQUE/
│   ├── informatique.m           → Hub informatique
│   └── theorieGenerale.m        → Cours théorique général
│
├── 📄 README.md                 → Ce fichier
├── 📄 LICENSE                   → Licence MIT
├── 📄 CHANGELOG.md              → Historique des versions
├── 📄 CONTRIBUTING.md           → Guide pour contributeurs
└── 📄 .gitignore                → Fichiers à ignorer par Git
```

> ⚠️ **Note** : Octave ne supporte pas les sous-dossiers pour les fonctions. Tous les fichiers `.m` doivent être **dans le même dossier** ou dans le `path` d'Octave.

---

## 🔧 Prérequis

- **GNU Octave** version **6.0 ou supérieure** ([télécharger](https://octave.org/download))
- Système d'exploitation : **Windows**, **Linux** ou **macOS**
- Espace disque : ~5 Mo
- RAM : 2 Go minimum recommandé
- **Périphérique audio** (recommandé pour le module Piano)

---

## 📥 Installation

### 1. Cloner le projet

```bash
git clone https://github.com/votre-utilisateur/edu-piano-it.git
cd edu-piano-it
```

Ou téléchargez le ZIP et extrayez-le.

### 2. Lancer Octave dans le dossier du projet

**Windows / macOS :**
```octave
cd('C:/chemin/vers/edu-piano-it')
```

**Linux :**
```bash
cd /chemin/vers/edu-piano-it
octave --gui
```

### 3. Vérifier que tous les fichiers sont présents

```octave
ls *.m
```

Vous devez voir :
```
accords.m  clavier.m  gammes.m  informatique.m  langue.m
main.m  notes.m  piano.m  theorie.m  theorieGenerale.m
```

### 4. Lancer l'application

```octave
main
```

---

## 🎮 Utilisation

### Démarrage

```octave
main
```

Le **menu principal** s'ouvre avec :

- **PIANO** : accès au hub musical
- **INFORMATIQUE** : accès au hub informatique
- **THEORIE** : accès direct à la théorie musicale
- **A PROPOS** : informations sur l'application
- **LANGUE** : sélection FR / MG / EN
- **PLEIN ECRAN** : bascule plein écran
- **QUITTER** : ferme l'application

### Navigation

```
main.m
  │
  ├── PIANO ──────► piano.m
  │                   ├── notes.m ──► gammes.m
  │                   ├── accords.m
  │                   ├── gammes.m
  │                   ├── clavier.m
  │                   └── theorie.m
  │
  ├── INFORMATIQUE ──► informatique.m
  │                     ├── HTML / CSS / JavaScript
  │                     ├── Python / PHP / MySQL / Java
  │                     └── theorieGenerale.m
  │
  └── THEORIE ────────► theorie.m
```

Chaque module possède un bouton **RETOUR** qui ramène au module parent.

---

## 🌍 Système multilingue

L'application supporte **3 langues** :

| Code | Langue | Drapeau |
|------|--------|---------|
| `FR` | Français | 🇫🇷 |
| `MG` | Malagasy | 🇲🇬 |
| `EN` | English | 🇬🇧 |

### Changer de langue

1. Depuis le menu principal, sélectionnez la langue dans la liste déroulante
2. Tous les textes se mettent à jour **instantanément**
3. La préférence est **sauvegardée** dans `preferences.mat`
4. Au prochain démarrage, la langue choisie est **automatiquement rechargée**
5. Les modules ouverts se mettent à jour **à chaud** (sans fermeture)

### Ajouter une nouvelle langue

1. Ouvrez `langue.m`
2. Ajoutez un nouveau bloc `elseif strcmp(codeLangue,'XX')`
3. Traduisez toutes les clés existantes
4. Ajoutez la langue dans le menu déroulant de `main.m`

---

## ⌨️ Raccourcis clavier

| Module | Touche | Action |
|--------|--------|--------|
| **Tous** | `Échap` | Sortie plein écran |
| **Tous** | `F11` | Bascule plein écran |
| **Théorie** | `←` / `→` | Chapitre précédent / suivant |
| **Théorie générale** | `←` / `→` | Partie précédente / suivante |
| **Informatique** | `←` / `→` | Matière/chapitre précédent/suivant |
| **Clavier** | `−` / `+` | Change l'étendue des octaves |

---

## 💻 Compatibilité

| Environnement | Statut |
|---------------|--------|
| **GNU Octave 6.x** | ✅ Testé |
| **GNU Octave 7.x** | ✅ Testé |
| **GNU Octave 8.x** | ✅ Testé |
| **MATLAB R2020+** | ⚠️ Partiel (certaines fonctions `uicontrol` peuvent différer) |
| **Windows 10/11** | ✅ Testé |
| **Linux (Ubuntu, Debian)** | ✅ Testé |
| **macOS** | ✅ Testé |

### Limitations connues

- Le son peut ne pas fonctionner sur certaines installations Linux sans serveur audio configuré
- `WindowState` n'est pas supporté sur les anciennes versions d'Octave → fallback automatique
- L'affichage peut varier légèrement selon la résolution d'écran

---

## 👨‍💻 Auteur

**MANDIMBINANTENAINA Cesaire Romuald**

- 🎓 Étudiant en Informatique - L2
- 📧 Email : mandimbiinantenaina@gmail.com
- 📱 Téléphone : 033 92 818 83 / 034 04 162 21

---

## 📄 Licence

Ce projet est distribué sous licence **MIT**. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

---

## 🙏 Remerciements

- **GNU Octave** pour l'environnement de développement
- **La communauté open source** pour l'inspiration
- **Tous les étudiants** qui utiliseront cette application

---

## 🚀 Feuille de route

- [x] Menu principal multilingue
- [x] Module Piano complet
- [x] Module Informatique complet
- [x] Système de persistance de la langue
- [x] Mise à jour à chaud de la langue
- [x] Fenêtre À PROPOS moderne
- [ ] Module **Exercices** (quiz interactif)
- [ ] Mode sombre
- [ ] Support de nouvelles langues (Espagnol, Italien)
- [ ] Export PDF des cours
- [ ] Sauvegarde de la progression

---

## 📞 Support

Pour toute question, suggestion ou bug :

1. Ouvrez une **issue** sur GitHub
2. Envoyez un email à **mandimbiinantenaina@gmail.com**
3. Contactez par téléphone : **033 92 818 83**

---

## ⭐ Contribuer

Les contributions sont les bienvenues ! Voir [CONTRIBUTING.md](CONTRIBUTING.md)

---

<div align="center">

**🎹 EDU-PIANO & IT 💻**

*Apprendre la musique et l'informatique, simplement.*

Fait avec ❤️ à Madagascar 🇲🇬

</div>