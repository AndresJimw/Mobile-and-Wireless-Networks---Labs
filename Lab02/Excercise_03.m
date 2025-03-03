% 1: Create the default Yagi-Uda array.
yagi = yagiUda; % Create a default Yagi-Uda antenna
figure;
show(yagi);
title('Default Yagi-Uda Antenna');
saveas(gcf, 'fig_e03_default_yagi_uda.png');

% 2: Change the number of directors to 13 and view the structure.
yagi.NumDirectors = 13; % Set the number of directors to 13
figure;
show(yagi);
title('Yagi-Uda Antenna with 13 Directors');
saveas(gcf, 'fig_e03_yagi_uda_13_directors.png');

% 3: Plot the radiation pattern of the Yagi-Uda array at the frequency 300 MHz.
freq = 300e6; % Frequency in Hz (300 MHz)
figure;
pattern(yagi, freq);
title('Radiation Pattern at 300 MHz');
saveas(gcf, 'fig_e03_radiation_pattern_300MHz.png');

% 4: Plot the azimuth radiation pattern and the elevation radiation pattern of this antenna.
% Azimuth radiation pattern (phi)
figure;
patternAzimuth(yagi, freq);
title('Azimuth Radiation Pattern at 300 MHz');
saveas(gcf, 'fig_e03_azimuth_radiation_pattern_300MHz.png');

% Elevation radiation pattern (theta)
figure;
patternElevation(yagi, freq);
title('Elevation Radiation Pattern at 300 MHz');
saveas(gcf, 'fig_e03_elevation_radiation_pattern_300MHz.png');

% 5: Calculate the beam width for the antenna created at azimuth=0 and elevation=1:1:360 (x-z plane).
[beamwidth, angles] = beamwidth(yagi, freq, 0, 1:1:360);
fprintf('Beamwidth in the x-z plane: %.2f degrees\n', beamwidth);

% 6: Is it an omnidirectional antenna? (Justify your answer).
% The Yagi-Uda antenna is not omnidirectional. It is a highly directional antenna, as evident from the radiation patterns, which show a focused main beam in one direction and suppressed radiation in other directions.