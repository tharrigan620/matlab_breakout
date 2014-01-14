function [] = Events(nrRows, nrCols)
DrawBoard(nrRows, nrCols);
 hold on;

     Paddle = 5

set(gcf, 'KeyPressFcn', {@MyKeyPressFcn});
set(gcf, 'WindowButtonDownFcn', {@MyButtonDownFcn});
set(gcf, 'WindowButtonMotionFcn', {@MyButtonMotionFcn});
set(gcf, 'WindowButtonUpFcn', {@MyButtonUpFcn});

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
end


   


