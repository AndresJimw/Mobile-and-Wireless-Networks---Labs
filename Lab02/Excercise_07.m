% Exercise 7: Radiation Pattern Optimization of a 6-Element Yagi-Uda Antenna

% Define the design frequency (VHF band)
freq = 165e6; % 165 MHz (VHF)
lambda = 3e8 / freq; % Wavelength

% Create a dipole as the exciter
d = dipole;
d.Length = 0.48 * lambda;
d.Width = 0.005 * lambda;

% Create a default 6-element Yagi-Uda antenna
yagi = yagiUda;
yagi.NumDirectors = 4; % 1 reflector + 1 driven element + 4 directors = 6 elements
yagi.Exciter = d;

% Initial parameters: [ReflectorLength, ReflectorSpacing, DirectorLength, DirectorSpacing]
initialParams = [0.5, 0.2, 0.45, 0.25]; % Adjusted initial values

% Define bounds for the parameters (reflector and director lengths, spacings)
lb = [0.45, 0.15, 0.4, 0.2]; % Lower bounds
ub = [0.55, 0.25, 0.5, 0.3]; % Upper bounds

% Plot the radiation pattern before optimization
figure;
pattern(yagi, freq);
title('Radiation Pattern Before Optimization');
saveas(gcf, 'fig_e07_1.png');

% Perform the optimization using fmincon
options = optimoptions('fmincon', 'Display', 'iter', 'Algorithm', 'sqp', 'TolFun', 1e-6, 'TolX', 1e-6);
optimizedParams = fmincon(@(x) -directivityObjective(x, yagi, freq), initialParams, [], [], [], [], lb, ub, [], options);

% Update the Yagi-Uda antenna with the optimized parameters
yagi.ReflectorLength = optimizedParams(1) * lambda;
yagi.ReflectorSpacing = optimizedParams(2) * lambda;
yagi.DirectorLength = optimizedParams(3) * lambda;
yagi.DirectorSpacing = optimizedParams(4) * lambda;

% Plot the radiation pattern after optimization
figure;
pattern(yagi, freq);
title('Radiation Pattern After Optimization');
saveas(gcf, 'fig_e07_2.png');

% Display the optimized parameters
disp('Optimized Parameters:');
disp(['Reflector Length: ', num2str(optimizedParams(1) * lambda), ' m']);
disp(['Reflector Spacing: ', num2str(optimizedParams(2) * lambda), ' m']);
disp(['Director Length: ', num2str(optimizedParams(3) * lambda), ' m']);
disp(['Director Spacing: ', num2str(optimizedParams(4) * lambda), ' m']);

% Function to calculate directivity at zenith (elevation = 90°)
function d = directivityObjective(x, yagi, freq)
    % Update the antenna parameters
    yagi.ReflectorLength = x(1) * (3e8 / freq);
    yagi.ReflectorSpacing = x(2) * (3e8 / freq);
    yagi.DirectorLength = x(3) * (3e8 / freq);
    yagi.DirectorSpacing = x(4) * (3e8 / freq);
    
    % Calculate the radiation pattern
    [pattern_data, ~, elevation] = pattern(yagi, freq);
    
    % Find the index for elevation = 90°
    zenith_index = find(abs(elevation - 90) < 1e-3, 1);
    
    % Get the directivity at zenith
    d = pattern_data(zenith_index);
    
    % Display the directivity at zenith for debugging
    disp(['Directivity at Zenith: ', num2str(d), ' dBI']);
end