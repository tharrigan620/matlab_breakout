function [] = NewBreakout

NrPoints = 0;
function [] = MyButtonMotionFcn(src, event)
        pos = get(gca, 'CurrentPoint');
        xpos = pos(1, 1);
        ypos = pos(1, 2);
        Paddle = xpos;
        y = ypos;
            set(PaddlePos, 'xdata', [Paddle - PaddleLength, Paddle + PaddleLength, Paddle + PaddleLength, Paddle - PaddleLength]);
          drawnow;
         
end
b = 0
while b < 1000
    b = b + 1
    
    
set(gca, 'xlim', [-2, 12], 'ylim', [-12, 12]);
hold on;
h = fill([-2, 12, 12, -2], [-12, -12, 12, 12], [.5, .5, .5]);
BlockLength = .7;
BlockDist = (1 - BlockLength)/2

BlockHeight = .2;
NrBlocks = 0;

col = 0;
row = 9.5;
Paddle = 5;
if b <= 1
   Name = inputdlg('Hello Player! What is your name?', 'Breakout');
   str = ['Hello,', Name, 'Would you like to play on easy, normal, or hard mode?'];
  Diff = menu(str, 'Easy', 'Normal', 'Hard') ;
   if Diff == 1
       PaddleLength = 2.5;
       PaddlePos = fill([Paddle - PaddleLength, Paddle + PaddleLength, Paddle + PaddleLength, Paddle - PaddleLength], [-9, -9, -8.7, -8.7], [0, 0, 1]);
   elseif Diff == 2
       PaddleLength = 1;
PaddlePos = fill([Paddle - PaddleLength, Paddle + PaddleLength, Paddle + PaddleLength, Paddle - PaddleLength], [-9, -9, -8.7, -8.7], [0, 0, 1]);
   elseif Diff == 3
       PaddleLength = .5;
   PaddlePos = fill([Paddle - .5, Paddle + .5, Paddle + .5, Paddle - .5], [-9, -9, -8.7, -8.7], [0, 0, 1]);
   else
PaddleLength = 1; 
       msgbox('You did not select a Difficulty, so it has been set to Normal', 'Breakout', 'Error')
    PaddlePos = fill([Paddle - PaddleLength, Paddle + PaddleLength, Paddle + PaddleLength, Paddle - PaddleLength], [-9, -9, -8.7, -8.7], [0, 0, 1]);
    Diff = 2
   end
 else 
     PaddlePos = fill([Paddle - PaddleLength, Paddle + PaddleLength, Paddle + PaddleLength, Paddle - PaddleLength], [-9, -9, -8.7, -8.7], [0, 0, 1]);
     
 end

[SoundData1, fs] = wavread('loadingsound.wav');
loadingsound = audioplayer(SoundData1, fs);
[SoundData2, fs] = wavread('blocksound.wav');
brickbounce = audioplayer(SoundData2, fs);
[SoundData3, fs] = wavread('paddlebounce.wav');
paddlebounce = audioplayer(SoundData3, fs);
[SoundData4, fs] = wavread('win.wav');
win = audioplayer(SoundData4, fs);
%Drawing Board


set(gcf, 'WindowButtonMotionFcn', {@MyButtonMotionFcn});
NrPoints = NrPoints

board = ones(5, 10)
     
while NrBlocks < 50
    if NrBlocks == 0
        play(loadingsound);
    end
    if col == 10
        row = row - 1;
        col = 0;
    end
    if row == 9.5
        r = 1; g = 0; b = 1;
        fill([col + BlockDist, BlockLength + col + BlockDist, BlockLength + col + BlockDist, col + BlockDist], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] );
     
  
        pause(.1)
        col = col + 1;
        NrBlocks = NrBlocks + 1;
        
        
    end
    
    if row == 8.5
        r = 1; g = 1; b = 0;
        fill([col + BlockDist, BlockLength + col + BlockDist, BlockLength + col + BlockDist, col + BlockDist], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] );
     
        pause(.1)
        col = col + 1;
        NrBlocks = NrBlocks + 1;
        
    end
    if row == 7.5
        r = 0; g = 1; b = 1;
        fill([col + BlockDist, BlockLength + col + BlockDist, BlockLength + col + BlockDist, col + BlockDist], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] );
        
      
        
        pause(.1)
        NrBlocks = NrBlocks + 1;
        col = col + 1;
        
    end
    if row == 6.5
        r = 0; g = 1; b = 0;
        fill([col + BlockDist, BlockLength + col + BlockDist, BlockLength + col + BlockDist, col + BlockDist], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] );
        
        pause(.1)
        col = col + 1;
        NrBlocks = NrBlocks + 1;
        
    end
    if row == 5.5
        r = 1; g = 0; b = 0;
        fill([col + BlockDist, BlockLength + col + BlockDist, BlockLength + col + BlockDist, col + BlockDist], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] );
        
        pause(.1);
        col = col + 1;
        NrBlocks = NrBlocks + 1;
        
    end
end




 
% Variables Involving Motion and Lives 
Lives = 3;

ballx = 5;
bally = 0;

ballDx = 0;
ballDy = -.4;
 %Name Dialog Box




ballpos = fill([ballx - .125, ballx + .125, ballx + .125, ballx - .125], [bally - .25, bally - .25, bally + .25, bally + .25], [1, 0, 0]);

% A number of bounces that hopefully will never be reached
%All Motion is contained within while loop, acted upon by following
%statements
C = 0
while C < 100000000
    PointsNameStr = [Name, 'Points:', NrPoints, 'Lives:', Lives];
    
    xlabel(PointsNameStr) ;
    C = C + 1;
    ballx = ballx + ballDx;
    bally = bally + ballDy;
    set(ballpos, 'xdata', [ballx - .125, ballx + .125, ballx + .125, ballx - .125]);
    set(ballpos, 'ydata', [bally - .2, bally - .2, bally + .2, bally + .2]);
    pause(.025);
    
    %Checking to see if the Ball comes into contact with the paddle, and on
    %what side
        if bally <= -8.65 && bally >= -8.85
    if ballx > Paddle - PaddleLength && ballx < Paddle + PaddleLength
        %Right Side of Paddle
        if ballx > Paddle
        
           if Diff == 1
               ballDx = -(Paddle - ballx) *.2 ;
               ballDy = -ballDy;
               play(paddlebounce);
           elseif Diff == 2
               ballDx = -(Paddle - ballx) *.5 ;
               ballDy = -ballDy;
               play(paddlebounce);
           elseif Diff == 3
               ballDx = -(Paddle - ballx) ;
               ballDy = -ballDy;
               play(paddlebounce);
           end
          
        % Left side of Paddle
        else
               if Diff == 1
        
                ballDx = -(Paddle - ballx) *.2;
                ballDy = - ballDy
                play(paddlebounce);
               elseif Diff == 2
                   ballDx = -(Paddle - ballx) *.5 ;
               ballDy = -ballDy;
               play(paddlebounce);
               elseif Diff == 3
                   ballDx = -(Paddle - ballx) ;
               ballDy = -ballDy;
               play(paddlebounce);
               end
           
        end
    %Ball Did not Hit Paddle    
    elseif Lives == 0
    
       msgbox('Game Over', 'Breakout', 'Error')
       b = 1000;
        C = 100000000;
        
    else
        pause(.25);
        Lives = Lives - 1;
        ballx = 5;
        ballDx = 0;
        bally = 0;
        ballDy = -.2;
    end
        

    end
        
        %Checks to see if the Ball comes into contact with walls other than
        %the bottom
        if ballx > 9.8
            ballx = 9.5;
            ballDx = -ballDx;
            play(paddlebounce)
        elseif ballx < .2
            ballx = .5;
            ballDx = -ballDx;
            play(paddlebounce)
        elseif bally > 9.8
            bally = 9.6;
            ballDy = -ballDy;
            play(paddlebounce)
        end
        if bally > 5.4
            
            col = ceil(ballx);
            if col <= 0
                col = 1;
            
            elseif col > 10
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
                NrBlocks = NrBlocks - 1;
                NrPoints = NrPoints + 1;
                if col == 1
                    fill( [col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5], [.5, .5, .5]);
                    line([col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5, 4.5 + row], 'color', [.5, .5, .5]);
                    play(brickbounce);
                else
                    fill( [col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5], [.5, .5, .5]);
                    line([col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5, 4.5 + row], 'color', [.5, .5, .5]);
                    play(brickbounce);
              %  else
             
               %     fill( [col + BlockDist, BlockLength + col + BlockDist, BlockLength + col + BlockDist, col + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5], [.5, .5, .5]);
                %    line([col + BlockDist, BlockLength + col + BlockDist, BlockLength + col + BlockDist, col + BlockDist, col + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5, 4.5 + row], 'color', [.5, .5, .5]);
                %elseif col == 4
                 %    fill( [col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5], [.5, .5, .5]);
                  %   line([col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5, 4.5 + row], 'color', [.5, .5, .5]);
                %elseif col == 5
                 %    fill( [col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5], [.5, .5, .5]);
                  %  line([col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5, 4.5 + row], 'color', [.5, .5, .5]);
                %elseif col == 6
                 %    fill( [col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5], [.5, .5, .5]);
                  %  line([col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5, 4.5 + row], 'color', [.5, .5, .5]);
                %elseif col == 7
                 %    fill( [col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5], [.5, .5, .5]);
                  %  line([col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5, 4.5 + row], 'color', [.5, .5, .5]);
                %elseif col == 8
                 %    fill( [col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5], [.5, .5, .5]);
                  %  line([col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5, 4.5 + row], 'color', [.5, .5, .5]);
                %elseif col == 9
                 %    fill( [col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5], [.5, .5, .5]);
                  %  line([col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5, 4.5 + row], 'color', [.5, .5, .5]);
               % elseif col == 10
                %     fill( [col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5], [.5, .5, .5]);
                 %   line([col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, BlockLength + col - 1 + BlockDist, col - 1 + BlockDist, col - 1 + BlockDist] , [row + 4.5, row + 4.5, row + BlockHeight + 4.5, row + BlockHeight + 4.5, 4.5 + row], 'color', [.5, .5, .5]);
                end
                end

               
                
        end

        
        if NrBlocks == 0
            
           C = 100000000;
           
        end
       
end
        
if NrBlocks == 0
    play(win);
strwin = ['Congratulations,', Name, 'You have won!', 'Would you like to play again?'] 
Win = menu(strwin, 'Yes', 'No')

    
if Win == 1
   b = b + 1 
end
    
else
    b = 1000;
end
 
end
end


