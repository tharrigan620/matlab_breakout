function [] = NewBreakout(diff)

set(gca, 'xlim', [0, 10], 'ylim', [-10, 10]);
hold on;
h = fill([0, 10, 10, 0], [-10, -10, 10, 10], [.5, .5, .5]);
BlockLength = 1;
BlockHeight = .2;
NrBlocks = 0;
NrPoints = 0;
col = 0;
row = 9.5;
Paddle = 5;

%[SoundData, fs] = wavread('loadingsound.wav');
%loadingsound = audioplayer(SoundData, fs);
%Drawing Board

set(gcf, 'KeyPressFcn', {@MyKeyPressFcn});
set(gcf, 'WindowButtonDownFcn', {@MyButtonDownFcn});
set(gcf, 'WindowButtonMotionFcn', {@MyButtonMotionFcn});
set(gcf, 'WindowButtonUpFcn', {@MyButtonUpFcn});

board = ones(5, 10)
     
while NrBlocks < 50
    if col == 10
        row = row - 1;
        col = 0;
    end
    if row == 9.5
        r = 1; g = 0; b = 1;
        fill([col, BlockLength + col, BlockLength + col, col], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] );
      %  play(loadingsound);
  
        pause(.1)
        col = col + 1;
        NrBlocks = NrBlocks + 1;
        
        
    end
    
    if row == 8.5
        r = 1; g = 1; b = 0;
        fill([col, BlockLength + col, BlockLength + col, col], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] );
     
        pause(.1)
        col = col + 1;
        NrBlocks = NrBlocks + 1;
        
    end
    if row == 7.5
        r = 0; g = 1; b = 1;
        fill([col, BlockLength + col, BlockLength + col, col], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] )
        
      
        
        pause(.1)
        NrBlocks = NrBlocks + 1;
        col = col + 1;
        
    end
    if row == 6.5
        r = 0; g = 1; b = 0;
        fill([col, BlockLength + col, BlockLength + col, col], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] )
        
        pause(.1)
        col = col + 1;
        NrBlocks = NrBlocks + 1;
        
    end
    if row == 5.5
        r = 1; g = 0; b = 0;
        fill([col, BlockLength + col, BlockLength + col, col], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] )
        
        pause(.1)
        col = col + 1;
        NrBlocks = NrBlocks + 1;
        
    end
end

PaddlePos = fill([Paddle - 1, Paddle + 1, Paddle + 1, Paddle - 1], [-9, -9, -8.7, -8.7], [0, 0, 1]);


 function [] = MyButtonMotionFcn(src, event)
        pos = get(gca, 'CurrentPoint');
        xpos = pos(1, 1);
        ypos = pos(1, 2);
        Paddle = xpos;
        y = ypos;
            set(PaddlePos, 'xdata', [Paddle - 1, Paddle + 1, Paddle + 1, Paddle - 1]);
          drawnow;
          ballx
 end
% Variables Involving Motion and Lives 
Lives = 3;
x = .2;
y = .2;
ballx = 5;
bally = 0;

ballDx = 0;
ballDy = -.2;



ballpos = fill([ballx - .125, ballx + .125, ballx + .125, ballx - .125], [bally - .25, bally - .25, bally + .25, bally + .25], [1, 0, 0]);
C = 0;
% A number of bounces that hopefully will never be reached
%All Motion is contained within while loop, acted upon by following
%statements
while C < 100000000
    C = C + 1;
    ballx = ballx + ballDx;
    bally = bally + ballDy;
    set(ballpos, 'xdata', [ballx - .125, ballx + .125, ballx + .125, ballx - .125]);
    set(ballpos, 'ydata', [bally - .25, bally - .25, bally + .25, bally + .25]);
    pause(.025);
    
    %Checking to see if the Ball comes into contact with the paddle, and on
    %what side
        if bally <= -8.65 && bally >= -8.85
    if ballx > Paddle - 1 && ballx < Paddle + 1
        %Right Side of Paddle
        if ballx > Paddle
            ballDx = ballDx + Paddle * diff;
            ballDy = -ballDy;
        % Left side of Paddle
        else
            ballDx = ballDx - Paddle * diff;
            ballDy = -ballDy;
        end
    %Ball Did not Hit Paddle    
    elseif Lives == 0
    
        
        msgbox('Game Over', 'Breakout', 'Error')
    else
        pause(.25);
        Lives = Lives -1;
        ballx = 5;
        ballDx = 0;
        bally = 0;
        ballDy = -.2;
    
        

    end
        end
        %Checks to see if the Ball comes into contact with walls other than
        %the bottom
        if ballx >= 10
            ballDx = -ballDx;
        elseif ballx <= .2
            ballDx = -ballDx;
        elseif bally >= 10
            ballDy = -ballDy;
        end
        if bally > 5.4
            col = floor(ballx);
            if col == 0
                col = 1;
            elseif col == 11
                col = 10;
            end
            if floor(bally) == 5
                row = 1;
            elseif floor(bally) == 6
                row = 2;
            elseif floor(bally) == 7
                row = 3;
            elseif floor(bally) == 8
                row = 4;
            elseif floor(bally) == 9
                row = 5;
            end
            
            if board(row, col) == 1
                board(row, col) = 0;
                ballDy = -ballDy;
                
                if (col == 1)
                    fill( [col-1, BlockLength + col-1, BlockLength + col-1, col-1] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5], [.5, .5, .5]);
                else
                    fill( [col, BlockLength + col, BlockLength + col, col] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5], [.5, .5, .5]);
                end

                NrBlocks = NrBlocks - 1;
                NrPoints = NrPoints + 1;
            elseif board(row, col) == 0
                ballDx = ballDx;
            end
        end
        if NrBlocks == 0
            msgbox('Congratulations, you have won!', 'Breakout', 'Help') ;
        end

                
end
end

