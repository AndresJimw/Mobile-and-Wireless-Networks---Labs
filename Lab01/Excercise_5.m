% Notes:
% - Non-periodic signals do not have repeating cycles.
% - The sinc function is a common example of a non-periodic signal.
% - The 'linspace' function generates linearly spaced vectors, which is useful for defining the domain of the function.

% Generate Sinc Function
x = linspace(-5, 5); % Generate linearly spaced vector from -5 to 5
y = sinc(x);

% Plot Sinc Function
plot(x, y);
grid;
title('Sinc Function');
xlabel('x'); 
ylabel('sinc(x)');

% Notes:
% - Chirp signals are non-periodic signals where the frequency increases or decreases over time.
% - The 'chirp' function in MATLAB generates a frequency-swept cosine signal.
% - Understanding how to generate and analyze chirp signals is useful in radar and communication systems.

% Define Sampling Frequency and Time Step
fs = 150000; % Sampling frequency (150 kHz)
ts = 1/fs; % Time step (sampling interval)

% Define Chirp Signal Parameters
tpuls = 10e-3; % Duration of the chirp (10 milliseconds)
f1 = 94; % Start frequency of the chirp (94 Hz)
f2 = 9000; % End frequency of the chirp (9000 Hz)
t = 0:ts:tpuls; % Time vector from 0 to tpuls

% Generate chirp signal from f1 to f2 over time t
y = chirp(t, f1, t(end), f2);

% Plot Chirp Signal
plot(t, y, 'b*-'); % Add blue stars and lines
grid on;
title('Chirp Signal'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 
