 function[] = BreakoutKeys(src, event);
key = get(gcf, 'CurrentCharacter');
Paddle = 5
Lives = 3
  PaddlePos = fill([Paddle - 1, Paddle + 1, Paddle + 1, Paddle - 1], [-9, -9, -8.7, -8.7], [0, 0, 1]);
  Diff = 2
pause(.05)

    

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
 
       