function []= BreakoutPlayerRev
set(gca, 'xlim', [0, 10], 'ylim', [-10, 10])
hold on
h = fill([0, 10, 10, 0], [-10, -10, 10, 10], [.5, .5, .5])
BlockLength = 1;
BlockHeight = .2;
NrBlocks = 0;
col = 0;
row = 9.5;
Paddle = 5;
PaddleSpeed = 0;
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
        fill([col, BlockLength + col, BlockLength + col, col], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] )
      %  play(loadingsound);
  
        pause(.1)
        col = col + 1;
        NrBlocks = NrBlocks + 1;
        
        
    end
    
    if row == 8.5
        r = 1; g = 1; b = 0;
        fill([col, BlockLength + col, BlockLength + col, col], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] )
     
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



%Paddle Motion
Lives = 3;

        Paddle = 5;
        ballx = 5;
bally = 5;
ballpos = fill([ballx - .125, ballx + .125, ballx + .125, ballx - .125], [bally - .25, bally - .25, bally + .25, bally + .25], [1, 0, 0])

        
        
        %Name Dialog Box
        Name = inputdlg('Hello Player! What is your name?', 'Breakout');
        str = ['Hello,', Name, 'Would you like to play on easy, normal, or hard mode?'];
        Diff = menu(str, 'Easy', 'Normal', 'Hard') ;
        
        if Diff == 1
            PaddlePos = fill([Paddle - 2.5, Paddle + 2.5, Paddle + 2.5, Paddle - 2.5], [-9, -9, -8.7, -8.7], [0, 0, 1]);
            PaddlePosRange = Paddle - 2.5:.1:Paddle + 2.5;
            
            
    
    set(ballpos, 'ydata', [bally - .25, bally - .25, bally + .25, bally + .25])
            
            
        elseif Diff == 2
            PaddlePos = fill([Paddle - 1, Paddle + 1, Paddle + 1, Paddle - 1], [-9, -9, -8.7, -8.7], [0, 0, 1]);
        elseif Diff == 3
            PaddlePos = fill([Paddle - .5, Paddle + .5, Paddle + .5, Paddle - .5], [-9, -9, -8.7, -8.7], [0, 0, 1]);
        else
            msgbox('You did not select a Difficulty, so it has been set to Normal', 'Breakout', 'Error')
            PaddlePos = fill([Paddle - 1, Paddle + 1, Paddle + 1, Paddle - 1], [-9, -9, -8.7, -8.7], [0, 0, 1]);
        end

    function [] = MyButtonMotionFcn(src, event)
        pos = get(gca, 'CurrentPoint');
        xpos = pos(1, 1);
        ypos = pos(1, 2);
        Paddle= xpos;
        y = ypos;
        if Diff == 1
            set(PaddlePos, 'xdata', [Paddle - 2.5, Paddle + 2.5, Paddle + 2.5, Paddle - 2.5])
            drawnow;
        
        end
    end
if Diff == 1
     for bally = 5.1:-.2:-8.7
       
        
       
    set(ballpos, 'ydata', [bally - .25, bally - .25, bally + .25, bally + .25])
    drawnow;
    pause(.025);
   end
    c = 0
    while c < 10000000000000000
        c = c + 1
  
   if bally <= -8.65 && bally >= -8.85
    if ballx > Paddle - 2.5 && ballx < Paddle + 2.5
        if ballx > Paddle
            %While Loop Here?
         
             while ballx <= 9.9
             ballx = ballx + .2
             bally = bally + .2
             set(ballpos, 'ydata', [bally - .25, bally - .25, bally + .25, bally + .25]);
        set(ballpos, 'xdata', [ballx - .25, ballx + .25, ballx + .25, ballx - .25]);
             end
        else
            while ballx >= -9.9
                ballx = ballx - .2
                bally = bally + .2
                set(ballpos, 'ydata', [bally - .25, bally - .25, bally + .25, bally + .25]);
        set(ballpos, 'xdata', [ballx - .25, ballx + .25, ballx + .25, ballx - .25]);
            end
         end
        
        
      %if ballx >= 9.9
%while ballx >= -9.9
    %ballx = ballx - .2
       %     bally = bally + .2
        %    set(ballpos, 'ydata', [bally - .25, bally - .25, bally + .25, bally + .25]);
        %set(ballpos, 'xdata', [ballx - .25, ballx + .25, ballx + .25, ballx - .25]);
        %end
      %else
       %   while ballx <= -9.9
        %      ballx = ballx + .2
         %     bally = bally + .2
        %set(ballpos, 'ydata', [bally - .25, bally - .25, bally + .25, bally + .25]);
        %set(ballpos, 'xdata', [ballx - .25, ballx + .25, ballx + .25, ballx - .25]);
        %pause(.025)
        %drawnow;
        % end
        
         %end
        
            
            for bally = -8.7:.2:9.9
                if ballx <= -10
            for ballx = -9.9:.2:9.9
            
            bally = bally + .2
            set(ballpos, 'ydata', [bally - .25, bally - .25, bally + .25, bally + .25]);
        set(ballpos, 'xdata', [ballx - .25, ballx + .25, ballx + .25, ballx - .25]);
            end
        ballx = ballx - .2
        set(ballpos, 'ydata', [bally - .25, bally - .25, bally + .25, bally + .25]);
        set(ballpos, 'xdata', [ballx - .25, ballx + .25, ballx + .25, ballx - .25]);
        pause(.025)
        drawnow;
            end
        
            end
         end
        end
       
         end
         %While Loop Here?
           while bally == 9.9:-.2:-8.7
                  set(ballpos, 'ydata', [bally - .25, bally - .25, bally + .25, bally + .25]);
              drawnow;
              if bally <= -8.65 && bally >= -8.85
    if ballx > Paddle - 2.5 && ballx < Paddle + 2.5
         for bally = -8.7:.2:9.9
               set(ballpos, 'ydata', [bally - .25, bally - .25, bally + .25, bally + .25]);
              drawnow;
              
             
         end
          
             
    end
              end
           
           end
    end
  
   
          
            
         
         
       
       
    
    

       
   
   
            
       

    
end








