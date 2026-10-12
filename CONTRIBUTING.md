# Guide de contribution

Merci de votre intérêt pour **EDU-PIANO & IT** ! 🎉

## 🎯 Comment contribuer ?

### 1. Signaler un bug

Ouvrez une **issue** sur GitHub avec :
- Titre clair et descriptif
- Étapes pour reproduire le bug
- Comportement attendu vs observé
- Version d'Octave et OS utilisés

### 2. Proposer une amélioration

Ouvrez une **issue** avec le label `enhancement` et décrivez :
- La fonctionnalité souhaitée
- Pourquoi elle serait utile
- Comment vous l'imaginez

### 3. Soumettre du code

1. **Forkez** le projet
2. **Créez une branche** :
   ```bash
   git checkout -b feature/ma-fonctionnalite
   ```
3. **Codez** votre modification
4. **Testez** avec GNU Octave
5. **Committez** :
   ```bash
   git commit -m "Ajout de ma fonctionnalité"
   ```
6. **Poussez** :
   ```bash
   git push origin feature/ma-fonctionnalite
   ```
7. **Ouvrez une Pull Request**

## 📝 Conventions de code

### Style

- **Indentation** : 4 espaces
- **Nommage** : `camelCase` pour les variables, `snake_case` pour les fichiers
- **Commentaires** : en français, clairs et concis
- **Encodage** : UTF-8

### Structure d'un module

```matlab
function monModule(parentFigure, codeLangue)

    % 1. Verification des parametres
    if nargin < 1 || isempty(parentFigure)
        parentFigure = [];
    end
    if nargin < 2 || isempty(codeLangue)
        codeLangue = 'FR';
    end

    % 2. Palette de couleurs
    % ...

    % 3. Fenetre
    % ...

    % 4. Contenu
    % ...

    % 5. Callbacks
    % ...

end
```

### Compatibilité

- **GNU Octave 6.0+** obligatoire
- Éviter les fonctions MATLAB-only
- Utiliser `try/catch` pour la compatibilité

## 🌍 Ajouter une traduction

1. Ouvrez `langue.m`
2. Copiez le bloc `elseif strcmp(codeLangue,'EN')`
3. Remplacez `'EN'` par `'XX'` (code ISO de la langue)
4. Traduisez toutes les clés
5. Ajoutez la langue dans le menu de `main.m`

## ✅ Checklist avant Pull Request

- [ ] Le code fonctionne dans GNU Octave
- [ ] Aucune erreur à l'exécution
- [ ] Commentaires ajoutés si nécessaire
- [ ] Testé sur tous les modules concernés
- [ ] Documentation mise à jour si nécessaire

## 🐛 Bonnes pratiques

- **Un commit = une modification** logique
- **Messages de commit clairs** en français
- **Testez avant de pousser**
- **Respectez le style existant**

## 📞 Contact

- **Email** : mandimbiinantenaina@gmail.com
- **GitHub Issues** : pour les bugs et suggestions

---

Merci pour votre contribution ! 🎹💻