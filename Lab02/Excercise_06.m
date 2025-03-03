% Exercise 6: Verification of radiation patterns

% 1: Create an antenna model (example: dipole antenna)
dipoleAntenna = dipole;

% 2: Define the frequency of operation
freq = 98e6; % Example frequency (98 MHz)

% 3: Simulate the radiation pattern using MATLAB
[pattern_data, azimuth, elevation] = pattern(dipoleAntenna, freq);

% 4: Plot the simulated radiation pattern
figure;
pattern(dipoleAntenna, freq);
title('Simulated Radiation Pattern at 98 MHz');
saveas(gcf, 'fig_e06_simulated_radiation_pattern.png');

% 5: Compare with the data sheet (example: assume data sheet provides gain values)
azimuth_data_sheet = 0:30:360; % Azimuth angles in degrees
gain_data_sheet = [2.5, 2.6, 2.7, 2.8, 2.9, 3.0, 2.9, 2.8, 2.7, 2.6, 2.5]; % Example gain values in dBd

% Convert gain from dBd to dBi
gain_data_sheet_dBi = gain_data_sheet + 2.15;

% Ensure elevation = 0 exists (use a tolerance)
tol = 1e-3; % Small tolerance to avoid floating-point issues
elevation_index = find(abs(elevation - 0) < tol, 1); % Get first match

if isempty(elevation_index)
    error('Elevation = 0° not found in the simulated data.');
end

% Extract azimuth pattern and ensure correct shape
pattern_data_azimuth = squeeze(pattern_data(:, elevation_index)); % Convert to 1D array

% Ensure azimuth and pattern_data_azimuth have the same length
if length(azimuth) ~= length(pattern_data_azimuth)
    % Interpolate azimuth values to match the length of pattern_data_azimuth
    azimuth = linspace(min(azimuth), max(azimuth), length(pattern_data_azimuth));
end

% Correct out-of-bounds azimuth data sheet angles
azimuth_data_sheet(azimuth_data_sheet < min(azimuth)) = min(azimuth);
azimuth_data_sheet(azimuth_data_sheet > max(azimuth)) = max(azimuth);

% Interpolate simulated data to match azimuth angles of data sheet
gain_simulated_dBi = interp1(azimuth, pattern_data_azimuth, azimuth_data_sheet, 'linear', 'extrap');

% Ensure gain_data_sheet_dBi and gain_simulated_dBi have the same length
if length(gain_data_sheet_dBi) ~= length(gain_simulated_dBi)
    gain_data_sheet_dBi = interp1(linspace(0, 360, length(gain_data_sheet_dBi)), gain_data_sheet_dBi, azimuth_data_sheet, 'linear', 'extrap');
end

% Calculate the difference between simulated and data sheet values
difference = gain_data_sheet_dBi - gain_simulated_dBi;

% Display the results
disp('Comparison of Radiation Patterns:');
disp('Azimuth (deg) | Gain (dBi) - Data Sheet | Gain (dBi) - Simulated | Difference');
disp('---------------------------------------------------------------------------');
for i = 1:length(azimuth_data_sheet)
    fprintf('%3d          | %.2f                | %.2f                  | %.2f\n', ...
        azimuth_data_sheet(i), gain_data_sheet_dBi(i), gain_simulated_dBi(i), difference(i));
end

% 6: Analyze the results
if all(abs(difference) < 0.5) % Tolerance of 0.5 dB
    disp('The radiation patterns match within an acceptable margin of error.');
else
    disp('There are significant discrepancies between the data sheet and the simulation.');
end
