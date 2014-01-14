

     

function [] = BreakoutMouse(nrRows, nrCols)
set(gcf, 'WindowButtonMotionFcn', {@BreakoutMouse});
    
set(gca, 'xlim', [0, nrRows], 'ylim', [0, nrCols])
hold on
x = 5
y = 5

  d = .5
h = fill([x-0.5*d, x+0.5*d, x+0.5*d, x-0.5*d], ...
         [y-0.5*d, y-0.5*d, y+0.5*d, y+0.5*d], [1 0 0]);
  
        pos = get(gca, 'CurrentPoint');
        xpos = pos(1, 1)
        ypos = pos(1, 2)
        x = xpos;
        y = ypos;
       
        set(h, 'xdata',...
                [x-0.5*d, x+0.5*d, x+0.5*d, x-0.5*d]);     
        set(h, 'ydata',...
                [y-0.5*d, y-0.5*d, y+0.5*d, y+0.5*d]);
            pause(.025);
            drawnow;

end




