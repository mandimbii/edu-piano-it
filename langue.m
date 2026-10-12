function texte = langue(cle, codeLangue)

% ============================================================
% EDU-PIANO & IT
% SYSTEME CENTRAL DE TRADUCTION
%
% Langues :
%   FR = Francais
%   MG = Malagasy
%   EN = English
%
% Utilisation :
%   langue('piano','FR')
%   langue('piano','MG')
%   langue('piano','EN')
%
% ============================================================

if nargin < 2 || isempty(codeLangue)
    codeLangue = 'FR';
end

codeLangue = upper(codeLangue);

% Valeur par defaut
texte = cle;

% ============================================================
% FRANCAIS
% ============================================================

if strcmp(codeLangue,'FR')

    switch cle

        % ----------------------------------------------------
        % APPLICATION
        % ----------------------------------------------------

        case 'app_title'
            texte = 'EDU-PIANO & IT';

        case 'menu_principal'
            texte = 'MENU PRINCIPAL';

        case 'sous_titre_app'
            texte = 'APPLICATION EDUCATIVE - MUSIQUE ET INFORMATIQUE';

        case 'piano'
            texte = 'PIANO';

        case 'informatique'
            texte = 'INFORMATIQUE';

        case 'theorie'
            texte = 'THEORIE';

        case 'notes'
            texte = 'NOTES';

        case 'accords'
            texte = 'ACCORDS';

        case 'gammes'
            texte = 'GAMMES';

        case 'clavier'
            texte = 'CLAVIER';

        case 'a_propos'
            texte = 'A PROPOS';

        case 'langue'
            texte = 'LANGUE';

        case 'retour'
            texte = '<- RETOUR';

        case 'retour_piano'
            texte = '<- RETOUR AU PIANO';

        case 'quitter'
            texte = 'QUITTER';

        case 'plein_ecran'
            texte = 'PLEIN ECRAN';

        case 'taille_normale'
            texte = 'TAILLE NORMALE';

        case 'precedent'
            texte = '< PRECEDENT';

        case 'suivant'
            texte = 'SUIVANT >';

        case 'matieres'
            texte = 'MATIERES';

        case 'chapitres_titre'
            texte = 'CHAPITRES';

        case 'theorie_generale'
            texte = 'THEORIE GENERALE';

        case 'cours_theorique_general'
            texte = 'COURS THEORIQUE GENERAL DE L''INFORMATIQUE';

        case 'cours_general'
            texte = 'COURS GENERAL';

        % ----------------------------------------------------
        % PIANO
        % ----------------------------------------------------

        case 'ouvrir_piano'
            texte = 'OUVRIR LE PIANO';

        case 'ouvrir_notes'
            texte = 'OUVRIR LES NOTES';

        case 'ouvrir_accords'
            texte = 'OUVRIR LES ACCORDS';

        case 'ouvrir_gammes'
            texte = 'OUVRIR LES GAMMES';

        case 'ouvrir_clavier'
            texte = 'OUVRIR LE CLAVIER';

        case 'theorie_musicale'
            texte = 'THEORIE MUSICALE';

        case 'apprendre_musique'
            texte = 'Apprendre les notes, accords, gammes et theorie musicale.';

        % ----------------------------------------------------
        % NOTES
        % ----------------------------------------------------

        case 'comprendre_notes'
            texte = 'COMPRENDRE LES NOTES DE MUSIQUE';

        case 'notes_naturelles'
            texte = 'NOTES NATURELLES';

        case 'notes_noires'
            texte = 'NOTES NOIRES';

        case 'informations_note'
            texte = 'INFORMATIONS SUR LA NOTE';

        case 'explication'
            texte = 'EXPLICATION ET COMPREHENSION';

        case 'nom'
            texte = 'Nom';

        case 'nom_francais'
            texte = 'Nom francais';

        case 'notation_internationale'
            texte = 'Notation internationale';

        case 'frequence'
            texte = 'Frequence';

        case 'type'
            texte = 'Type';

        case 'note_naturelle'
            texte = 'Note naturelle';

        case 'nom_diese'
            texte = 'Nom diese';

        case 'equivalent_bemol'
            texte = 'Equivalent bemol';

        case 'note_noire'
            texte = 'Note noire';

        case 'clavier_c5_c7'
            texte = 'CLAVIER C5 -> C7';

        case 'clavier_c4_c6'
            texte = 'CLAVIER C4 -> C6';

        case 'clavier_c4_c7'
            texte = 'CLAVIER C4 -> C7';

        % ----------------------------------------------------
        % GAMMES
        % ----------------------------------------------------

        case 'tonique'
            texte = 'Tonique';

        case 'dominante'
            texte = 'Dominante';

        case 'demi_ton'
            texte = 'demi-ton';

        % ----------------------------------------------------
        % INFORMATIQUE
        % ----------------------------------------------------

        case 'cours_informatique'
            texte = 'COURS D''INFORMATIQUE';

        case 'html'
            texte = 'HTML';

        case 'css'
            texte = 'CSS';

        case 'javascript'
            texte = 'JavaScript';

        case 'python'
            texte = 'Python';

        case 'php'
            texte = 'PHP';

        case 'mysql'
            texte = 'MySQL';

        case 'java'
            texte = 'Java';

        % ----------------------------------------------------
        % A PROPOS
        % ----------------------------------------------------

        case 'a_propos_titre'
            texte = 'A PROPOS DE L''APPLICATION';

        case 'auteur'
            texte = 'Auteur';

        case 'etudiant'
            texte = 'Etudiant en Informatique - L2';

        case 'projet'
            texte = 'Projet';

        case 'email'
            texte = 'Email';

        case 'telephone'
            texte = 'Telephone';

        case 'fermer'
            texte = 'FERMER';

        % ----------------------------------------------------
        % MESSAGES
        % ----------------------------------------------------

        case 'bienvenue'
            texte = 'Bienvenue dans votre espace d''apprentissage !';

        case 'objectif'
            texte = 'OBJECTIF DE L''APPLICATION';

        case 'objectif_texte'
            texte = ['EDU-PIANO & IT est une application educative ', ...
                     'destinee a faciliter l''apprentissage de la musique ', ...
                     'et de l''informatique dans une interface simple et interactive.'];

        case 'developpe_octave'
            texte = 'Developpe avec GNU Octave';

        case 'informatique_l2'
            texte = 'Informatique - L2';

        case 'confirmation_quitter'
            texte = 'Voulez-vous vraiment quitter EDU-PIANO & IT ?';

        case 'oui'
            texte = 'Oui';

        case 'non'
            texte = 'Non';

    end

% ============================================================
% MALAGASY
% ============================================================

elseif strcmp(codeLangue,'MG')

    switch cle

        % ----------------------------------------------------
        % APPLICATION
        % ----------------------------------------------------

        case 'app_title'
            texte = 'EDU-PIANO & IT';

        case 'menu_principal'
            texte = 'LISITRA FOTOTRA';

        case 'sous_titre_app'
            texte = 'RINDRAMBAIKO FANABEAZANA - MOZIKA SY INFORMATIKA';

        case 'piano'
            texte = 'PIANO';

        case 'informatique'
            texte = 'INFORMATIKA';

        case 'theorie'
            texte = 'TEORIA';

        case 'notes'
            texte = 'NAOTY';

        case 'accords'
            texte = 'AKORDA';

        case 'gammes'
            texte = 'GAMME';

        case 'clavier'
            texte = 'KITENDRY';

        case 'a_propos'
            texte = 'MOMBA NY RINDRANA';

        case 'langue'
            texte = 'TENY';

        case 'retour'
            texte = '<- MIVERINA';

        case 'retour_piano'
            texte = '<- MIVERINA AMIN''NY PIANO';

        case 'quitter'
            texte = 'HIVOAKA';

        case 'plein_ecran'
            texte = 'EFIJERY FENO';

        case 'taille_normale'
            texte = 'HABE ARA-DRINDRANA';

        case 'precedent'
            texte = '< MIALOHA';

        case 'suivant'
            texte = 'MANARAKA >';

        case 'matieres'
            texte = 'LALANA';

        case 'chapitres_titre'
            texte = 'TOKO';

        case 'theorie_generale'
            texte = 'TEORIA ANKAPOBENY';

        case 'cours_theorique_general'
            texte = 'FIANARANA TEORIKA ANKAPOBENY MOMBA NY INFORMATIKA';

        case 'cours_general'
            texte = 'FIANARANA ANKAPOBENY';

        % ----------------------------------------------------
        % PIANO
        % ----------------------------------------------------

        case 'ouvrir_piano'
            texte = 'HIDITRA AMIN''NY PIANO';

        case 'ouvrir_notes'
            texte = 'HIDITRA AMIN''NY NAOTY';

        case 'ouvrir_accords'
            texte = 'HIDITRA AMIN''NY AKORDA';

        case 'ouvrir_gammes'
            texte = 'HIDITRA AMIN''NY GAMME';

        case 'ouvrir_clavier'
            texte = 'HIDITRA AMIN''NY KITENDRY';

        case 'theorie_musicale'
            texte = 'TEORIA MOZIKA';

        case 'apprendre_musique'
            texte = 'Mianatra ny naoty, akorda, gamme ary teoria mozika.';

        % ----------------------------------------------------
        % NOTES
        % ----------------------------------------------------

        case 'comprendre_notes'
            texte = 'FAHAFANTARANA NY NAOTY MOZIKA';

        case 'notes_naturelles'
            texte = 'NAOTY NATURELLES';

        case 'notes_noires'
            texte = 'NAOTY NOIRES';

        case 'informations_note'
            texte = 'MOMBA NY NAOTY';

        case 'explication'
            texte = 'FANAZAVANA SY FAHAFAHANA';

        case 'nom'
            texte = 'Anarana';

        case 'nom_francais'
            texte = 'Anarana amin''ny teny frantsay';

        case 'notation_internationale'
            texte = 'Fanoratana iraisam-pirenena';

        case 'frequence'
            texte = 'Frequence';

        case 'type'
            texte = 'Karazana';

        case 'note_naturelle'
            texte = 'Naoty naturelle';

        case 'nom_diese'
            texte = 'Anarana diese';

        case 'equivalent_bemol'
            texte = 'Mitovy amin''ny bemol';

        case 'note_noire'
            texte = 'Naoty noire';

        case 'clavier_c5_c7'
            texte = 'KITENDRY C5 -> C7';

        case 'clavier_c4_c6'
            texte = 'KITENDRY C4 -> C6';

        case 'clavier_c4_c7'
            texte = 'KITENDRY C4 -> C7';

        % ----------------------------------------------------
        % GAMMES
        % ----------------------------------------------------

        case 'tonique'
            texte = 'Tonique';

        case 'dominante'
            texte = 'Dominante';

        case 'demi_ton'
            texte = 'antsasaky ny ton';

        % ----------------------------------------------------
        % INFORMATIQUE
        % ----------------------------------------------------

        case 'cours_informatique'
            texte = 'FIANARANA INFORMATIKA';

        case 'html'
            texte = 'HTML';

        case 'css'
            texte = 'CSS';

        case 'javascript'
            texte = 'JavaScript';

        case 'python'
            texte = 'Python';

        case 'php'
            texte = 'PHP';

        case 'mysql'
            texte = 'MySQL';

        case 'java'
            texte = 'Java';

        % ----------------------------------------------------
        % A PROPOS
        % ----------------------------------------------------

        case 'a_propos_titre'
            texte = 'MOMBA NY RINDRANA';

        case 'auteur'
            texte = 'Mpanoratra';

        case 'etudiant'
            texte = 'Mpianatra Informatika - L2';

        case 'projet'
            texte = 'Tetikasa';

        case 'email'
            texte = 'Email';

        case 'telephone'
            texte = 'Laharana finday';

        case 'fermer'
            texte = 'AKATONA';

        % ----------------------------------------------------
        % MESSAGES
        % ----------------------------------------------------

        case 'bienvenue'
            texte = 'Tongasoa eto amin''ny sehatra fianaranao !';

        case 'objectif'
            texte = 'TANJON''NY RINDRANA';

        case 'objectif_texte'
            texte = ['EDU-PIANO & IT dia rindrambaiko fanabeazana ', ...
                     'natao hanamora ny fianarana mozika sy informatika ', ...
                     'amin''ny alalan''ny interface tsotra sy interactive.'];

        case 'developpe_octave'
            texte = 'Namboarina tamin''ny GNU Octave';

        case 'informatique_l2'
            texte = 'Informatika - L2';

        case 'confirmation_quitter'
            texte = 'Tena te hiala amin''ny EDU-PIANO & IT ve ianao ?';

        case 'oui'
            texte = 'Eny';

        case 'non'
            texte = 'Tsia';

    end

% ============================================================
% ENGLISH
% ============================================================

elseif strcmp(codeLangue,'EN')

    switch cle

        % ----------------------------------------------------
        % APPLICATION
        % ----------------------------------------------------

        case 'app_title'
            texte = 'EDU-PIANO & IT';

        case 'menu_principal'
            texte = 'MAIN MENU';

        case 'sous_titre_app'
            texte = 'EDUCATIONAL APPLICATION - MUSIC AND COMPUTER SCIENCE';

        case 'piano'
            texte = 'PIANO';

        case 'informatique'
            texte = 'COMPUTER SCIENCE';

        case 'theorie'
            texte = 'THEORY';

        case 'notes'
            texte = 'NOTES';

        case 'accords'
            texte = 'CHORDS';

        case 'gammes'
            texte = 'SCALES';

        case 'clavier'
            texte = 'KEYBOARD';

        case 'a_propos'
            texte = 'ABOUT';

        case 'langue'
            texte = 'LANGUAGE';

        case 'retour'
            texte = '<- BACK';

        case 'retour_piano'
            texte = '<- BACK TO PIANO';

        case 'quitter'
            texte = 'EXIT';

        case 'plein_ecran'
            texte = 'FULL SCREEN';

        case 'taille_normale'
            texte = 'NORMAL SIZE';

        case 'precedent'
            texte = '< PREVIOUS';

        case 'suivant'
            texte = 'NEXT >';

        case 'matieres'
            texte = 'SUBJECTS';

        case 'chapitres_titre'
            texte = 'CHAPTERS';

        case 'theorie_generale'
            texte = 'GENERAL THEORY';

        case 'cours_theorique_general'
            texte = 'GENERAL THEORETICAL COURSE IN COMPUTER SCIENCE';

        case 'cours_general'
            texte = 'GENERAL COURSE';

        % ----------------------------------------------------
        % PIANO
        % ----------------------------------------------------

        case 'ouvrir_piano'
            texte = 'OPEN PIANO';

        case 'ouvrir_notes'
            texte = 'OPEN NOTES';

        case 'ouvrir_accords'
            texte = 'OPEN CHORDS';

        case 'ouvrir_gammes'
            texte = 'OPEN SCALES';

        case 'ouvrir_clavier'
            texte = 'OPEN KEYBOARD';

        case 'theorie_musicale'
            texte = 'MUSIC THEORY';

        case 'apprendre_musique'
            texte = 'Learn notes, chords, scales and music theory.';

        % ----------------------------------------------------
        % NOTES
        % ----------------------------------------------------

        case 'comprendre_notes'
            texte = 'UNDERSTANDING MUSICAL NOTES';

        case 'notes_naturelles'
            texte = 'NATURAL NOTES';

        case 'notes_noires'
            texte = 'BLACK NOTES';

        case 'informations_note'
            texte = 'NOTE INFORMATION';

        case 'explication'
            texte = 'EXPLANATION AND UNDERSTANDING';

        case 'nom'
            texte = 'Name';

        case 'nom_francais'
            texte = 'French name';

        case 'notation_internationale'
            texte = 'International notation';

        case 'frequence'
            texte = 'Frequency';

        case 'type'
            texte = 'Type';

        case 'note_naturelle'
            texte = 'Natural note';

        case 'nom_diese'
            texte = 'Sharp name';

        case 'equivalent_bemol'
            texte = 'Flat equivalent';

        case 'note_noire'
            texte = 'Black note';

        case 'clavier_c5_c7'
            texte = 'KEYBOARD C5 -> C7';

        case 'clavier_c4_c6'
            texte = 'KEYBOARD C4 -> C6';

        case 'clavier_c4_c7'
            texte = 'KEYBOARD C4 -> C7';

        % ----------------------------------------------------
        % SCALES
        % ----------------------------------------------------

        case 'tonique'
            texte = 'Tonic';

        case 'dominante'
            texte = 'Dominant';

        case 'demi_ton'
            texte = 'semitone';

        % ----------------------------------------------------
        % COMPUTER SCIENCE
        % ----------------------------------------------------

        case 'cours_informatique'
            texte = 'COMPUTER SCIENCE COURSES';

        case 'html'
            texte = 'HTML';

        case 'css'
            texte = 'CSS';

        case 'javascript'
            texte = 'JavaScript';

        case 'python'
            texte = 'Python';

        case 'php'
            texte = 'PHP';

        case 'mysql'
            texte = 'MySQL';

        case 'java'
            texte = 'Java';

        % ----------------------------------------------------
        % ABOUT
        % ----------------------------------------------------

        case 'a_propos_titre'
            texte = 'ABOUT THE APPLICATION';

        case 'auteur'
            texte = 'Author';

        case 'etudiant'
            texte = 'Computer Science Student - L2';

        case 'projet'
            texte = 'Project';

        case 'email'
            texte = 'Email';

        case 'telephone'
            texte = 'Phone';

        case 'fermer'
            texte = 'CLOSE';

        % ----------------------------------------------------
        % MESSAGES
        % ----------------------------------------------------

        case 'bienvenue'
            texte = 'Welcome to your learning space!';

        case 'objectif'
            texte = 'APPLICATION OBJECTIVE';

        case 'objectif_texte'
            texte = ['EDU-PIANO & IT is an educational application ', ...
                     'designed to facilitate learning music and computer science ', ...
                     'through a simple and interactive interface.'];

        case 'developpe_octave'
            texte = 'Developed with GNU Octave';

        case 'informatique_l2'
            texte = 'Computer Science - L2';

        case 'confirmation_quitter'
            texte = 'Do you really want to exit EDU-PIANO & IT?';

        case 'oui'
            texte = 'Yes';

        case 'non'
            texte = 'No';

    end

end

end
