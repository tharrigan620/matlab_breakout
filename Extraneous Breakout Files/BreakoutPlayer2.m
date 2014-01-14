function []= BreakoutPlayer2
set(gca, 'xlim', [0, 10], 'ylim', [-10, 10])
hold on
h = fill([0, 10, 10, 0], [-10, -10, 10, 10], [.5, .5, .5])
BlockLength = .7;
BlockHeight = .2;
NrBlocks = 0;
col = .15;
row = 9.5;
Paddle = 5;
PaddleSpeed = 0;
[SoundData, fs] = wavread('loadingsound.wav');
loadingsound = audioplayer(SoundData, fs);
%Drawing Board
while NrBlocks < 50
    if col == 10.15
        row = row - 1;
        col = .15;
    end
    if row == 9.5
        r = 1; g = 0; b = 1;
      fill([col, BlockLength + col, BlockLength + col, col], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] )
     play(loadingsound);
      drawnow;
      pause(.1)
      col = col + 1;
     NrBlocks = NrBlocks + 1;
     

    end
  
    if row == 8.5
        r = 1; g = 1; b = 0;
        fill([col, BlockLength + col, BlockLength + col, col], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] )
      drawnow;
      pause(.1)
      col = col + 1;
      NrBlocks = NrBlocks + 1;
    
    end
    if row == 7.5
        r = 0; g = 1; b = 1;
        fill([col, BlockLength + col, BlockLength + col, col], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] )
     
        drawnow;
      
      pause(.1)
      NrBlocks = NrBlocks + 1;
    col = col + 1;
    
    end
    if row == 6.5
        r = 0; g = 1; b = 0;
        fill([col, BlockLength + col, BlockLength + col, col], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] )
      drawnow;
      pause(.1)
    col = col + 1;
    NrBlocks = NrBlocks + 1;

    end
    if row == 5.5
       r = 1; g = 0; b = 0;
        fill([col, BlockLength + col, BlockLength + col, col], [row, row, row + BlockHeight, row + BlockHeight], [r, g, b] )
      drawnow;
      pause(.1)
    col = col + 1;
    NrBlocks = NrBlocks + 1;
   
    end
end
  %Name Dialog Box
   Name = inputdlg('Hello Player! What is your name?', 'Breakout');
   str = ['Hello,', Name, 'Would you like to play on easy, normal, or hard mode?'];
  Diff = menu(str, 'Easy', 'Normal', 'Hard') ;
   if Diff == 1
       PaddlePos = fill([Paddle - 2.5, Paddle + 2.5, Paddle + 2.5, Paddle - 2.5], [-9, -9, -8.7, -8.7], [0, 0, 1]);
   elseif Diff == 2
    PaddlePos = fill([Paddle - 1, Paddle + 1, Paddle + 1, Paddle - 1], [-9, -9, -8.7, -8.7], [0, 0, 1]);
   elseif Diff == 3
   PaddlePos = fill([Paddle - .5, Paddle + .5, Paddle + .5, Paddle - .5], [-9, -9, -8.7, -8.7], [0, 0, 1]);
   else
       msgbox('You did not select a Difficulty, so it has been set to Normal', 'Breakout', 'Error')
    PaddlePos = fill([Paddle - 1, Paddle + 1, Paddle + 1, Paddle - 1], [-9, -9, -8.7, -8.7], [0, 0, 1]);
   end
   
       
%Paddle Motion
Lives = 3;
while Lives > 0
    
key = get(gcf, 'CurrentCharacter');



    

%Diff = 1


if Lives > 0 && Diff == 1
           
            
        figure
            
        
       
       if key == 'd' 
           
           if PaddleSpeed < -.00001
               PaddleSpeed = 0;
           end
           
           
               Paddle = Paddle + PaddleSpeed;
           PaddleSpeed = PaddleSpeed + .025;
           
           
                for t = 0:.025:.025
             
              if Paddle > 10
                  Paddle = 0;
                
                set(PaddlePos, 'xdata', [Paddle - 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle - 2.5 + PaddleSpeed])
                set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
                  pause(.025)
                  if PaddleSpeed > 2
                      MaxSpeed = 2;
                  PaddleSpeed = MaxSpeed;
                  
                  
                   set(PaddlePos, 'xdata', [Paddle - 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle - 2.5 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
                  end
               
              elseif Paddle < 10
                    set(PaddlePos, 'xdata', [Paddle - 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle - 2.5 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
              else
                  set(PaddlePos, 'xdata', [Paddle - 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle - 2.5 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
          if  PaddleSpeed > 2 
              MaxSpeed = 2;
                  PaddleSpeed = MaxSpeed;
                  
                  
                   set(PaddlePos, 'xdata', [Paddle - 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle - 2.5 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
          
          end
                end
                end
       end
       
      
           
        
   
       elseif key == 'a' 
           if PaddleSpeed > .00001
               PaddleSpeed = 0;
           end
           
                 Paddle = Paddle + PaddleSpeed;
           PaddleSpeed = PaddleSpeed - .025;
           
           
                for t = 0:.025:.025
             
              if Paddle < 0
                  Paddle = 10;
                
                set(PaddlePos, 'xdata', [Paddle - 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle - 2.5 + PaddleSpeed])
                set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
                  pause(.025)
                  
               
              elseif Paddle > 10
                  Paddle = 0;
                    set(PaddlePos, 'xdata', [Paddle - 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle - 2.5 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
       
              else 
                  set(PaddlePos, 'xdata', [Paddle - 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle - 2.5 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
              end
         
          if  PaddleSpeed < -2 
              MaxSpeed = -2;
                  PaddleSpeed = MaxSpeed;
                  
                  
                   set(PaddlePos, 'xdata', [Paddle - 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle + 2.5 + PaddleSpeed, Paddle - 2.5 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
          
          end
                
                end
       end
      
      
       
   
%Diff = 2
       if Lives > 0 && Diff == 2
           
         
       
            
        pause(.0025)
        
       
       if key == 'd' 
           drawnow;
           if PaddleSpeed < -.00001
               PaddleSpeed = 0;
           end
           
           
               Paddle = Paddle + PaddleSpeed;
           PaddleSpeed = PaddleSpeed + .025;
           
           
                for t = 0:.025:.025
             
             
              if Paddle > 10
                  Paddle = 0;
                
                set(PaddlePos, 'xdata', [Paddle - 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle - 1 + PaddleSpeed])
                set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
                  pause(.025)
                  if PaddleSpeed > 2
                      MaxSpeed = 2;
                  PaddleSpeed = MaxSpeed;
                  
                  
                   set(PaddlePos, 'xdata', [Paddle - 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle - 1 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
                  end
               
              elseif Paddle < 10
                    set(PaddlePos, 'xdata', [Paddle - 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle - 1 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
              else
                  set(PaddlePos, 'xdata', [Paddle - 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle - 1 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
          if  PaddleSpeed > 2 
              MaxSpeed = 2;
                  PaddleSpeed = MaxSpeed;
                  
                  
                   set(PaddlePos, 'xdata', [Paddle - 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle - 1 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
          
          end
                end
           end
      
           
        
   
       elseif key == 'a' 
           drawnow
           if PaddleSpeed > .00001
               PaddleSpeed = 0;
           end
           
                 Paddle = Paddle + PaddleSpeed;
           PaddleSpeed = PaddleSpeed - .025;
           
           
                for t = 0:.025:.025
             
              if Paddle < 0
                  Paddle = 10;
                
                set(PaddlePos, 'xdata', [Paddle - 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle - 1 + PaddleSpeed])
                set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
                  pause(.025)
                  
               
              elseif Paddle > 10
                  Paddle = 0;
                    set(PaddlePos, 'xdata', [Paddle - 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle - 1 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
       
              else 
                  set(PaddlePos, 'xdata', [Paddle - 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle - 1 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
              end
         
          if  PaddleSpeed < -2 
              MaxSpeed = -2;
                  PaddleSpeed = MaxSpeed;
                  
                  
                   set(PaddlePos, 'xdata', [Paddle - 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle + 1 + PaddleSpeed, Paddle - 1 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
          
          end
                
                end
       end
      
      
       
       end
       
       %Diff = 3
       if Lives > 0 && Diff == 3
           
            
        pause(.0025)
       
       if key == 'd' 
           if PaddleSpeed < -.00001
               PaddleSpeed = 0;
           end
           
           
               Paddle = Paddle + PaddleSpeed;
           PaddleSpeed = PaddleSpeed + .025;
           
           
                for t = 0:.025:.025
             
              if Paddle > 10
                  Paddle = 0;
                
                set(PaddlePos, 'xdata', [Paddle - .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle - .5 + PaddleSpeed])
                set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
                  pause(.025)
                  if PaddleSpeed > 2
                      MaxSpeed = 2;
                  PaddleSpeed = MaxSpeed;
                  
                  
                   set(PaddlePos, 'xdata', [Paddle - .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle - .5 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
                  end
               
              elseif Paddle < 10
                    set(PaddlePos, 'xdata', [Paddle - .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle - .5 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
              else
                  set(PaddlePos, 'xdata', [Paddle - .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle - .5 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
          if  PaddleSpeed > 2 
              MaxSpeed = 2;
                  PaddleSpeed = MaxSpeed;
                  
                  
                   set(PaddlePos, 'xdata', [Paddle - .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle - .5 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
          
          end
                end
           end
      
           
        
   
       elseif key == 'a' 
           if PaddleSpeed > .00001
               PaddleSpeed = 0;
           end
           
                 Paddle = Paddle + PaddleSpeed;
           PaddleSpeed = PaddleSpeed - .025;
           
           
                for t = 0:.025:.025
             
              if Paddle < 0
                  Paddle = 10;
                
                set(PaddlePos, 'xdata', [Paddle - .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle - .5 + PaddleSpeed])
                set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
                  pause(.025)
                  
               
              elseif Paddle > 10
                  Paddle = 0;
                    set(PaddlePos, 'xdata', [Paddle - .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle - .5 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
       
              else 
                  set(PaddlePos, 'xdata', [Paddle - .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle - .5 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
              end
         
          if  PaddleSpeed < -2 
              MaxSpeed = -2;
                  PaddleSpeed = MaxSpeed;
                  
                  
                   set(PaddlePos, 'xdata', [Paddle - .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle + .5 + PaddleSpeed, Paddle - .5 + PaddleSpeed])
                    set(PaddlePos, 'ydata', [ -9, -9, -8.7, -8.7])
               pause(.025)
          
          end
                
                end
       
      
   



      
      
       
       end
end



end
end
