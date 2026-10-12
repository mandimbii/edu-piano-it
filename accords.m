function accords(parentFigure, codeLangue)
% ============================================================
% EDU-PIANO & IT
% MODULE : ACCORDS
% Compatible GNU Octave
% Fenetre normale : 1200 x 720
% ============================================================

    % --------------------------------------------------------
    % PARAMETRES
    % --------------------------------------------------------
    if nargin < 1
        parentFigure = [];
    end

    if nargin < 2 || isempty(codeLangue)
        codeLangue = 'FR';
    end

    % ========================================================
    % PALETTE
    % ========================================================

    fond      = [0.93 0.97 1.00];
    bleuCiel  = [0.20 0.65 0.95];
    bleuClair = [0.78 0.91 1.00];
    bleuFonce = [0.05 0.25 0.45];
    blanc     = [1.00 1.00 1.00];
    gris      = [0.35 0.40 0.45];
    grisClair = [0.97 0.98 1.00];
    noir      = [0.05 0.05 0.08];
    rouge     = [0.80 0.20 0.20];
    vert      = [0.20 0.65 0.40];

    % ========================================================
    % TAILLE NORMALE
    % ========================================================

    ecran = get(0,'ScreenSize');

    largeur = 1200;
    hauteur = 720;

    x = max(10,(ecran(3)-largeur)/2);
    y = max(30,(ecran(4)-hauteur)/2);

    positionNormale = [x y largeur hauteur];

    estPleinEcran = false;

    % ========================================================
    % FENETRE
    % ========================================================

    f = figure( ...
        'Name','EDU-PIANO - Accords', ...
        'NumberTitle','off', ...
        'Color',fond, ...
        'MenuBar','none', ...
        'ToolBar','none', ...
        'Position',positionNormale, ...
        'Resize','on', ...
        'KeyPressFcn',@toucheClavier, ...
        'CloseRequestFcn',@fermerFenetre);

    % ========================================================
    % DONNEES DES NOTES
    % ========================================================

    nomsNotes = { ...
        'DO','DO#','RE','RE#','MI','FA', ...
        'FA#','SOL','SOL#','LA','LA#','SI'};

    nomsInternationaux = { ...
        'C','C#','D','D#','E','F', ...
        'F#','G','G#','A','A#','B'};

    frequences = [ ...
        261.63 277.18 293.66 311.13 329.63 349.23 ...
        369.99 392.00 415.30 440.00 466.16 493.88];

    % ========================================================
    % TYPES D'ACCORDS
    % ========================================================

    typesAccords = { ...
        'Majeur', ...
        'Mineur', ...
        '6eme', ...
        'm6', ...
        'Sus2', ...
        'Sus4', ...
        'Aug', ...
        'Dim', ...
        '7eme', ...
        'Maj7', ...
        'm7', ...
        '9eme', ...
        'Maj9', ...
        'm9'};

    % ========================================================
    % INTERVALLES
    % ========================================================

    intervalles = { ...
        [0 4 7], ...
        [0 3 7], ...
        [0 4 7 9], ...
        [0 3 7 9], ...
        [0 2 7], ...
        [0 5 7], ...
        [0 4 8], ...
        [0 3 6], ...
        [0 4 7 10], ...
        [0 4 7 11], ...
        [0 3 7 10], ...
        [0 4 7 10 14], ...
        [0 4 7 11 14], ...
        [0 3 7 10 14]};

    % ========================================================
    % CLAVIER C5 -> C7
    % ========================================================

    nomsBlanches = { ...
        'C5','D5','E5','F5','G5','A5','B5', ...
        'C6','D6','E6','F6','G6','A6','B6','C7'};

    frequencesBlanches = [ ...
        523.25 587.33 659.25 698.46 783.99 880.00 987.77 ...
        1046.50 1174.66 1318.51 1396.91 1567.98 1760.00 ...
        1975.53 2093.00];

    nomsNoires = { ...
        'C#5','D#5','F#5','G#5','A#5', ...
        'C#6','D#6','F#6','G#6','A#6'};

    frequencesNoires = [ ...
        554.37 622.25 739.99 830.61 932.33 ...
        1108.73 1244.51 1479.98 1661.22 1864.66];

    positionsNoires = [1 2 4 5 6 8 9 11 12 13];

    % ========================================================
    % VARIABLES
    % ========================================================

    racineSelectionnee = 1;
    typeSelectionne = 1;

    boutonsNotes = cell(1,12);
    boutonsTypes = cell(1,length(typesAccords));

    texteNote = [];
    texteAccord = [];
    texteFrequence = [];
    texteInformation = [];
    texteExplication = [];

    touchesBlanches = cell(1,length(nomsBlanches));
    touchesNoires = cell(1,length(nomsNoires));

    boutonEcran = [];

    % ========================================================
    % FOND
    % ========================================================

    uipanel( ...
        'Parent',f, ...
        'Units','normalized', ...
        'Position',[0 0 1 1], ...
        'BackgroundColor',fond, ...
        'BorderType','none');

    % ========================================================
    % EN-TETE
    % ========================================================

    uicontrol( ...
        'Parent',f, ...
        'Style','text', ...
        'Units','normalized', ...
        'Position',[0.255 0.925 0.72 0.055], ...
        'String','EDU-PIANO', ...
        'FontSize',22, ...
        'FontWeight','bold', ...
        'ForegroundColor',bleuFonce, ...
        'BackgroundColor',fond, ...
        'HorizontalAlignment','left');

    uicontrol( ...
        'Parent',f, ...
        'Style','text', ...
        'Units','normalized', ...
        'Position',[0.255 0.89 0.72 0.035], ...
        'String',langueTexte('sous_titre',codeLangue), ...
        'FontSize',11, ...
        'ForegroundColor',gris, ...
        'BackgroundColor',fond, ...
        'HorizontalAlignment','left');

    % ========================================================
    % MENU GAUCHE
    % ========================================================

    uipanel( ...
        'Parent',f, ...
        'Units','normalized', ...
        'Position',[0 0 0.22 1], ...
        'BackgroundColor',bleuFonce, ...
        'BorderType','none');

    uicontrol( ...
        'Parent',f, ...
        'Style','text', ...
        'Units','normalized', ...
        'Position',[0.02 0.91 0.18 0.055], ...
        'String',langueTexte('accords',codeLangue), ...
        'FontSize',18, ...
        'FontWeight','bold', ...
        'ForegroundColor',blanc, ...
        'BackgroundColor',bleuFonce);

    uicontrol( ...
        'Parent',f, ...
        'Style','text', ...
        'Units','normalized', ...
        'Position',[0.02 0.87 0.18 0.03], ...
        'String',langueTexte('choisir_note',codeLangue), ...
        'FontSize',10, ...
        'ForegroundColor',bleuClair, ...
        'BackgroundColor',bleuFonce);

    % ========================================================
    % BOUTONS NOTES
    % ========================================================

    positionsY = [ ...
        0.81 0.755 0.70 0.645 0.59 0.535 ...
        0.48 0.425 0.37 0.315 0.26 0.205];

    for k = 1:12

        if mod(k,2) == 1
            couleur = bleuCiel;
        else
            couleur = bleuClair;
        end

        boutonsNotes{k} = uicontrol( ...
            'Parent',f, ...
            'Style','pushbutton', ...
            'Units','normalized', ...
            'Position',[0.025 positionsY(k) 0.17 0.043], ...
            'String',nomsNotes{k}, ...
            'FontSize',10, ...
            'FontWeight','bold', ...
            'ForegroundColor',bleuFonce, ...
            'BackgroundColor',couleur, ...
            'Callback',{@selectionNote,k});
    end

    % ========================================================
    % RETOUR AU PIANO
    % ========================================================

    uicontrol( ...
        'Parent',f, ...
        'Style','pushbutton', ...
        'Units','normalized', ...
        'Position',[0.025 0.055 0.17 0.055], ...
        'String',langueTexte('retour_piano',codeLangue), ...
        'FontSize',10, ...
        'FontWeight','bold', ...
        'ForegroundColor',blanc, ...
        'BackgroundColor',vert, ...
        'Callback',@retourPiano);

    % ========================================================
    % PANNEAU INFORMATION ACCORD
    % ========================================================

    uipanel( ...
        'Parent',f, ...
        'Units','normalized', ...
        'Position',[0.255 0.735 0.725 0.145], ...
        'BackgroundColor',blanc, ...
        'BorderType','line');

    texteNote = uicontrol( ...
        'Parent',f, ...
        'Style','text', ...
        'Units','normalized', ...
        'Position',[0.275 0.815 0.685 0.045], ...
        'String','DO', ...
        'FontSize',20, ...
        'FontWeight','bold', ...
        'ForegroundColor',bleuFonce, ...
        'BackgroundColor',blanc, ...
        'HorizontalAlignment','center');

    texteAccord = uicontrol( ...
        'Parent',f, ...
        'Style','text', ...
        'Units','normalized', ...
        'Position',[0.275 0.777 0.685 0.030], ...
        'String','DO Majeur', ...
        'FontSize',14, ...
        'FontWeight','bold', ...
        'ForegroundColor',bleuCiel, ...
        'BackgroundColor',blanc, ...
        'HorizontalAlignment','center');

    texteFrequence = uicontrol( ...
        'Parent',f, ...
        'Style','text', ...
        'Units','normalized', ...
        'Position',[0.275 0.745 0.685 0.022], ...
        'String','', ...
        'FontSize',10, ...
        'ForegroundColor',gris, ...
        'BackgroundColor',blanc, ...
        'HorizontalAlignment','center');

    % ========================================================
    % PANNEAU TYPES D'ACCORDS
    % ========================================================

    uipanel( ...
        'Parent',f, ...
        'Units','normalized', ...
        'Position',[0.255 0.57 0.725 0.145], ...
        'BackgroundColor',grisClair, ...
        'BorderType','line');

    uicontrol( ...
        'Parent',f, ...
        'Style','text', ...
        'Units','normalized', ...
        'Position',[0.27 0.675 0.69 0.025], ...
        'String',langueTexte('type_accord',codeLangue), ...
        'FontSize',11, ...
        'FontWeight','bold', ...
        'ForegroundColor',bleuFonce, ...
        'BackgroundColor',grisClair);

    for k = 1:length(typesAccords)

        if k <= 7
            ligne = 1;
            colonne = k;
        else
            ligne = 2;
            colonne = k - 7;
        end

        largeurBouton = 0.09;
        espace = 0.006;

        xBouton = 0.27 + ...
            (colonne-1)*(largeurBouton + espace);

        if ligne == 1
            yBouton = 0.625;
        else
            yBouton = 0.585;
        end

        boutonsTypes{k} = uicontrol( ...
            'Parent',f, ...
            'Style','pushbutton', ...
            'Units','normalized', ...
            'Position',[xBouton yBouton largeurBouton 0.032], ...
            'String',typesAccords{k}, ...
            'FontSize',8, ...
            'FontWeight','bold', ...
            'ForegroundColor',bleuFonce, ...
            'BackgroundColor',blanc, ...
            'Callback',{@selectionType,k});
    end

    % ========================================================
    % INFORMATIONS
    % ========================================================

    uipanel( ...
        'Parent',f, ...
        'Units','normalized', ...
        'Position',[0.255 0.445 0.725 0.105], ...
        'BackgroundColor',blanc, ...
        'BorderType','line');

    uicontrol( ...
        'Parent',f, ...
        'Style','text', ...
        'Units','normalized', ...
        'Position',[0.275 0.515 0.685 0.025], ...
        'String',langueTexte('information_accord',codeLangue), ...
        'FontSize',11, ...
        'FontWeight','bold', ...
        'ForegroundColor',bleuFonce, ...
        'BackgroundColor',blanc, ...
        'HorizontalAlignment','left');

    texteInformation = uicontrol( ...
        'Parent',f, ...
        'Style','edit', ...
        'Units','normalized', ...
        'Position',[0.275 0.458 0.685 0.055], ...
        'String','', ...
        'FontSize',9, ...
        'ForegroundColor',gris, ...
        'BackgroundColor',grisClair, ...
        'HorizontalAlignment','left', ...
        'Max',2, ...
        'Min',0, ...
        'Enable','inactive');

    % ========================================================
    % EXPLICATION
    % ========================================================

    uipanel( ...
        'Parent',f, ...
        'Units','normalized', ...
        'Position',[0.255 0.245 0.725 0.175], ...
        'BackgroundColor',blanc, ...
        'BorderType','line');

    uicontrol( ...
        'Parent',f, ...
        'Style','text', ...
        'Units','normalized', ...
        'Position',[0.275 0.385 0.685 0.025], ...
        'String',langueTexte('explication',codeLangue), ...
        'FontSize',11, ...
        'FontWeight','bold', ...
        'ForegroundColor',bleuFonce, ...
        'BackgroundColor',blanc, ...
        'HorizontalAlignment','left');

    texteExplication = uicontrol( ...
        'Parent',f, ...
        'Style','edit', ...
        'Units','normalized', ...
        'Position',[0.275 0.265 0.685 0.115], ...
        'String','', ...
        'FontSize',9, ...
        'ForegroundColor',gris, ...
        'BackgroundColor',grisClair, ...
        'HorizontalAlignment','left', ...
        'Max',6, ...
        'Min',0, ...
        'Enable','inactive');

    % ========================================================
    % CLAVIER
    % ========================================================

    cadreClavier = uipanel( ...
        'Parent',f, ...
        'Units','normalized', ...
        'Position',[0.255 0.08 0.725 0.14], ...
        'BackgroundColor',[0.88 0.90 0.94], ...
        'BorderType','line');

    % --------------------------------------------------------
    % TOUCHES BLANCHES
    % --------------------------------------------------------

    nbBlanches = length(nomsBlanches);
    largeurBlanche = 1/nbBlanches;

    for k = 1:nbBlanches

        xClavier = (k-1)*largeurBlanche;

        touchesBlanches{k} = uicontrol( ...
            'Parent',cadreClavier, ...
            'Style','pushbutton', ...
            'Units','normalized', ...
            'Position',[xClavier 0 largeurBlanche 1], ...
            'String',nomsBlanches{k}, ...
            'FontSize',8, ...
            'FontWeight','bold', ...
            'ForegroundColor',noir, ...
            'BackgroundColor',blanc, ...
            'Callback',{@selectionToucheBlanche,k});
    end

    % --------------------------------------------------------
    % TOUCHES NOIRES
    % --------------------------------------------------------

    largeurNoire = largeurBlanche * 0.58;
    hauteurNoire = 0.62;

    for k = 1:length(nomsNoires)

        pos = positionsNoires(k);

        centre = pos * largeurBlanche;

        xNoire = centre - largeurNoire/2;

        touchesNoires{k} = uicontrol( ...
            'Parent',cadreClavier, ...
            'Style','pushbutton', ...
            'Units','normalized', ...
            'Position',[xNoire 1-hauteurNoire largeurNoire hauteurNoire], ...
            'String',nomsNoires{k}, ...
            'FontSize',7, ...
            'FontWeight','bold', ...
            'ForegroundColor',blanc, ...
            'BackgroundColor',noir, ...
            'Callback',{@selectionToucheNoire,k});
    end

    % ========================================================
    % BOUTON PLEIN ECRAN / TAILLE NORMALE
    % ========================================================

    boutonEcran = uicontrol( ...
        'Parent',f, ...
        'Style','pushbutton', ...
        'Units','normalized', ...
        'Position',[0.82 0.02 0.16 0.045], ...
        'String',langueTexte('plein_ecran',codeLangue), ...
        'FontSize',9, ...
        'FontWeight','bold', ...
        'ForegroundColor',blanc, ...
        'BackgroundColor',bleuCiel, ...
        'Callback',@pleinEcran);

    % ========================================================
    % AFFICHAGE INITIAL
    % ========================================================

    afficherAccord();

    % ========================================================
    % SELECTION NOTE
    % ========================================================

    function selectionNote(~,~,indice)

        racineSelectionnee = indice;

        afficherAccord();

    end

    % ========================================================
    % SELECTION TYPE
    % ========================================================

    function selectionType(~,~,indice)

        typeSelectionne = indice;

        afficherAccord();

    end

    % ========================================================
    % TOUCHE BLANCHE
    % ========================================================

    function selectionToucheBlanche(~,~,indice)

        nom = nomsBlanches{indice};

        indiceNote = convertirNomEnIndice(nom);

        racineSelectionnee = indiceNote;

        afficherAccord();

        jouerFrequence(frequencesBlanches(indice));

    end

    % ========================================================
    % TOUCHE NOIRE
    % ========================================================

    function selectionToucheNoire(~,~,indice)

        nom = nomsNoires{indice};

        indiceNote = convertirNomEnIndice(nom);

        racineSelectionnee = indiceNote;

        afficherAccord();

        jouerFrequence(frequencesNoires(indice));

    end

    % ========================================================
    % AFFICHAGE DE L'ACCORD
    % ========================================================

    function afficherAccord()

        nomRacine = nomsNotes{racineSelectionnee};

        nomType = typesAccords{typeSelectionne};

        frequenceRacine = frequences(racineSelectionnee);

        notesAccord = intervalles{typeSelectionne};

        indicesNotes = mod( ...
            (racineSelectionnee - 1) + notesAccord,12) + 1;

        nomsAccord = cell(1,length(indicesNotes));

        for i = 1:length(indicesNotes)

            nomsAccord{i} = ...
                nomsNotes{indicesNotes(i)};

        end

        chaineNotes = '';

        for i = 1:length(nomsAccord)

            chaineNotes = ...
                [chaineNotes nomsAccord{i}];

            if i < length(nomsAccord)
                chaineNotes = ...
                    [chaineNotes ' - '];
            end

        end

        nomComplet = ...
            [nomRacine ' ' nomType];

        % ----------------------------------------------------
        % Affichage
        % ----------------------------------------------------

        set(texteNote, ...
            'String',nomRacine);

        set(texteAccord, ...
            'String',nomComplet);

        set(texteFrequence, ...
            'String',sprintf( ...
            '%s : %.2f Hz', ...
            langueTexte('frequence_fondamentale',codeLangue), ...
            frequenceRacine));

        information = sprintf( ...
            '%s : %s\n%s : %s\n%s : %d', ...
            langueTexte('accord',codeLangue), ...
            nomComplet, ...
            langueTexte('notes',codeLangue), ...
            chaineNotes, ...
            langueTexte('nombre_notes',codeLangue), ...
            length(nomsAccord));

        set(texteInformation, ...
            'String',information, ...
            'Value',1);

        explication = construireExplication( ...
            nomRacine, ...
            nomType, ...
            chaineNotes);

        set(texteExplication, ...
            'String',explication, ...
            'Value',1);

        % ----------------------------------------------------
        % Boutons notes
        % ----------------------------------------------------

        for i = 1:12

            if i == racineSelectionnee

                set(boutonsNotes{i}, ...
                    'BackgroundColor',vert, ...
                    'ForegroundColor',blanc);

            else

                if mod(i,2) == 1
                    couleur = bleuCiel;
                else
                    couleur = bleuClair;
                end

                set(boutonsNotes{i}, ...
                    'BackgroundColor',couleur, ...
                    'ForegroundColor',bleuFonce);

            end

        end

        % ----------------------------------------------------
        % Boutons types
        % ----------------------------------------------------

        for i = 1:length(typesAccords)

            if i == typeSelectionne

                set(boutonsTypes{i}, ...
                    'BackgroundColor',bleuCiel, ...
                    'ForegroundColor',blanc);

            else

                set(boutonsTypes{i}, ...
                    'BackgroundColor',blanc, ...
                    'ForegroundColor',bleuFonce);

            end

        end

        % ----------------------------------------------------
        % Clavier
        % ----------------------------------------------------

        mettreAJourClavier(indicesNotes);

    end

    % ========================================================
    % EXPLICATION
    % ========================================================

    function texte = construireExplication( ...
            racine,typeAccord,notes)

        switch typeAccord

            case 'Majeur'

                texte = sprintf([ ...
                    '%s majeur est constitue de la fondamentale, ' ...
                    'de la tierce majeure et de la quinte juste.\n' ...
                    'Formule : 1 - 3 - 5.\n' ...
                    'Notes : %s.\n' ...
                    'Sonorite stable, claire et ouverte.'], ...
                    racine,notes);

            case 'Mineur'

                texte = sprintf([ ...
                    '%s mineur est constitue de la fondamentale, ' ...
                    'de la tierce mineure et de la quinte juste.\n' ...
                    'Formule : 1 - b3 - 5.\n' ...
                    'Notes : %s.\n' ...
                    'La tierce mineure donne une couleur plus douce.'], ...
                    racine,notes);

            case '6eme'

                texte = sprintf([ ...
                    '%s 6eme ajoute une sixte a un accord majeur.\n' ...
                    'Formule : 1 - 3 - 5 - 6.\n' ...
                    'Notes : %s.'], ...
                    racine,notes);

            case 'm6'

                texte = sprintf([ ...
                    '%s m6 combine une triade mineure et une sixte.\n' ...
                    'Formule : 1 - b3 - 5 - 6.\n' ...
                    'Notes : %s.'], ...
                    racine,notes);

            case 'Sus2'

                texte = sprintf([ ...
                    '%s Sus2 remplace la tierce par une seconde majeure.\n' ...
                    'Formule : 1 - 2 - 5.\n' ...
                    'Notes : %s.'], ...
                    racine,notes);

            case 'Sus4'

                texte = sprintf([ ...
                    '%s Sus4 remplace la tierce par une quarte juste.\n' ...
                    'Formule : 1 - 4 - 5.\n' ...
                    'Notes : %s.'], ...
                    racine,notes);

            case 'Aug'

                texte = sprintf([ ...
                    '%s augmente contient une tierce majeure et ' ...
                    'une quinte augmentee.\n' ...
                    'Formule : 1 - 3 - #5.\n' ...
                    'Notes : %s.'], ...
                    racine,notes);

            case 'Dim'

                texte = sprintf([ ...
                    '%s diminue contient une tierce mineure et ' ...
                    'une quinte diminuee.\n' ...
                    'Formule : 1 - b3 - b5.\n' ...
                    'Notes : %s.'], ...
                    racine,notes);

            case '7eme'

                texte = sprintf([ ...
                    '%s 7eme contient une triade majeure et ' ...
                    'une septieme mineure.\n' ...
                    'Formule : 1 - 3 - 5 - b7.\n' ...
                    'Notes : %s.'], ...
                    racine,notes);

            case 'Maj7'

                texte = sprintf([ ...
                    '%s Maj7 contient une triade majeure et ' ...
                    'une septieme majeure.\n' ...
                    'Formule : 1 - 3 - 5 - 7.\n' ...
                    'Notes : %s.'], ...
                    racine,notes);

            case 'm7'

                texte = sprintf([ ...
                    '%s m7 contient une triade mineure et ' ...
                    'une septieme mineure.\n' ...
                    'Formule : 1 - b3 - 5 - b7.\n' ...
                    'Notes : %s.'], ...
                    racine,notes);

            case '9eme'

                texte = sprintf([ ...
                    '%s 9eme ajoute une neuvieme a un accord de 7eme.\n' ...
                    'Formule : 1 - 3 - 5 - b7 - 9.\n' ...
                    'Notes : %s.'], ...
                    racine,notes);

            case 'Maj9'

                texte = sprintf([ ...
                    '%s Maj9 associe Maj7 et neuvieme.\n' ...
                    'Formule : 1 - 3 - 5 - 7 - 9.\n' ...
                    'Notes : %s.'], ...
                    racine,notes);

            case 'm9'

                texte = sprintf([ ...
                    '%s m9 est un accord mineur avec septieme mineure ' ...
                    'et neuvieme.\n' ...
                    'Formule : 1 - b3 - 5 - b7 - 9.\n' ...
                    'Notes : %s.'], ...
                    racine,notes);

            otherwise

                texte = sprintf( ...
                    '%s %s\nNotes : %s.', ...
                    racine,typeAccord,notes);

        end

    end

    % ========================================================
    % MISE A JOUR DU CLAVIER
    % ========================================================

    function mettreAJourClavier(indicesNotes)

        % ----------------------------------------------------
        % Touches blanches
        % ----------------------------------------------------

        for k = 1:length(nomsBlanches)

            indiceChromatique = ...
                convertirNomEnIndice(nomsBlanches{k});

            present = false;

            for j = 1:length(indicesNotes)

                if indiceChromatique == indicesNotes(j)

                    present = true;

                end

            end

            if present

                set(touchesBlanches{k}, ...
                    'BackgroundColor',bleuCiel, ...
                    'ForegroundColor',blanc);

            else

                set(touchesBlanches{k}, ...
                    'BackgroundColor',blanc, ...
                    'ForegroundColor',noir);

            end

        end

        % ----------------------------------------------------
        % Touches noires
        % ----------------------------------------------------

        for k = 1:length(nomsNoires)

            indiceChromatique = ...
                convertirNomEnIndice(nomsNoires{k});

            present = false;

            for j = 1:length(indicesNotes)

                if indiceChromatique == indicesNotes(j)

                    present = true;

                end

            end

            if present

                set(touchesNoires{k}, ...
                    'BackgroundColor',vert, ...
                    'ForegroundColor',blanc);

            else

                set(touchesNoires{k}, ...
                    'BackgroundColor',noir, ...
                    'ForegroundColor',blanc);

            end

        end

    end

    % ========================================================
    % CONVERSION NOM -> INDEX
    % ========================================================

    function indice = convertirNomEnIndice(nom)

        if length(nom) >= 2

            deux = nom(1:2);

            switch deux

                case 'C#'
                    indice = 2;
                    return;

                case 'D#'
                    indice = 4;
                    return;

                case 'F#'
                    indice = 7;
                    return;

                case 'G#'
                    indice = 9;
                    return;

                case 'A#'
                    indice = 11;
                    return;

            end

        end

        switch nom(1)

            case 'C'
                indice = 1;

            case 'D'
                indice = 3;

            case 'E'
                indice = 5;

            case 'F'
                indice = 6;

            case 'G'
                indice = 8;

            case 'A'
                indice = 10;

            case 'B'
                indice = 12;

            otherwise
                indice = 1;

        end

    end

    % ========================================================
    % SON
    % ========================================================

    function jouerFrequence(freq)

        try

            fs = 44100;

            duree = 0.45;

            t = 0:1/fs:duree;

            enveloppe = exp(-4*t);

            signal = ...
                0.65*sin(2*pi*freq*t) + ...
                0.22*sin(2*pi*2*freq*t) + ...
                0.08*sin(2*pi*3*freq*t) + ...
                0.05*sin(2*pi*4*freq*t);

            signal = signal .* enveloppe;

            sound(signal,fs);

        catch

        end

    end

    % ========================================================
    % JOUER L'ACCORD
    % ========================================================

    function jouerAccord()

        notesAccord = intervalles{typeSelectionne};

        freqRacine = frequences(racineSelectionnee);

        for i = 1:length(notesAccord)

            freq = freqRacine * ...
                2^(notesAccord(i)/12);

            jouerFrequence(freq);

            pause(0.04);

        end

    end

    % ========================================================
    % DOUBLE CLIC SUR L'ACCORD
    % ========================================================

    function jouerAccordDepuisInterface(~,~)

        jouerAccord();

    end

    % ========================================================
    % RETOUR AU PIANO
    % ========================================================

    function retourPiano(~,~)

        try

            if ~isempty(parentFigure) && ishandle(parentFigure)

                set(f,'Visible','off');

                set(parentFigure,'Visible','on');

                figure(parentFigure);

            else

                delete(f);

            end

        catch

            try
                delete(f);
            catch
            end

        end

    end

    % ========================================================
    % PLEIN ECRAN / TAILLE NORMALE
    % ========================================================

    function pleinEcran(~,~)

        if ~estPleinEcran

            % -----------------------------------------------
            % PLEIN ECRAN
            % -----------------------------------------------

            try

                set(f,'WindowState','maximized');

                estPleinEcran = true;

                set(boutonEcran, ...
                    'String',langueTexte( ...
                    'taille_normale',codeLangue));

            catch

                ecranActuel = get(0,'ScreenSize');

                set(f,'Position',ecranActuel);

                estPleinEcran = true;

                set(boutonEcran, ...
                    'String',langueTexte( ...
                    'taille_normale',codeLangue));

            end

        else

            % -----------------------------------------------
            % TAILLE NORMALE = 1200 x 720
            % -----------------------------------------------

            try

                set(f,'WindowState','normal');

            catch

            end

            set(f,'Position',positionNormale);

            estPleinEcran = false;

            set(boutonEcran, ...
                'String',langueTexte( ...
                'plein_ecran',codeLangue));

        end

    end

    % ========================================================
    % TOUCHE ECHAP
    % ========================================================

    function toucheClavier(~,event)

        if strcmpi(event.Key,'escape')

            try

                set(f,'WindowState','normal');

            catch

            end

            set(f,'Position',positionNormale);

            estPleinEcran = false;

            set(boutonEcran, ...
                'String',langueTexte( ...
                'plein_ecran',codeLangue));

        end

    end

    % ========================================================
    % FERMER
    % ========================================================

    function fermerFenetre(~,~)

        try

            if ~isempty(parentFigure) && ...
                    ishandle(parentFigure)

                set(parentFigure,'Visible','on');

            end

        catch

        end

        try

            delete(f);

        catch

        end

    end

    % ========================================================
    % TEXTES
    % ========================================================

    function texte = langueTexte(cle,langueCode)

        % Les textes principaux utilisent langue.m lorsqu'une
        % cle correspondante existe.

        try

            texte = langue(cle,langueCode);

        catch

            % Valeurs de secours

            switch cle

                case 'accords'
                    texte = 'ACCORDS';

                case 'sous_titre'
                    texte = 'APPRENTISSAGE DES ACCORDS';

                case 'choisir_note'
                    texte = 'Choisir une note';

                case 'retour_piano'
                    texte = 'RETOUR AU PIANO';

                case 'type_accord'
                    texte = 'TYPE D''ACCORD';

                case 'information_accord'
                    texte = 'INFORMATIONS SUR L''ACCORD';

                case 'explication'
                    texte = 'EXPLICATION PEDAGOGIQUE';

                case 'frequence_fondamentale'
                    texte = 'Frequence fondamentale';

                case 'accord'
                    texte = 'Accord';

                case 'notes'
                    texte = 'Notes';

                case 'nombre_notes'
                    texte = 'Nombre de notes';

                case 'plein_ecran'
                    texte = 'PLEIN ECRAN';

                case 'taille_normale'
                    texte = 'TAILLE NORMALE';

                otherwise
                    texte = cle;

            end

        end

    end

end
