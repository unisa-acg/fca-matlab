% Plot style parameters
FS = 20;  % FontSize
LW = 3;  % LineWidth

% Collect simulation output
y = out.y;
yd = kd * out.r;
d = out.d;

% Create figure to plot data
figure()

% If the disturbance exists, plot it
if any(out.d.Data ~= 0)
    plot(d, '--', DisplayName="$d(t)$"); hold on;
end

% Plot reference and actual output on the same graph
plot(yd, '--', DisplayName="$y_d(t)$"); hold on;
plot(y, DisplayName="$y(t)$");

% Choose the style of the plot
grid on;
legend(Interpreter="latex");
title("System Response");
xlabel("$t~[s]$", Interpreter="latex");
ylabel("$y$", Interpreter="latex");

% Set font size and linewidth
set(findall(gcf, "-property", "FontSize"), FontSize=FS);
set(findall(gcf, Type="Line"), LineWidth=LW);

% If you want, you can analyze the closed-loop transfer function
% W = feedback(G, H)
% pole(W)
% Wd = feedback(P, C*H)
% pole(Wd)
