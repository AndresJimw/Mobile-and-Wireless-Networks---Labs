% 1: Create a patch Microstrip antenna with length 75 mm and width 37.5 mm over a 120 mm x 120 mm ground plane, and feed offset at (18.57 mm, 0).
L = 75e-3; % Length in meters (75 mm)
W = 37.5e-3; % Width in meters (37.5 mm)
groundPlaneLength = 120e-3; % Ground plane length in meters (120 mm)
groundPlaneWidth = 120e-3; % Ground plane width in meters (120 mm)
feedOffset = [18.57e-3, 0]; % Feed offset in meters (18.57 mm, 0)

% Create the patch Microstrip antenna
patchAntenna = patchMicrostrip('Length', L, 'Width', W, 'GroundPlaneLength', groundPlaneLength, ...
    'GroundPlaneWidth', groundPlaneWidth, 'FeedOffset', feedOffset);

% View the patch antenna
figure;
show(patchAntenna);
title('Patch Microstrip Antenna');
saveas(gcf, 'fig_e04_patch_antenna.png');

% 2: Calculate the impedance over the frequency span 1.5 GHz - 2 GHz.
freq = linspace(1.5e9, 2e9, 101); % Frequency range from 1.5 GHz to 2 GHz
impedance = impedance(patchAntenna, freq);

% Plot the impedance
figure;
plot(freq / 1e9, real(impedance), 'LineWidth', 1.5, 'DisplayName', 'Real Part');
hold on;
plot(freq / 1e9, imag(impedance), 'LineWidth', 1.5, 'DisplayName', 'Imaginary Part');
xlabel('Frequency (GHz)');
ylabel('Impedance (Ohms)');
title('Impedance of Patch Antenna');
legend;
grid on;
saveas(gcf, 'fig_e04_impedance.png');

% 3: Find the pattern of the patch antenna created at 1.75 GHz.
freq_center = 1.75e9; % Center frequency in Hz (1.75 GHz)
figure;
pattern(patchAntenna, freq_center);
title('Radiation Pattern at 1.75 GHz');
saveas(gcf, 'fig_e04_radiation_pattern_1.75GHz.png');

% 4: Plot the azimuth radiation pattern and the elevation radiation pattern of this antenna.
% Azimuth radiation pattern (phi)
figure;
patternAzimuth(patchAntenna, freq_center);
title('Azimuth Radiation Pattern at 1.75 GHz');
saveas(gcf, 'fig_e04_azimuth_radiation_pattern_1.75GHz.png');

% Elevation radiation pattern (theta)
figure;
patternElevation(patchAntenna, freq_center);
title('Elevation Radiation Pattern at 1.75 GHz');
saveas(gcf, 'fig_e04_elevation_radiation_pattern_1.75GHz.png');

% 5: Calculate the beam width for the antenna created at azimuth=0 and elevation=1:1:360 (x-z plane).
% Use the pattern function to get the radiation pattern data
[pattern_data, azimuth, elevation] = pattern(patchAntenna, freq_center, 0, 1:1:360);

% Find the beamwidth manually
max_gain = max(pattern_data(:)); % Maximum gain
half_power = max_gain - 3; % Half-power level (3 dB below maximum)
beamwidth = sum(pattern_data >= half_power); % Beamwidth in degrees
fprintf('Beamwidth in the x-z plane: %.2f degrees\n', beamwidth);

% 6: Is it a directional antenna? (Justify your answer).
% The patch Microstrip antenna is directional. This is evident from the radiation patterns, which show a focused main beam in one direction and suppressed radiation in other directions. The directivity is due to the antenna's design, which concentrates energy in a specific direction.