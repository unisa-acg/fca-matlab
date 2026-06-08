%% Setup

close all;

%% Plot style variables

FS = 15;  % FontSize
LW = 2;  % LineWidth

%% Definizione del problema

% Plant
P = tf(zpk([], [0 -1], 2));

% Measurement
H = 1 / 2;
kd = 1 / H;

%% Specifiche di regime: errore nullo rispetto a un riferimento a gradino

% Controller
C0 = tf(zpk([], [], 1));

% Other transfer functions
G0 = C0 * P;
F0 = G0 * H;

% Plot
f0_handle = figure();
margin(F0);
grid on;
legend("$F_0(j\omega)$", Interpreter="latex");

% Set legends
axs = findall(f0_handle, Type="Axes");
txt = "$F_0(j\omega)$";
for ii = 1 : length(axs)
    lines = findall(axs(ii), Type="Line");
    legend(axs(ii), lines(1), txt, Interpreter="latex");
    lgd = legend(axs(ii));
    lgd.String = txt; lgd.String = txt;
    lgd.Interpreter = "latex";
end

%% Specifiche di regime: errore nullo rispetto a un disturbo a gradino

% Controller
C1 = tf(zpk([], [0], 1));

% Other transfer functions
G1 = C1 * P;
F1 = G1 * H;

% Plot
figure();
margin(F1);
grid on;
legend("$F_1(j\omega)$", Interpreter="latex");

% Set legends
axs = findall(gcf, Type="Axes");
txt = "$F_1(j\omega)$";
for ii = 1 : length(axs)
    lines = findall(axs(ii), Type="Line");
    legend(axs(ii), lines(1), txt, Interpreter="latex");
    lgd = legend(axs(ii));
    lgd.String = txt; lgd.String = txt;
    lgd.Interpreter = "latex";
end

%% Stabilità

% Controller
C2 = tf(zpk([-0.1], [0], 10));

% Other transfer functions
G2 = C2 * P;
F2 = G2 * H;
W2 = feedback(G2, H);

% Plot
figure();
margin(F2);
grid on;
legend("$F_2(j\omega)$", Interpreter="latex");

% Set legends
axs = findall(gcf, Type="Axes");
txt = "$F_2(j\omega)$";
for ii = 1 : length(axs)
    lines = findall(axs(ii), Type="Line");
    legend(axs(ii), lines(1), txt, Interpreter="latex");
    lgd = legend(axs(ii));
    lgd.String = txt; lgd.String = txt;
    lgd.Interpreter = "latex";
end

%% Tune gain to adjust phase margin

% Controller: we set w_c to 0.3 by dividing C2 by |F2(j0.3)|
C3 = C2 / abs(freqresp(F2,0.3));

% Other transfer functions
G3 = C3 * P;
F3 = G3 * H;
W3 = feedback(G3, H);
W3H = W3 * H;

% Plot F3
figure();
margin(F3);
grid on;
legend("$F_3(j\omega)$", Interpreter="latex");

% Set legends
axs = findall(gcf, Type="Axes");
txt = "$F_3(j\omega)$";
for ii = 1 : length(axs)
    lines = findall(axs(ii), Type="Line");
    legend(axs(ii), lines(1), txt, Interpreter="latex");
    lgd = legend(axs(ii));
    lgd.String = txt; lgd.String = txt;
    lgd.Interpreter = "latex";
end

% Plot W3
handle = figure();
bode(W3H);
grid on;
legend("$W_3^{'}(j\omega)$", Interpreter="latex");

% Plot vertical lines at desired frequencies
% If it does not work on MATLAB online, execute this block again
w = [0.03, 0.1, 1];
axs = findall(handle, Type="Axes");
for jj = 1 : length(w)
    ww = w(jj);
    colorOrder = colororder;
    color = colorOrder(jj + 1, :);
    xline(axs(1), ww, '--', DisplayName=['$\omega = ' num2str(ww) '$'], Color=color, LineWidth=1.5);
    xline(axs(2), ww, '--', Color=color, LineWidth=1.5, HandleVisibility='off');
end

%% Plot style

% This command will set the font size to all the figures
set(findall(findall(groot, Type="Figure"), "-property","FontSize"), FontSize=FS);

% This command will set the line width to all the lines of all the figures
set(findall(findall(groot, Type="Figure"), Type="Line"), LineWidth=LW);
