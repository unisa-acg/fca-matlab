% Close all previous figures
close all;

% Plot style parameters
FS = 20;
LW = 2;

% Create a new figure
figure();

% Plot y
plot(out.y, DisplayName='y')
opening_time = str2double(get_param('ex_04_04/switch', 'opening_time'));
xline(opening_time, LineWidth=LW/2, LineStyle="--", DisplayName='controller breaks'); 
grid on
legend(Location='best', FontSize=FS);

% This command will set the font size to all the graphs
set(findall(gcf, '-property','FontSize'), FontSize=FS)

% This command will set the line width to all the lines of all the graphs
set(findall(gcf, Type='Line'), LineWidth=LW)
