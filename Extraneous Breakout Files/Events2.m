
function [] = Events2
set(gcf, 'WindowButtonMotionFcn', {@MyButtonMotionFcn});
set(gca, 'xlim', [-10, 10])
set(gca, 'ylim', [-10, 10])

hold on

 x = 1
 y = 1
  d = .5
h = fill([x-0.5*d, x+0.5*d, x+0.5*d, x-0.5*d], ...
         [y-0.5*d, y-0.5*d, y+0.5*d, y+0.5*d], [1 0 0]);
  
     

function [] = BreakoutMouse(src, event)
        pos = get(gca, 'CurrentPoint');
        xpos = pos(1, 1)
        ypos = pos(1, 2)
        x = xpos;
        y = ypos;
       
        set(h, 'xdata',...
                [x-0.5*d, x+0.5*d, x+0.5*d, x-0.5*d]);     
        set(h, 'ydata',...
                [y-0.5*d, y-0.5*d, y+0.5*d, y+0.5*d]);
            drawnow;
            
end
end


