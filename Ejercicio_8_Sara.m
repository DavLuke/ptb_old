% Clear the workspace and the screen

close all;
clearvars;

% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% Get the screen numbers. This gives us a number for each of the screens
% attached to our computer.
screens = Screen('Screens');

% To draw we select the maximum of these numbers. So in a situation where we
% have two screens attached to our monitor we will draw to the external
% screen.
screenNumber = max(screens);

% Define black and white (white will be 1 and black 0). This is because
% in general luminace values are defined between 0 and 1 with 255 steps in
% between. All values in Psychtoolbox are defined between 0 and 1
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% Do a simply calculation to calculate the luminance value for grey. This
% will be half the luminace values for white
grey = white / 2;

% Open an on screen window using PsychImaging and color it grey.
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);

% Get the size of the on screen window in pixels
% For help see: Screen WindowSize?
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% Get the centre coordinate of the window in pixels
% For help see: help RectCenter
[xCenter, yCenter] = RectCenter(windowRect);

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
     

% Make a base Rect of 200 by 200 pixels. This is the rect which defines the
% size of our square in pixels. Rects are rectangles, so the
% sides do not have to be the same length. The coordinates define the top
% left and bottom right coordinates of our rect [top-left-x top-left-y
% bottom-right-x bottom-right-y]. The easiest thing to do is set the first
% two coordinates to 0, then the last two numbers define the length of the
% rect in X and Y. The next line of code then centers the rect on a
% particular location of the screen.
baseRect = [0 0 screenYpixels * 0.25 screenYpixels * 0.25];

% Center the left hand side square on positions in the screen.
leftRect = CenterRectOnPointd(baseRect, screenXpixels * 0.25, yCenter);

% Set the color of our square to full red. Color is defined by red green
% and blue components (RGB). So we have three numbers which
% define our RGB values. The maximum number for each is 1 and the minimum
% 0. So, "full red" is [1 0 0]. "Full green" [0 1 0] and "full blue" [0 0
% 1]. Play around with these numbers and see the result.
rectColor = [1 0 0];

% Draw the square to the screen. For information on the command used in
% this line see Screen FillRect?
Screen('FillRect', window, rectColor, leftRect);



% Make a rect of 200 by 200 pixels (incluso si luego vas a hacer un circulo, segun peter).
baseRect = [0 0 screenYpixels * 0.25 screenYpixels * 0.25];

% For Ovals we set a miximum diameter up to which it is perfect for
maxDiameter = max(baseRect) * 1.01;

% Center the right hand side circle on positions in the screen.
rightRect = CenterRectOnPointd(baseRect, screenXpixels * 0.75, yCenter);
%color
rectColor = [0 1 0];

% Rellenar circulo
Screen('FillOval', window, rectColor, rightRect, maxDiameter);

%flip
Screen('Flip', window);


% The avaliable keys to press
leftKey = KbName('LeftArrow');

%Espera hasta presionar left arrow
waitfor (leftKey);

% This is the cue which determines whether we exit the demo
exitDemo = false;

% Loop the animation until the left key is pressed
while exitDemo == false

    % Check the keyboard to see if a button has been pressed
    [keyIsDown,~, keyCode] = KbCheck;

    % Depending on the button press, exit the demo.
    if keyCode(leftKey)
        exitDemo = true;
    
        % Pausa intertrial variable entre dos valores (1-1.5 secs)    
        aX = 1;
      bX = 1.5;
      rX = (bX-aX).*rand() + aX;  
      
      Screen('Flip', window);
      WaitSecs (rX);
      
        
      
    end

end 

% Clear the screen.
Screen('CloseAll');