% Clear the workspace and the screen

close all;
clearvars;

% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% No estoy segura si hace falta, para dibujar el dot segun Pete...
rng('shuffle')

% Get the screen numbers.
screens = Screen('Screens');

% To draw we select the maximum of these numbers.
screenNumber = max(screens);

% Define black, white and gray (white will be 1 and black 0).
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);
grey = white / 2;

% Open an on screen window using PsychImaging and color it grey.
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);

% Set the blend funciton for the screen
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

% Get the size of the on screen window in pixels
% For help see: Screen WindowSize?
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% Get the centre coordinate of the window in pixels
% For help see: help RectCenter
[xCenter, yCenter] = RectCenter(windowRect);

% We create a variable for each response option
leftKey = KbName('LeftArrow');
rightKey = KbName ('RightArrow');

%Definir tipo de ensayo y aleatorizar orden
tipo_ensayo= [1 1 1 2 2 2 3 4];
tipo_ensayo_rand= tipo_ensayo (randperm (length (tipo_ensayo)));


% Loop para que haga lo mismo 6 veces (ensayos)
for i= 1:8
    
    %Fixation point (from pete´s tutorials)
    
    % Query the frame duration
    ifi = Screen('GetFlipInterval', window);
    
    % Set up alpha-blending for smooth (anti-aliased) lines
    Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
    
    % Setup the text type for the window
    Screen('TextFont', window, 'Ariel');
    Screen('TextSize', window, 36);
    
    
    % Here we set the size of the arms of our fixation cross
    fixCrossDimPix = 40;
    
    % Now we set the coordinates (these are all relative to zero we will let
    % the drawing routine center the cross in the center of our monitor for us)
    xCoords = [-fixCrossDimPix fixCrossDimPix 0 0];
    yCoords = [0 0 -fixCrossDimPix fixCrossDimPix];
    allCoords = [xCoords; yCoords];
    
    % Set the line width for our fixation cross
    lineWidthPix = 4;
    
    % Draw the fixation cross in white, set it to the center of our screen and
    % set good quality antialiasing
    Screen('DrawLines', window, allCoords,...
        lineWidthPix, white, [xCenter yCenter], 2);
    
    
    % esto es de otro programa (Arrows), con un punto en vez de una cruz, lo dejo pq es
    % otra manera de poner los sec random
    
    a = 0.2;
    b = 0.5;
    r = (b-a).*rand() + a;
    
    Screen('Flip', window);
    WaitSecs (r);
    
    
    % Make a base Rect of 200 by 200 pixels.
    baseRect = [0 0 screenYpixels * 0.25 screenYpixels * 0.25];
    
    % For Ovals we set a miximum diameter up to which it is perfect for.
    maxDiameter = max(baseRect) * 1.01;
    
    % Center the right hand side square on positions in the screen.
    rightRect = CenterRectOnPointd(baseRect, screenXpixels * 0.75, yCenter);
    
    % Center the left hand side circle on positions in the screen.
    leftRect = CenterRectOnPointd(baseRect, screenXpixels * 0.25, yCenter);
    
    
    % Set the color of our square: "full red" is [1 0 0], "Full green" [0 1 0] and "full blue" [0 0
    % 1].
    rectColorA = [1 0 0];
    rectColorB = [0 1 0];
    
    % Set the color of our dot.
    dotColor = [1 1 1];
    
    % Determine a X and Y position for our dot.
    dotXpos1= screenXpixels * 0.25;
    dotXpos2= screenXpixels * 0.75;
    dotYpos = screenYpixels * 0.50;
    
    % Dot size in pixels
    dotSizePix = 30;
    
    % if para alterar el orden de los estimulos en la mitad de los ensayos.
    if tipo_ensayo_rand (i)==1
        %Draw the square to the right.
        Screen('FillRect', window, rectColorA, rightRect)
        %Draw the circle to the left
        Screen('FillOval', window, rectColorB, leftRect, maxDiameter)
        %flip
        Screen('Flip', window);
        
        WaitSecs (0.25);
        
        %Draw the square to the right.
        Screen('FillRect', window, rectColorA, rightRect)
        %Draw the circle to the left
        Screen('FillOval', window, rectColorB, leftRect, maxDiameter)
        %Puto dot
        Screen('DrawDots', window,[dotXpos1 dotYpos], dotSizePix, dotColor, [], 2);
        
        %flip
        Screen('Flip', window);
        
    elseif tipo_ensayo_rand (i)==2
        %Draw the square to the left.
        Screen('FillRect', window, rectColorA, leftRect)
        %Draw the circle to the right
        Screen('FillOval', window, rectColorB, rightRect, maxDiameter)
        %flip
        Screen('Flip', window);
        
        % Que el dot aparezca más tarde
        WaitSecs (0.25);
        
        %Draw the square to the left.
        Screen('FillRect', window, rectColorA, leftRect)
        %Draw the circle to the right
        Screen('FillOval', window, rectColorB, rightRect, maxDiameter)
        %Puto dot
        Screen('DrawDots', window, [dotXpos2 dotYpos], dotSizePix, dotColor, [], 2);
        %flip
        Screen('Flip', window);
    elseif tipo_ensayo_rand (i)==3
        %Draw the square to the right.
        Screen('FillRect', window, rectColorA, rightRect)
        %Draw the circle to the left
        Screen('FillOval', window, rectColorB, leftRect, maxDiameter)
        %flip
        Screen('Flip', window);
        
        WaitSecs (0.25);
        
        %Draw the square to the right.
        Screen('FillRect', window, rectColorA, rightRect)
        %Draw the circle to the left
        Screen('FillOval', window, rectColorB, leftRect, maxDiameter)
        %Puto dot
        Screen('DrawDots', window,[dotXpos2 dotYpos], dotSizePix, dotColor, [], 2);
        
        %flip
        Screen('Flip', window);
        
    elseif tipo_ensayo_rand (i)==4
        %Draw the square to the left.
        Screen('FillRect', window, rectColorA, leftRect)
        %Draw the circle to the right
        Screen('FillOval', window, rectColorB, rightRect, maxDiameter)
        %flip
        Screen('Flip', window);
        
        % Que el dot aparezca más tarde
        WaitSecs (0.25);
        
        %Draw the square to the left.
        Screen('FillRect', window, rectColorA, leftRect)
        %Draw the circle to the right
        Screen('FillOval', window, rectColorB, rightRect, maxDiameter)
        %Puto dot
        Screen('DrawDots', window, [dotXpos1 dotYpos], dotSizePix, dotColor, [], 2);
        %flip
        Screen('Flip', window);
    end
    
    
    % This is the cue which determines whether we exit the demo
    exitDemo = false;
    
    % Loop the animation until some key is pressed
    while exitDemo == false
        
        % Check the keyboard to see if a button has been pressed
        [keyIsDown,~, keyCode] = KbCheck;
        %Tecla en funcion del tipo de ensayo:
        if tipo_ensayo_rand (i) == 1 || tipo_ensayo_rand (i) == 3
            % Depending on the button press, exit the demo.
            if keyCode (leftKey)
                exitDemo = true;
                
                % Pausa intertrial variable entre dos valores (1-1.5 secs)
                aX = 1;
                bX = 1.5;
                rX = (bX-aX).*rand() + aX;
                
                Screen('Flip', window);
                WaitSecs (rX);
            end
            % respuestas incorrectas
            if keyCode (rightKey)
                response = 0;
                exitDemo = true;
                
                %pause
                pause (0.2)
                
                % Draw text in the middle of the screen in Courier in white
                Screen('TextSize', window, 80);
                Screen('TextFont', window, 'Times');
                DrawFormattedText(window, 'error', 'center' , 'center', white);
                
                Screen('Flip', window);
                WaitSecs (1.2);
            end
        elseif tipo_ensayo_rand (i) == 2 || tipo_ensayo_rand (i) == 4
            if keyCode (rightKey)
                exitDemo = true;
                % Pausa intertrial variable entre dos valores (1-1.5 secs)
                aX = 1;
                bX = 1.5;
                rX = (bX-aX).*rand() + aX;
                
                Screen('Flip', window);
                WaitSecs (rX);
            end
            
            % respuestas incorrectas
            if keyCode (leftKey)
                response = 0;
                exitDemo = true;
                %pause
                pause (0.2)
                
                % Draw text in the middle of the screen in Courier in white
                Screen('TextSize', window, 80);
                Screen('TextFont', window, 'Times');
                DrawFormattedText(window, 'error', 'center' , 'center', white);
                
                Screen('Flip', window);
                WaitSecs (1.2);
            end
            
        end
    end
    
end

% Clear the screen.
Screen('CloseAll');