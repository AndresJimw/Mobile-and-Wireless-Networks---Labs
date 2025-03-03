% Parameter definition
length_dipole = 2; % length of 2 meters
width_dipole = 0.05; % initial width
frequency_span = 50e6:1e6:100e6; % frequency range 50 MHz - 100 MHz

% Create and visualize the dipole
dipole_antenna = dipole('Length', length_dipole, 'Width', width_dipole);
figure;
show(dipole_antenna);
title('Dipole Antenna');
saveas(gcf, 'fig_e01_dipole_antenna.png');

% Calculate the impedance of the dipole
impedance_values = impedance(dipole_antenna, frequency_span);
figure;
plot(frequency_span/1e6, real(impedance_values), 'r', frequency_span/1e6, imag(impedance_values), 'b');
xlabel('Frequency (MHz)');
ylabel('Impedance (Ohms)');
title('Dipole Impedance vs Frequency');
legend('Real Part', 'Imaginary Part');
saveas(gcf, 'fig_e01_impedance.png');

% Plot the radiation patterns
figure;
pattern(dipole_antenna, 70e6);
title('Azimuth Radiation Pattern at 70 MHz');
saveas(gcf, 'fig_e01_azimuth_pattern_70MHz.png');

figure;
patternElevation(dipole_antenna, 70e6);
title('Elevation Radiation Pattern at 70 MHz');
saveas(gcf, 'fig_e01_elevation_pattern_70MHz.png');

% Calculate the beam width
azimuth = 0;
elevation = 1:1:360;
beamwidth_azimuth = beamwidth(dipole_antenna, 70e6, azimuth, elevation);
fprintf('Beam width for azimuth = 0 and elevation = 1:1:360 is %.2f degrees\n', beamwidth_azimuth);

% Design of the dipole at 2.6 MHz
frequency_2_6MHz = 2.6e6;
half_wave_dipole_length = 3e8 / frequency_2_6MHz / 2;
width_dipole_high_gain = 0.0576347; % minimum width to avoid error
high_gain_dipole = dipole('Length', half_wave_dipole_length, 'Width', width_dipole_high_gain);

% Plot the radiation patterns for the dipole at 2.6 MHz
figure;
pattern(high_gain_dipole, frequency_2_6MHz);
title('Azimuth Radiation Pattern at 2.6 MHz');
saveas(gcf, 'fig_e01_azimuth_pattern_2_6MHz.png');

figure;
patternElevation(high_gain_dipole, frequency_2_6MHz);
title('Elevation Radiation Pattern at 2.6 MHz');
saveas(gcf, 'fig_e01_elevation_pattern_2_6MHz.png');

% Calculate the beam width for the dipole at 2.6 MHz
beamwidth_2_6MHz_azimuth = beamwidth(high_gain_dipole, frequency_2_6MHz, azimuth, elevation);
fprintf('Beam width for 2.6 MHz dipole at azimuth = 0 and elevation = 1:1:360 is %.2f degrees\n', beamwidth_2_6MHz_azimuth);

% Evaluate omnidirectionality based on the uniformity of the radiation pattern
pattern_data = pattern(high_gain_dipole, frequency_2_6MHz, 0, 0:5:360);
is_omnidirectional = all(abs(pattern_data - mean(pattern_data)) < 0.1 * mean(pattern_data));
fprintf('Is the 2.6 MHz dipole omnidirectional? %s\n', string(is_omnidirectional));

% Design of 10 half-wave dipoles
% Design of 10 dipoles with specific L/λ ratios

% Parameter definition
frequency_2_6MHz = 2.6e6; % Frequency of operation
wavelength = 3e8 / frequency_2_6MHz; % Wavelength

% Define the desired L/λ ratios
dipole_length_ratios = [0.1, 0.25, 0.5, 0.75, 1.00, 1.25, 1.50, 2.00, 5.00, 8.00];
num_dipoles = length(dipole_length_ratios); % Number of dipoles to design

% Design of dipoles and plot their field patterns
for i = 1:num_dipoles
    % Get the L/λ ratio for the current dipole
    dipole_length_ratio = dipole_length_ratios(i);
    
    % Calculate the dipole length
    dipole_length = dipole_length_ratio * wavelength; % Dipole length
    
    % Calculate the width dynamically as a percentage of the length
    width_dipole_dynamic = max(0.0576347, 0.05 * dipole_length); % 5% of the length or 0.0576347, whichever is greater
    
    % Create the dipole
    multi_dipole = dipole('Length', dipole_length, 'Width', width_dipole_dynamic);
    
    % Create a new figure for each dipole
    figure;
    pattern(multi_dipole, frequency_2_6MHz); % Plot the radiation pattern
    title(sprintf('Radiation pattern for L/λ = %.2f', dipole_length_ratio));
    saveas(gcf, sprintf('fig_e01_multi_dipole_pattern_L_lambda_%.2f.png', dipole_length_ratio));
end