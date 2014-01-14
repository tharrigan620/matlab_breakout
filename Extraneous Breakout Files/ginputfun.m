function [] = ginputfun



    
set(gca, 'xlim', [0, 10], 'ylim', [-10, 10])
hold on
x = 5
y = 5

  d = .5
h = fill([x-0.5*d, x+0.5*d, x+0.5*d, x-0.5*d], ...
         [y-0.5*d, y-0.5*d, y+0.5*d, y+0.5*d], [1 0 0]);
   for t = 1:1:10000000000
       t = t + 1
[x, y] = ginput

    set(h, 'xdata',...
                [x-0.5*d, x+0.5*d, x+0.5*d, x-0.5*d]);     
        set(h, 'ydata',...
                [y-0.5*d, y-0.5*d, y+0.5*d, y+0.5*d]);
            pause(.025);
            drawnow;
   end
end
