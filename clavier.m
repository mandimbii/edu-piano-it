function clavier(parentFigure, codeLangue)

% ============================================================
% EDU-PIANO & IT
% MODULE : CLAVIER avec SELECTEUR D'OCTAVES
%
% Compatible GNU Octave
% Fenetre standard : 1200 x 720
%
% NOUVEAU : boutons - / + dans l'interface
%   - Permet de changer l'etendue du clavier a la volee
%   - L'octave de DEBUT reste fixe
%   - L'octave de FIN augmente / diminue
%
% Bornes autorisees :
%   OCTAVE_DEBUT : 2 a 6
%   OCTAVE_FIN   : OCTAVE_DEBUT a 7
%
% ============================================================


% ============================================================
% 1. PARAMETRES INITIAUX
% ============================================================

OCTAVE_DEBUT = 4;    % Fixe : octave la plus grave
OCTAVE_FIN   = 5;    % Variable : octave la plus aigue

% Bornes globales
OCTAVE_MIN = 1;
OCTAVE_MAX = 7;


% ============================================================
% 2. PARAMETRES DE LA FONCTION
% ============================================================

if nargin < 1 || isempty(parentFigure)
    parentFigure = [];
end

if nargin < 2 || isempty(codeLangue)
    codeLangue = 'FR';
end

codeLangue = upper(codeLangue);

% Verification des bornes
OCTAVE_DEBUT = max(OCTAVE_MIN, min(OCTAVE_MAX, OCTAVE_DEBUT));
OCTAVE_FIN   = max(OCTAVE_DEBUT, min(OCTAVE_MAX, OCTAVE_FIN));


% ============================================================
% 3. COULEURS
% ============================================================

fond       = [0.93 0.97 1.00];
bleuCiel   = [0.20 0.65 0.95];
bleuClair  = [0.78 0.91 1.00];
bleuFonce  = [0.05 0.25 0.45];
blanc      = [1.00 1.00 1.00];
gris       = [0.35 0.40 0.45];
grisClair  = [0.97 0.98 1.00];
noir       = [0.05 0.05 0.08];
vert       = [0.20 0.65 0.40];
rouge      = [0.80 0.20 0.20];
orange     = [0.95 0.55 0.15];


% ============================================================
% 4. DONNEES MUSICALES (constantes)
% ============================================================

nomsFR    = {'DO','RE','MI','FA','SOL','LA','SI'};
nomsInter = {'C','D','E','F','G','A','B'};

indexChromatiqueNaturelle = [0 2 4 5 7 9 11];

nomsDiese      = {'DO#','RE#','FA#','SOL#','LA#'};
nomsDieseInter = {'C#','D#','F#','G#','A#'};
indexChromatiqueDiese = [1 3 6 8 10];
indexBlancheGaucheParDiese = [1 2 4 5 6];

% Fonction de calcul de frequence (A4 = 440 Hz)
calculFrequence = @(octave, idxChrom) ...
    440 * 2^(((octave+1)*12 + idxChrom - 69) / 12);


% ============================================================
% 5. FENETRE 1200 x 720
% ============================================================

largeur = 1200;
hauteur = 720;

try

    ecran = get(0,'ScreenSize');

    posX = max(1,round((ecran(3)-largeur)/2));
    posY = max(1,round((ecran(4)-hauteur)/2));

catch

    ecran = [1 1 1280 800];
    posX = 100;
    posY = 50;

end

positionNormale = [posX posY largeur hauteur];

estPleinEcran = false;


% ============================================================
% 6. FENETRE
% ============================================================

f = figure( ...
    'Name','EDU-PIANO & IT - Clavier', ...
    'NumberTitle','off', ...
    'MenuBar','none', ...
    'ToolBar','none', ...
    'Color',fond, ...
    'Position',positionNormale, ...
    'Resize','on', ...
    'KeyPressFcn',@toucheClavier, ...
    'CloseRequestFcn',@fermerFenetre);


% ============================================================
% 7. FOND
% ============================================================

uipanel( ...
    'Parent',f, ...
    'Units','normalized', ...
    'Position',[0 0 1 1], ...
    'BackgroundColor',fond, ...
    'BorderType','none');


% ============================================================
% 8. MENU GAUCHE
% ============================================================

panneauMenu = uipanel( ...
    'Parent',f, ...
    'Units','normalized', ...
    'Position',[0 0 0.18 1], ...
    'BackgroundColor',bleuFonce, ...
    'BorderType','none');


uicontrol( ...
    'Parent',panneauMenu, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.05 0.935 0.90 0.045], ...
    'String','CLAVIER', ...
    'FontSize',18, ...
    'FontWeight','bold', ...
    'ForegroundColor',blanc, ...
    'BackgroundColor',bleuFonce);


% Texte dynamique : etendue actuelle
texteEtendue = uicontrol( ...
    'Parent',panneauMenu, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.05 0.895 0.90 0.030], ...
    'String','', ...
    'FontSize',11, ...
    'FontWeight','bold', ...
    'ForegroundColor',bleuClair, ...
    'BackgroundColor',bleuFonce);


uicontrol( ...
    'Parent',panneauMenu, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.05 0.835 0.90 0.04], ...
    'String',{ ...
        'Cliquez sur une touche', ...
        'pour entendre la note'}, ...
    'FontSize',9, ...
    'ForegroundColor',blanc, ...
    'BackgroundColor',bleuFonce);


% ============================================================
% 9. SELECTEUR D'OCTAVES (- / +)
% ============================================================

uicontrol( ...
    'Parent',panneauMenu, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.05 0.77 0.90 0.035], ...
    'String','NOMBRE D''OCTAVES', ...
    'FontSize',9, ...
    'FontWeight','bold', ...
    'ForegroundColor',bleuClair, ...
    'BackgroundColor',bleuFonce);


% ------------------------------------------------------------
% Bouton -
% ------------------------------------------------------------

btnMoins = uicontrol( ...
    'Parent',panneauMenu, ...
    'Style','pushbutton', ...
    'Units','normalized', ...
    'Position',[0.08 0.705 0.22 0.055], ...
    'String','-', ...
    'FontSize',18, ...
    'FontWeight','bold', ...
    'ForegroundColor',blanc, ...
    'BackgroundColor',bleuCiel, ...
    'Callback',@diminuerOctave);


% ------------------------------------------------------------
% Affichage du nombre d'octaves
% ------------------------------------------------------------

texteNbOctaves = uicontrol( ...
    'Parent',panneauMenu, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.32 0.705 0.36 0.055], ...
    'String','2', ...
    'FontSize',16, ...
    'FontWeight','bold', ...
    'ForegroundColor',blanc, ...
    'BackgroundColor',bleuFonce);


% ------------------------------------------------------------
% Bouton +
% ------------------------------------------------------------

btnPlus = uicontrol( ...
    'Parent',panneauMenu, ...
    'Style','pushbutton', ...
    'Units','normalized', ...
    'Position',[0.70 0.705 0.22 0.055], ...
    'String','+', ...
    'FontSize',18, ...
    'FontWeight','bold', ...
    'ForegroundColor',blanc, ...
    'BackgroundColor',bleuCiel, ...
    'Callback',@augmenterOctave);


% ============================================================
% 10. BOUTON RETOUR
% ============================================================

uicontrol( ...
    'Parent',panneauMenu, ...
    'Style','pushbutton', ...
    'Units','normalized', ...
    'Position',[0.08 0.10 0.84 0.062], ...
    'String',langue('retour_piano',codeLangue), ...
    'FontSize',10, ...
    'FontWeight','bold', ...
    'ForegroundColor',blanc, ...
    'BackgroundColor',bleuCiel, ...
    'Callback',@retourPiano);


% ============================================================
% 11. BOUTON QUITTER
% ============================================================

uicontrol( ...
    'Parent',panneauMenu, ...
    'Style','pushbutton', ...
    'Units','normalized', ...
    'Position',[0.08 0.025 0.84 0.055], ...
    'String',langue('quitter',codeLangue), ...
    'FontSize',9, ...
    'FontWeight','bold', ...
    'ForegroundColor',blanc, ...
    'BackgroundColor',rouge, ...
    'Callback',@quitterClavier);


% ============================================================
% 12. TITRE PRINCIPAL
% ============================================================

uicontrol( ...
    'Parent',f, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.20 0.925 0.77 0.05], ...
    'String','CLAVIER DE PIANO', ...
    'FontSize',22, ...
    'FontWeight','bold', ...
    'ForegroundColor',bleuFonce, ...
    'BackgroundColor',fond);


% Texte dynamique du sous-titre
texteSousTitre = uicontrol( ...
    'Parent',f, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.20 0.885 0.77 0.032], ...
    'String','', ...
    'FontSize',11, ...
    'ForegroundColor',gris, ...
    'BackgroundColor',fond);


% ============================================================
% 13. PANNEAU INFORMATIONS
% ============================================================

panneauInfo = uipanel( ...
    'Parent',f, ...
    'Units','normalized', ...
    'Position',[0.20 0.75 0.77 0.10], ...
    'BackgroundColor',blanc, ...
    'BorderType','line');


texteNote = uicontrol( ...
    'Parent',panneauInfo, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.02 0.55 0.96 0.35], ...
    'String','Aucune note selectionnee', ...
    'FontSize',16, ...
    'FontWeight','bold', ...
    'ForegroundColor',bleuCiel, ...
    'BackgroundColor',blanc);


texteFrequence = uicontrol( ...
    'Parent',panneauInfo, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.02 0.10 0.96 0.35], ...
    'String',langue('frequence',codeLangue), ...
    'FontSize',12, ...
    'ForegroundColor',gris, ...
    'BackgroundColor',blanc);


% ============================================================
% 14. PANNEAU CLAVIER (conteneur fixe)
% ============================================================

panneauClavier = uipanel( ...
    'Parent',f, ...
    'Units','normalized', ...
    'Position',[0.20 0.22 0.77 0.48], ...
    'BackgroundColor',[0.15 0.15 0.15], ...
    'BorderType','none');


% ============================================================
% 15. INFORMATION FREQUENCES
% ============================================================

texteFreqInfo = uicontrol( ...
    'Parent',f, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.20 0.14 0.77 0.045], ...
    'String','', ...
    'FontSize',10, ...
    'ForegroundColor',gris, ...
    'BackgroundColor',fond);


% ============================================================
% 16. BOUTON PLEIN ECRAN
% ============================================================

btnPleinEcran = uicontrol( ...
    'Parent',f, ...
    'Style','pushbutton', ...
    'Units','normalized', ...
    'Position',[0.20 0.04 0.20 0.05], ...
    'String',langue('plein_ecran',codeLangue), ...
    'FontSize',9, ...
    'FontWeight','bold', ...
    'ForegroundColor',blanc, ...
    'BackgroundColor',vert, ...
    'Callback',@pleinEcran);


% ============================================================
% 17. PIED DE PAGE
% ============================================================

uicontrol( ...
    'Parent',f, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.45 0.04 0.52 0.05], ...
    'String','EDU-PIANO & IT  -  Module Clavier', ...
    'FontSize',9, ...
    'ForegroundColor',gris, ...
    'BackgroundColor',fond, ...
    'HorizontalAlignment','right');


% ============================================================
% 18. VARIABLES POUR LE CLAVIER DYNAMIQUE
% ============================================================

listeBoutonsClavier = [];   % Tous les uicontrol du clavier


% ============================================================
% 19. CONSTRUCTION INITIALE
% ============================================================

construireClavier();


% ============================================================
% 20. FONCTION : CONSTRUIRE LE CLAVIER
% ============================================================

function construireClavier()

    % --------------------------------------------------------
    % Supprimer les anciens boutons du clavier
    % --------------------------------------------------------

    for k = 1:length(listeBoutonsClavier)

        try

            if ishandle(listeBoutonsClavier(k))
                delete(listeBoutonsClavier(k));
            end

        catch

        end

    end

    listeBoutonsClavier = [];

    % --------------------------------------------------------
    % Generer les donnees des touches
    % --------------------------------------------------------

    % Touches blanches
    nomsBlancFR    = {};
    nomsBlancInter = {};
    freqBlanc      = [];

    for oct = OCTAVE_DEBUT:OCTAVE_FIN

        for k = 1:7

            nomsBlancFR{end+1}    = nomsFR{k};
            nomsBlancInter{end+1} = [nomsInter{k} num2str(oct)];
            freqBlanc(end+1)      = ...
                calculFrequence(oct, indexChromatiqueNaturelle(k));

        end

    end

    % DO final
    nomsBlancFR{end+1}    = nomsFR{1};
    nomsBlancInter{end+1} = [nomsInter{1} num2str(OCTAVE_FIN+1)];
    freqBlanc(end+1)      = calculFrequence(OCTAVE_FIN+1, 0);

    nombreBlanches = length(nomsBlancFR);
    largeurBlanche = 1 / nombreBlanches;

    % Touches noires
    nomsNoirFR    = {};
    nomsNoirInter = {};
    freqNoir      = [];
    positions     = [];

    decalage = 0.65;

    for oct = OCTAVE_DEBUT:OCTAVE_FIN

        offsetOctave = (oct - OCTAVE_DEBUT) * 7;

        for k = 1:5

            nomsNoirFR{end+1}    = nomsDiese{k};
            nomsNoirInter{end+1} = [nomsDieseInter{k} num2str(oct)];
            freqNoir(end+1)      = ...
                calculFrequence(oct, indexChromatiqueDiese(k));

            indexGaucheGlobal = ...
                offsetOctave + indexBlancheGaucheParDiese(k);

            position = ...
                (indexGaucheGlobal - 1) * largeurBlanche + ...
                decalage * largeurBlanche;

            positions(end+1) = position;

        end

    end

    nombreNoires = length(nomsNoirFR);

    % --------------------------------------------------------
    % Taille de police adaptative
    % --------------------------------------------------------

    if nombreBlanches <= 15
        taillePB = 9;
        taillePN = 7;
    elseif nombreBlanches <= 22
        taillePB = 8;
        taillePN = 6;
    elseif nombreBlanches <= 29
        taillePB = 7;
        taillePN = 5;
    else
        taillePB = 6;
        taillePN = 4;
    end

    % --------------------------------------------------------
    % Taille des touches noires
    % --------------------------------------------------------

    largeurNoire = largeurBlanche * 0.62;
    hauteurNoire = 0.62;

    % --------------------------------------------------------
    % Creer les touches blanches
    % --------------------------------------------------------

    for i = 1:nombreBlanches

        h = uicontrol( ...
            'Parent',panneauClavier, ...
            'Style','pushbutton', ...
            'String',{ nomsBlancFR{i}; nomsBlancInter{i}}, ...
            'FontSize',taillePB, ...
            'FontWeight','bold', ...
            'BackgroundColor',blanc, ...
            'ForegroundColor',noir, ...
            'Units','normalized', ...
            'Position',[ ...
                (i-1)*largeurBlanche, ...
                0, ...
                largeurBlanche, ...
                1], ...
            'Callback',{@clicBlanche, ...
                nomsBlancFR{i}, ...
                nomsBlancInter{i}, ...
                freqBlanc(i)});

        listeBoutonsClavier(end+1) = h;

    end

    % --------------------------------------------------------
    % Creer les touches noires
    % --------------------------------------------------------

    for i = 1:nombreNoires

        h = uicontrol( ...
            'Parent',panneauClavier, ...
            'Style','pushbutton', ...
            'String',{ nomsNoirFR{i}; nomsNoirInter{i}}, ...
            'FontSize',taillePN, ...
            'FontWeight','bold', ...
            'ForegroundColor',blanc, ...
            'BackgroundColor',noir, ...
            'Units','normalized', ...
            'Position',[ ...
                positions(i), ...
                1-hauteurNoire, ...
                largeurNoire, ...
                hauteurNoire], ...
            'Callback',{@clicNoire, ...
                nomsNoirFR{i}, ...
                nomsNoirInter{i}, ...
                freqNoir(i)});

        listeBoutonsClavier(end+1) = h;

    end

    % --------------------------------------------------------
    % Mise a jour des textes
    % --------------------------------------------------------

    % Etendue dans le menu
    set(texteEtendue, ...
        'String',sprintf('C%d  ->  C%d', ...
        OCTAVE_DEBUT, OCTAVE_FIN+1));

    % Nombre d'octaves
    nbOctaves = OCTAVE_FIN - OCTAVE_DEBUT + 1;

    set(texteNbOctaves, ...
        'String',num2str(nbOctaves));

    % Sous-titre
    if nbOctaves == 1
        motOctave = 'Une octave';
    else
        motOctave = sprintf('%d octaves', nbOctaves);
    end

    set(texteSousTitre, ...
        'String',sprintf('%s : C%d a C%d - Cliquez sur une touche', ...
        motOctave, OCTAVE_DEBUT, OCTAVE_FIN+1));

    % Info frequences
    set(texteFreqInfo, ...
        'String',sprintf( ...
        'C%d = %.2f Hz     |     A4 = 440.00 Hz     |     C%d = %.2f Hz', ...
        OCTAVE_DEBUT, freqBlanc(1), ...
        OCTAVE_FIN+1, freqBlanc(end)));

    % --------------------------------------------------------
    % Etat des boutons - / +
    % --------------------------------------------------------

    % Bouton - : actif si on peut reduire
    if OCTAVE_FIN > OCTAVE_DEBUT
        set(btnMoins,'Enable','on','BackgroundColor',bleuCiel);
    else
        set(btnMoins,'Enable','off','BackgroundColor',gris);
    end

    % Bouton + : actif si on peut augmenter
    if OCTAVE_FIN < OCTAVE_MAX
        set(btnPlus,'Enable','on','BackgroundColor',bleuCiel);
    else
        set(btnPlus,'Enable','off','BackgroundColor',gris);
    end

end


% ============================================================
% 21. CALLBACK : AUGMENTER L'OCTAVE
% ============================================================

function augmenterOctave(~,~)

    if OCTAVE_FIN < OCTAVE_MAX

        OCTAVE_FIN = OCTAVE_FIN + 1;

        construireClavier();

    end

end


% ============================================================
% 22. CALLBACK : DIMINUER L'OCTAVE
% ============================================================

function diminuerOctave(~,~)

    if OCTAVE_FIN > OCTAVE_DEBUT

        OCTAVE_FIN = OCTAVE_FIN - 1;

        construireClavier();

    end

end


% ============================================================
% 23. CALLBACK : CLIC SUR TOUCHE BLANCHE
% ============================================================

function clicBlanche(~,~,nomFR,nomInter,freq)

    jouerNote(nomFR, nomInter, freq);

end


% ============================================================
% 24. CALLBACK : CLIC SUR TOUCHE NOIRE
% ============================================================

function clicNoire(~,~,nomFR,nomInter,freq)

    jouerNote(nomFR, nomInter, freq);

end


% ============================================================
% 25. JOUER UNE NOTE
% ============================================================

function jouerNote(nomFrancais, nomInternational, frequence)

    set(texteNote, ...
        'String',['NOTE : ' nomFrancais ' (' nomInternational ')']);

    set(texteFrequence, ...
        'String',[langue('frequence',codeLangue) ' : ' ...
                  num2str(frequence,'%.2f') ' Hz']);

    try

        Fe = 44100;
        duree = 1.2;
        t = 0:1/Fe:duree;

        signal = ...
            1.00 * sin(2*pi*frequence*t) + ...
            0.35 * sin(2*pi*2*frequence*t) + ...
            0.18 * sin(2*pi*3*frequence*t) + ...
            0.10 * sin(2*pi*4*frequence*t) + ...
            0.06 * sin(2*pi*5*frequence*t);

        attaque = 0.015;
        enveloppe = exp(-2.8*t);
        nombreAttaque = round(attaque * Fe);

        if nombreAttaque > 1
            enveloppe(1:nombreAttaque) = ...
                linspace(0, 1, nombreAttaque);
        end

        signal = signal .* enveloppe;

        maximum = max(abs(signal));

        if maximum > 0
            signal = signal / maximum;
        end

        sound(signal, Fe);

    catch

        try
            beep;
        catch
        end

    end

end


% ============================================================
% 26. RETOUR VERS PIANO.M
% ============================================================

function retourPiano(~,~)

    parentExiste = false;

    if ~isempty(parentFigure)

        try
            parentExiste = ishandle(parentFigure);
        catch
            parentExiste = false;
        end

    end

    try

        if ishandle(f)
            delete(f);
        end

    catch

        try
            close(f);
        catch
        end

    end

    if parentExiste

        try

            set(parentFigure,'Visible','on');
            figure(parentFigure);

        catch

            try
                set(parentFigure,'Visible','on');
            catch
            end

        end

    else

        try
            piano([],codeLangue);
        catch
            try
                piano();
            catch
            end
        end

    end

end


% ============================================================
% 27. PLEIN ECRAN
% ============================================================

function pleinEcran(~,~)

    if ~ishandle(f)
        return;
    end

    try

        etat = get(f,'WindowState');

        if strcmp(etat,'maximized')

            set(f,'WindowState','normal');
            estPleinEcran = false;
            set(btnPleinEcran, ...
                'String',langue('plein_ecran',codeLangue));

        else

            set(f,'WindowState','maximized');
            estPleinEcran = true;
            set(btnPleinEcran, ...
                'String',langue('taille_normale',codeLangue));

        end

    catch

        try

            if estPleinEcran

                set(f,'Position',positionNormale);
                estPleinEcran = false;
                set(btnPleinEcran, ...
                    'String',langue('plein_ecran',codeLangue));

            else

                set(f,'Position',ecran);
                estPleinEcran = true;
                set(btnPleinEcran, ...
                    'String',langue('taille_normale',codeLangue));

            end

        catch

        end

    end

end


% ============================================================
% 28. TOUCHE ECHAP
% ============================================================

function toucheClavier(~,event)

    if ~isfield(event,'Key')
        return;
    end

    if strcmpi(event.Key,'escape')

        try
            set(f,'WindowState','normal');
        catch
        end

        try
            set(f,'Position',positionNormale);
        catch
        end

        estPleinEcran = false;

        try

            set(btnPleinEcran, ...
                'String',langue('plein_ecran',codeLangue));

        catch

        end

    end

end


% ============================================================
% 29. QUITTER LE MODULE
% ============================================================

function quitterClavier(~,~)

    choix = questdlg( ...
        'Voulez-vous quitter EDU-PIANO & IT ?', ...
        'Quitter', ...
        'Oui', ...
        'Non', ...
        'Non');

    if strcmp(choix,'Oui')

        try
            delete(f);
        catch
        end

        try

            if ~isempty(parentFigure) && ishandle(parentFigure)
                delete(parentFigure);
            end

        catch

        end

    end

end


% ============================================================
% 30. FERMETURE PROPRE
% ============================================================

function fermerFenetre(~,~)

    parentExiste = false;

    try

        if ~isempty(parentFigure) && ishandle(parentFigure)
            parentExiste = true;
        end

    catch

        parentExiste = false;

    end

    try

        if ishandle(f)
            delete(f);
        end

    catch

        try
            close(f);
        catch
        end

    end

    if parentExiste

        try

            set(parentFigure,'Visible','on');
            figure(parentFigure);

        catch

            try
                set(parentFigure,'Visible','on');
            catch
            end

        end

    end

end


% ============================================================
% FIN DU MODULE
% ============================================================

end
