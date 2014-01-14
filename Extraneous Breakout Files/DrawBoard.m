function [] = DrawBoard(nrRows, nrCols)
% Draw a tic-tac-toe board with
% nrRows rows and nrCols columns

%r-th horizontal line starts at (0, r) and
%goes all the way to (nrCols, r)
set(gca, 'xlim', [0 nrCols]);
set(gca, 'ylim', [0 nrRows]);

for r = 1 : 1 : nrRows - 1
line([0, nrCols], [r, r], ...
    'LineWidth', 4, 'Color', [.5 .5 .5]);
end
for c = 1 : 1 : nrCols - 1
line([c, c], [0, nrRows], ...
    'LineWidth', 4, 'Color', [.5 .5 .5]);
end
end

