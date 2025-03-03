% Exercise 2: Monopole antenna

% Item 1: Create a monopole with length 1 m and width 0.01 m over a 2.5 m x 2.5 m ground plane and view it.
L = 1; % Length in meters
d = 0.01; % Diameter in meters

% Create a monopole over a ground plane (2.5 m x 2.5 m)
monopole = monopole('Height', L, 'Width', d, 'GroundPlaneLength', 2.5, 'GroundPlaneWidth', 2.5);

% View the monopole antenna
figure;
show(monopole);
title('Monopole Antenna');
saveas(gcf, 'fig_e02_monopole_antenna.png');

% Item 2: Plot the radiation pattern of the monopole at 75 MHz.
% Operating frequency
freq = 75e6; % 75 MHz

% Compute and plot the radiation pattern
figure;
pattern(monopole, freq);
title('Radiation Pattern at 75 MHz');
saveas(gcf, 'fig_e02_radiation_pattern_75MHz.png');

% Item 3: Plot the azimuth radiation pattern and the elevation radiation pattern of this antenna.
% Azimuth radiation pattern (phi)
figure;
patternAzimuth(monopole, freq);
title('Azimuth Radiation Pattern at 75 MHz');
saveas(gcf, 'fig_e02_azimuth_radiation_pattern_75MHz.png');

% Elevation radiation pattern (theta)
figure;
patternElevation(monopole, freq);
title('Elevation Radiation Pattern at 75 MHz');
saveas(gcf, 'fig_e02_elevation_radiation_pattern_75MHz.png');

% Item 4: Is it an omnidirectional antenna?
% An omnidirectional antenna radiates uniformly in all horizontal directions.
% The monopole antenna typically exhibits an omnidirectional radiation pattern in the azimuth plane.
% The azimuth radiation pattern should be circular, indicating uniform radiation in all horizontal directions.
% The elevation radiation pattern shows variation, with a maximum typically towards the horizon and nulls in the vertical direction.
