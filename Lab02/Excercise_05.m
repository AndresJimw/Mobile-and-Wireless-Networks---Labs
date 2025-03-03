% Exercise 5: KUSA FMVMP Dipole Antenna

% Frequencies and gain values from the data sheet (example values)
frequencies = [88e6, 98e6, 108e6]; % Frequencies in Hz (FM band)
gain_dBd_data_sheet = [2.5, 2.7, 2.6]; % Gain values in dBd from the data sheet

% Create a dipole antenna
dipoleAntenna = dipole;

% Initialize arrays to store simulated gains
gain_dBi_simulated = zeros(1, length(frequencies));
gain_dBd_simulated = zeros(1, length(frequencies));

% Simulate the gain at each frequency
for i = 1:length(frequencies)
    freq = frequencies(i);
    
    % Calculate the gain in dBi using the pattern function
    gain_dBi_simulated(i) = max(max(pattern(dipoleAntenna, freq)));
    
    % Convert dBi to dBd
    gain_dBd_simulated(i) = gain_dBi_simulated(i) - 2.15;
end

disp('Gain Verification:');
disp('Frequency (MHz) | Gain (dBd) - Data Sheet | Gain (dBd) - Simulated | Difference');
disp('---------------------------------------------------------------------------');
for i = 1:length(frequencies)
    difference = gain_dBd_data_sheet(i) - gain_dBd_simulated(i);
    fprintf('%.2f          | %.2f                | %.2f                  | %.2f\n', ...
        frequencies(i)/1e6, gain_dBd_data_sheet(i), gain_dBd_simulated(i), difference);
end

if all(abs(gain_dBd_data_sheet - gain_dBd_simulated) < 0.1) % Tolerance of 0.1 dB
    disp('The gain values in the data sheet are correct.');
else
    disp('The gain values in the data sheet do not match the simulated values.');
end

% 2: Is it an omnidirectional antenna? (Justify your answer).
% A dipole antenna is typically omnidirectional in the azimuth plane.
% This can be verified by plotting the radiation pattern.

% Create a dipole antenna
dipoleAntenna = dipole;

% Plot the radiation pattern at a frequency within the FM band
freq = 98e6; % Example frequency (98 MHz)
figure;
pattern(dipoleAntenna, freq);
title('Radiation Pattern of Dipole Antenna at 98 MHz');
saveas(gcf, 'fig_e05_radiation_pattern_98MHz.png');

disp('The dipole antenna is omnidirectional in the azimuth plane, as shown by the radiation pattern.');