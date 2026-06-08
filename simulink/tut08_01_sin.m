% Plot style parameters
FS = 15;  % FontSize

% Create a figure
figure()
sgtitle("System Response");
colorOrder = get(gca, 'ColorOrder');

% Simulate the system for each frequency
for ii = 1 : length(w)
    % Plot the responses on separate graphs
    subplot(length(w), 1, ii);

    % Select the frequency and the related period
    ww = w(ii);
    T = 2 * pi / ww;

    % Set the disturbance to be 0
    set_param('tut08_01/disturbance', Sw='0');

    % Set the reference to be a sine wave
    set_param('tut08_01/reference selector', Value='2');
    
    % Set the desired frequency
    set_param('tut08_01/Sine', Frequency=num2str(ww));
    
    % Simulate
    out = sim("tut08_01.slx", 5 * T);
    
    % Collect simulation output
    y = out.y;
    yd = kd * out.r;
    
    % Plot
    color = colorOrder(ii + 1,:);
    plot(yd, '--', Color=color, DisplayName='$y_d(t)$', LineWidth=1.5); hold on;
    plot(y, color=color, DisplayName='$y(t)$', LineWidth=2);

    % Set title, legend, labels, etc.
    title([], Color="none");
    lgd = legend(Box="off", Location="eastoutside", Interpreter="latex");
    title(lgd, ['$\omega = ' num2str(ww) '$']);
    xlabel("$t~[s]$", Interpreter="latex");
    ylabel("$y$", Interpreter="latex");
    xlim([0, out.tout(end)]);
    grid on;
end

% Set plot style
set(findall(gcf, '-property','FontSize'), FontSize=FS);
