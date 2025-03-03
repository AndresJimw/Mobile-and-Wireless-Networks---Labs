% Displays information about the Antenna Toolbox and its functions.
help antenna

% Creates a microstrip patch antenna object.
p = patchMicrostrip;
p.Height = 0.01;  % Sets the height of the substrate for the microstrip patch antenna.

% Computes the impedance of the antenna over a frequency range from 500 MHz to 2 GHz.
impedance(p, (500e6:10e6:2e9));
saveas(gcf, 'fig_e0A_impedance.png');

% Computes the current distribution on the antenna at 1.66 GHz.
current(p, 1.66e9);
saveas(gcf, 'fig_e0A_current_distribution.png');

% Plots the radiation pattern of the antenna at 1.66 GHz.
pattern(p, 1.66e9);
saveas(gcf, 'fig_e0A_radiation_pattern.png');
