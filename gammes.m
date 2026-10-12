function gammes(parentFigure, codeLangue)

% ============================================================
% EDU-PIANO & IT
% MODULE : GAMMES
%
% Version complete et corrigee - GNU Octave
% Taille normale : 1200 x 720
%
% Appel depuis piano.m ou notes.m :
%   gammes(f, codeLangue)
%
% Navigation :
%   GAMMES -> PRECEDENT / SUIVANT (via boutons des 12 tonalites)
%   GAMMES -> RETOUR AU PIANO
%   Echap  -> taille normale
%   F11    -> bascule plein ecran
%
% ============================================================


% ============================================================
% 1. PARAMETRES
% ============================================================

if nargin < 1 || isempty(parentFigure)
    parentFigure = [];
end

if nargin < 2 || isempty(codeLangue)
    codeLangue = 'FR';
end

codeLangue = upper(codeLangue);


% ============================================================
% 2. COULEURS
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
orange     = [0.95 0.55 0.15];
rouge      = [0.80 0.20 0.20];


% ============================================================
% 3. NOMS DES 12 TONALITES
% ============================================================

nomsGammes = {
    'DO', ...
    'REb', ...
    'RE', ...
    'MIb', ...
    'MI', ...
    'FA', ...
    'FA#', ...
    'SOL', ...
    'LAb', ...
    'LA', ...
    'SIb', ...
    'SI'
};

nomsInternationaux = {
    'C', 'Db', 'D', 'Eb', 'E', 'F', ...
    'F#', 'G', 'Ab', 'A', 'Bb', 'B'
};

frequences = [
    261.63 ...
    277.18 ...
    293.66 ...
    311.13 ...
    329.63 ...
    349.23 ...
    369.99 ...
    392.00 ...
    415.30 ...
    440.00 ...
    466.16 ...
    493.88
];


% ============================================================
% 4. GAMMES MAJEURES
% ============================================================

gammesNotes = {
    {'DO','RE','MI','FA','SOL','LA','SI'}, ...
    {'REb','MIb','FA','SOLb','LAb','SIb','DO'}, ...
    {'RE','MI','FA#','SOL','LA','SI','DO#'}, ...
    {'MIb','FA','SOL','LAb','SIb','DO','RE'}, ...
    {'MI','FA#','SOL#','LA','SI','DO#','RE#'}, ...
    {'FA','SOL','LA','SIb','DO','RE','MI'}, ...
    {'FA#','SOL#','LA#','SI','DO#','RE#','MI#'}, ...
    {'SOL','LA','SI','DO','RE','MI','FA#'}, ...
    {'LAb','SIb','DO','REb','MIb','FA','SOL'}, ...
    {'LA','SI','DO#','RE','MI','FA#','SOL#'}, ...
    {'SIb','DO','RE','MIb','FA','SOL','LA'}, ...
    {'SI','DO#','RE#','MI','FA#','SOL#','LA#'}
};

indicesGammes = {
    [1 3 5 6 8 10 12], ...
    [2 4 6 7 9 11 1], ...
    [3 5 7 8 10 12 2], ...
    [4 6 8 9 11 1 3], ...
    [5 7 9 10 12 2 4], ...
    [6 8 10 11 1 3 5], ...
    [7 9 11 12 2 4 6], ...
    [8 10 12 1 3 5 7], ...
    [9 11 1 2 4 6 8], ...
    [10 12 2 3 5 7 9], ...
    [11 1 3 4 6 8 10], ...
    [12 2 4 5 7 9 11]
};

degres = {'I','II','III','IV','V','VI','VII'};


% ============================================================
% 5. CLAVIER C5 -> C7
% ============================================================

touchesBlanches = {
    'C5','D5','E5','F5','G5','A5','B5', ...
    'C6','D6','E6','F6','G6','A6','B6','C7'
};

indicesBlanches = [
    1 3 5 6 8 10 12 ...
    1 3 5 6 8 10 12 1
];

touchesNoires = {
    'C#5','D#5','F#5','G#5','A#5', ...
    'C#6','D#6','F#6','G#6','A#6'
};

indicesNoires = [
    2 4 7 9 11 ...
    2 4 7 9 11
];

positionsNoires = [
    1 2 4 5 6 ...
    8 9 11 12 13
];


% ============================================================
% 6. FENETRE 1200 x 720
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

% Position normale memorisee
positionNormale = [posX posY largeur hauteur];

estPleinEcran = false;


fig = figure( ...
    'Name','EDU-PIANO & IT - Gammes', ...
    'NumberTitle','off', ...
    'MenuBar','none', ...
    'ToolBar','none', ...
    'Color',fond, ...
    'Position',positionNormale, ...
    'Resize','on', ...
    'KeyPressFcn',@toucheClavier, ...
    'CloseRequestFcn',@fermerFenetre);


% ============================================================
% 7. MENU GAUCHE
% ============================================================

panneauMenu = uipanel( ...
    'Parent',fig, ...
    'Units','normalized', ...
    'Position',[0 0 0.22 1], ...
    'BackgroundColor',bleuFonce, ...
    'BorderType','none');


uicontrol( ...
    'Parent',panneauMenu, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.04 0.935 0.92 0.045], ...
    'String','GAMMES MAJEURES', ...
    'FontSize',14, ...
    'FontWeight','bold', ...
    'ForegroundColor',blanc, ...
    'BackgroundColor',bleuFonce);


% ============================================================
% 8. BOUTONS DES 12 GAMMES
% ============================================================

boutonsGammes = [];

for i = 1:12

    y = 0.855 - (i-1)*0.058;

    bouton = uicontrol( ...
        'Parent',panneauMenu, ...
        'Style','pushbutton', ...
        'Units','normalized', ...
        'Position',[0.09 y 0.82 0.045], ...
        'String',[nomsGammes{i} ' majeur'], ...
        'FontSize',10, ...
        'FontWeight','bold', ...
        'ForegroundColor',bleuFonce, ...
        'BackgroundColor',blanc, ...
        'Callback',{@selectionGamme,i});

    boutonsGammes = [boutonsGammes bouton];

end


% ============================================================
% 9. BOUTON RETOUR
% ============================================================

uicontrol( ...
    'Parent',panneauMenu, ...
    'Style','pushbutton', ...
    'Units','normalized', ...
    'Position',[0.09 0.025 0.82 0.050], ...
    'String',langue('retour_piano',codeLangue), ...
    'FontSize',10, ...
    'FontWeight','bold', ...
    'ForegroundColor',blanc, ...
    'BackgroundColor',bleuCiel, ...
    'Callback',@retourPiano);


% ============================================================
% 10. TITRE
% ============================================================

uicontrol( ...
    'Parent',fig, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.24 0.925 0.72 0.055], ...
    'String','COMPRENDRE LES GAMMES MUSICALES', ...
    'FontSize',21, ...
    'FontWeight','bold', ...
    'ForegroundColor',bleuFonce, ...
    'BackgroundColor',fond);


uicontrol( ...
    'Parent',fig, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.24 0.885 0.72 0.032], ...
    'String','Choisissez une tonalite pour decouvrir sa gamme majeure', ...
    'FontSize',11, ...
    'ForegroundColor',gris, ...
    'BackgroundColor',fond);


% ============================================================
% 11. ZONE TONALITE
% ============================================================

panneauTonalite = uipanel( ...
    'Parent',fig, ...
    'Units','normalized', ...
    'Position',[0.245 0.775 0.72 0.095], ...
    'BackgroundColor',bleuClair, ...
    'BorderType','line', ...
    'BorderWidth',1);


texteTonalite = uicontrol( ...
    'Parent',panneauTonalite, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.02 0.15 0.96 0.70], ...
    'String','GAMME DE DO MAJEUR', ...
    'FontSize',18, ...
    'FontWeight','bold', ...
    'ForegroundColor',bleuFonce, ...
    'BackgroundColor',bleuClair);


% ============================================================
% 12. ZONE NOTES
% ============================================================

panneauNotes = uipanel( ...
    'Parent',fig, ...
    'Units','normalized', ...
    'Position',[0.245 0.665 0.72 0.095], ...
    'BackgroundColor',blanc, ...
    'BorderType','line', ...
    'BorderWidth',1);


texteNotes = uicontrol( ...
    'Parent',panneauNotes, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.02 0.10 0.96 0.80], ...
    'String','DO  -  RE  -  MI  -  FA  -  SOL  -  LA  -  SI', ...
    'FontSize',15, ...
    'FontWeight','bold', ...
    'ForegroundColor',bleuFonce, ...
    'BackgroundColor',blanc);


% ============================================================
% 13. ZONE DEGRES
% ============================================================

panneauDegres = uipanel( ...
    'Parent',fig, ...
    'Units','normalized', ...
    'Position',[0.245 0.575 0.72 0.075], ...
    'BackgroundColor',grisClair, ...
    'BorderType','line', ...
    'BorderWidth',1);


texteDegres = uicontrol( ...
    'Parent',panneauDegres, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.02 0.10 0.96 0.80], ...
    'String','I       II       III       IV       V       VI       VII', ...
    'FontSize',12, ...
    'FontWeight','bold', ...
    'ForegroundColor',gris, ...
    'BackgroundColor',grisClair);


% ============================================================
% 14. ZONE INFORMATION
% ============================================================

panneauInfo = uipanel( ...
    'Parent',fig, ...
    'Units','normalized', ...
    'Position',[0.245 0.435 0.72 0.125], ...
    'BackgroundColor',blanc, ...
    'BorderType','line', ...
    'BorderWidth',1);


texteInfo = uicontrol( ...
    'Parent',panneauInfo, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.025 0.06 0.95 0.88], ...
    'HorizontalAlignment','left', ...
    'String',{ ...
        'Une gamme majeure contient 7 notes.', ...
        'Formule : TON - TON - DEMI-TON - TON - TON - TON - DEMI-TON.', ...
        'Les notes sont representees par les degres I, II, III, IV, V, VI et VII.'}, ...
    'FontSize',11, ...
    'ForegroundColor',gris, ...
    'BackgroundColor',blanc);


% ============================================================
% 15. CLAVIER
% ============================================================

panneauClavier = uipanel( ...
    'Parent',fig, ...
    'Units','normalized', ...
    'Position',[0.245 0.115 0.72 0.295], ...
    'BackgroundColor',blanc, ...
    'BorderType','line', ...
    'BorderWidth',1);


uicontrol( ...
    'Parent',panneauClavier, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.02 0.885 0.96 0.095], ...
    'String','CLAVIER : C5  ->  C7', ...
    'FontSize',13, ...
    'FontWeight','bold', ...
    'ForegroundColor',bleuFonce, ...
    'BackgroundColor',blanc);


% ============================================================
% 16. AXES DU CLAVIER
% ============================================================

axeClavier = axes( ...
    'Parent',panneauClavier, ...
    'Units','normalized', ...
    'Position',[0.025 0.08 0.95 0.76], ...
    'XLim',[0 15], ...
    'YLim',[0 1], ...
    'XTick',[], ...
    'YTick',[], ...
    'Box','on');

hold(axeClavier,'on');


% ============================================================
% 17. TOUCHES BLANCHES
% ============================================================

touchesBlanchesGraph = [];

for k = 1:15

    x1 = k-1;
    x2 = k;

    h = patch( ...
        'Parent',axeClavier, ...
        'XData',[x1 x2 x2 x1], ...
        'YData',[0 0 1 1], ...
        'FaceColor',blanc, ...
        'EdgeColor',bleuFonce, ...
        'LineWidth',1, ...
        'ButtonDownFcn',{@clicToucheBlanche,k});

    touchesBlanchesGraph = [touchesBlanchesGraph h];

    text( ...
        axeClavier, ...
        x1+0.5, ...
        0.10, ...
        touchesBlanches{k}, ...
        'HorizontalAlignment','center', ...
        'VerticalAlignment','middle', ...
        'FontSize',9, ...
        'FontWeight','bold', ...
        'Color',bleuFonce);

end


% ============================================================
% 18. TOUCHES NOIRES
% ============================================================

touchesNoiresGraph = [];

for k = 1:10

    x = positionsNoires(k);

    h = patch( ...
        'Parent',axeClavier, ...
        'XData',[x-0.23 x+0.23 x+0.23 x-0.23], ...
        'YData',[0.38 0.38 1 1], ...
        'FaceColor',noir, ...
        'EdgeColor',noir, ...
        'LineWidth',1, ...
        'ButtonDownFcn',{@clicToucheNoire,k});

    touchesNoiresGraph = [touchesNoiresGraph h];

    text( ...
        axeClavier, ...
        x, ...
        0.46, ...
        touchesNoires{k}, ...
        'HorizontalAlignment','center', ...
        'VerticalAlignment','middle', ...
        'Rotation',90, ...
        'FontSize',7, ...
        'FontWeight','bold', ...
        'Color',blanc);

end

hold(axeClavier,'off');


% ============================================================
% 19. INFORMATION CLIQUE
% ============================================================

panneauSelection = uipanel( ...
    'Parent',fig, ...
    'Units','normalized', ...
    'Position',[0.72 0.045 0.245 0.055], ...
    'BackgroundColor',bleuClair, ...
    'BorderType','line');


texteSelection = uicontrol( ...
    'Parent',panneauSelection, ...
    'Style','text', ...
    'Units','normalized', ...
    'Position',[0.02 0.05 0.96 0.90], ...
    'String','Cliquez sur une touche', ...
    'FontSize',9, ...
    'FontWeight','bold', ...
    'ForegroundColor',bleuFonce, ...
    'BackgroundColor',bleuClair);


% ============================================================
% 20. BOUTON PLEIN ECRAN
% ============================================================

btnPleinEcran = uicontrol( ...
    'Parent',fig, ...
    'Style','pushbutton', ...
    'Units','normalized', ...
    'Position',[0.475 0.045 0.18 0.045], ...
    'String',langue('plein_ecran',codeLangue), ...
    'FontSize',9, ...
    'FontWeight','bold', ...
    'ForegroundColor',blanc, ...
    'BackgroundColor',vert, ...
    'Callback',@pleinEcran);


% ============================================================
% 21. AFFICHAGE INITIAL
% ============================================================

afficherGamme(1);

% Selection visuelle de DO
try

    set(boutonsGammes(1), ...
        'BackgroundColor',bleuCiel, ...
        'ForegroundColor',blanc);

catch

end


% ============================================================
% 22. SELECTION D'UNE GAMME
% ============================================================

function selectionGamme(~,~,indice)

    afficherGamme(indice);

    for b = 1:length(boutonsGammes)

        try

            set(boutonsGammes(b), ...
                'BackgroundColor',blanc, ...
                'ForegroundColor',bleuFonce);

        catch

        end

    end

    try

        set(boutonsGammes(indice), ...
            'BackgroundColor',bleuCiel, ...
            'ForegroundColor',blanc);

    catch

    end

end


% ============================================================
% 23. AFFICHAGE DE LA GAMME
% ============================================================

function afficherGamme(indice)

    if indice < 1 || indice > 12
        return;
    end

    notes = gammesNotes{indice};
    indices = indicesGammes{indice};

    % --------------------------------------------------------
    % Tonalite
    % --------------------------------------------------------

    set(texteTonalite, ...
        'String',['GAMME DE ' nomsGammes{indice} ' MAJEUR']);

    % --------------------------------------------------------
    % Notes
    % --------------------------------------------------------

    chaineNotes = '';

    for n = 1:7

        if n == 7

            chaineNotes = [chaineNotes notes{n}];

        else

            chaineNotes = ...
                [chaineNotes notes{n} '  -  '];

        end

    end

    set(texteNotes,'String',chaineNotes);

    % --------------------------------------------------------
    % Degres
    % --------------------------------------------------------

    chaineDegres = '';

    for n = 1:7

        if n == 7

            chaineDegres = [chaineDegres degres{n}];

        else

            chaineDegres = ...
                [chaineDegres degres{n} '       '];

        end

    end

    set(texteDegres,'String',chaineDegres);

    % --------------------------------------------------------
    % Information
    % --------------------------------------------------------

    texteInformation = {
        ['Tonalite : ' nomsGammes{indice} ...
         ' majeur (' nomsInternationaux{indice} ' major).'], ...
        'Une gamme majeure contient 7 notes.', ...
        'Formule : TON - TON - DEMI-TON - TON - TON - TON - DEMI-TON.', ...
        'Les notes sont representees par les degres I, II, III, IV, V, VI et VII.'
    };

    set(texteInfo,'String',texteInformation);

    % --------------------------------------------------------
    % Clavier
    % --------------------------------------------------------

    mettreAJourClavier(indices);

end


% ============================================================
% 24. MISE A JOUR DU CLAVIER
% ============================================================

function mettreAJourClavier(indices)

    % --------------------------------------------------------
    % Touches blanches
    % --------------------------------------------------------

    for k = 1:15

        if any(indicesBlanches(k) == indices)

            set(touchesBlanchesGraph(k), ...
                'FaceColor',bleuCiel);

        else

            set(touchesBlanchesGraph(k), ...
                'FaceColor',blanc);

        end

    end

    % --------------------------------------------------------
    % Touches noires
    % --------------------------------------------------------

    for k = 1:10

        if any(indicesNoires(k) == indices)

            set(touchesNoiresGraph(k), ...
                'FaceColor',bleuCiel);

        else

            set(touchesNoiresGraph(k), ...
                'FaceColor',noir);

        end

    end

end


% ============================================================
% 25. CLIC SUR TOUCHE BLANCHE
% ============================================================

function clicToucheBlanche(~,~,indice)

    if indice < 1 || indice > length(touchesBlanches)
        return;
    end

    note = touchesBlanches{indice};

    indiceChromatique = indicesBlanches(indice);

    freq = frequences(indiceChromatique);

    set(texteSelection, ...
        'String',[note '  -  ' num2str(freq,'%.2f') ' Hz']);

    ancienneCouleur = ...
        get(touchesBlanchesGraph(indice),'FaceColor');

    set(touchesBlanchesGraph(indice), ...
        'FaceColor',orange);

    drawnow;

    pause(0.08);

    try

        set(touchesBlanchesGraph(indice), ...
            'FaceColor',ancienneCouleur);

    catch

    end

end


% ============================================================
% 26. CLIC SUR TOUCHE NOIRE
% ============================================================

function clicToucheNoire(~,~,indice)

    if indice < 1 || indice > length(touchesNoires)
        return;
    end

    note = touchesNoires{indice};

    indiceChromatique = indicesNoires(indice);

    freq = frequences(indiceChromatique);

    set(texteSelection, ...
        'String',[note '  -  ' num2str(freq,'%.2f') ' Hz']);

    ancienneCouleur = ...
        get(touchesNoiresGraph(indice),'FaceColor');

    set(touchesNoiresGraph(indice), ...
        'FaceColor',orange);

    drawnow;

    pause(0.08);

    try

        set(touchesNoiresGraph(indice), ...
            'FaceColor',ancienneCouleur);

    catch

    end

end


% ============================================================
% 27. RETOUR AU PIANO
% ============================================================

function retourPiano(~,~)

    parentExiste = false;

    if ~isempty(parentFigure)

        try

            if ishandle(parentFigure)
                parentExiste = true;
            end

        catch

            parentExiste = false;

        end

    end

    % Fermer GAMMES
    try

        if ishandle(fig)
            delete(fig);
        end

    catch

        try
            close(fig);
        catch
        end

    end

    % Reafficher le piano existant
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

        % Si gammes.m est lance directement
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
% 28. PLEIN ECRAN
% ============================================================

function pleinEcran(~,~)

    if ~ishandle(fig)
        return;
    end

    try

        etat = get(fig,'WindowState');

        if strcmp(etat,'maximized')

            set(fig,'WindowState','normal');
            set(fig,'Position',positionNormale);

            estPleinEcran = false;

            set(btnPleinEcran, ...
                'String',langue('plein_ecran',codeLangue));

        else

            set(fig,'WindowState','maximized');

            estPleinEcran = true;

            set(btnPleinEcran, ...
                'String',langue('taille_normale',codeLangue));

        end

    catch

        % Compatibilite GNU Octave

        try

            positionActuelle = get(fig,'Position');

            if estPleinEcran

                set(fig,'Units','pixels');
                set(fig,'Position',positionNormale);

                estPleinEcran = false;

                set(btnPleinEcran, ...
                    'String',langue('plein_ecran',codeLangue));

            else

                set(fig,'Units','pixels');
                set(fig,'Position',ecran);

                estPleinEcran = true;

                set(btnPleinEcran, ...
                    'String',langue('taille_normale',codeLangue));

            end

        catch

            try

                set(fig, ...
                    'Units','normalized', ...
                    'Position',[0 0 1 1]);

            catch

            end

        end

    end

end


% ============================================================
% 29. TOUCHE ECHAP / F11 / FLECHES
% ============================================================

function toucheClavier(~,event)

    if ~isfield(event,'Key')
        return;
    end

    touche = lower(event.Key);

    switch touche

        case 'escape'

            % Retour exact a la taille normale
            try
                set(fig,'WindowState','normal');
            catch
            end

            try
                set(fig,'Units','pixels');
                set(fig,'Position',positionNormale);
            catch
            end

            estPleinEcran = false;

            try

                set(btnPleinEcran, ...
                    'String',langue('plein_ecran',codeLangue));

            catch

            end

        case 'f11'

            pleinEcran();

    end

end


% ============================================================
% 30. FERMETURE AVEC X
% ============================================================

function fermerFenetre(~,~)

    parentExiste = false;

    if ~isempty(parentFigure)

        try

            if ishandle(parentFigure)
                parentExiste = true;
            end

        catch

            parentExiste = false;

        end

    end

    % Fermer GAMMES
    try

        if ishandle(fig)
            delete(fig);
        end

    catch

        try
            close(fig);
        catch
        end

    end

    % Reafficher le PIANO
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
