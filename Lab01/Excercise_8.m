% 1. Generate two sine waves:

% Notes:
% - Generating multiple sine waves and analyzing their combined signal is fundamental in signal processing.
% - The 'fft' function is used to compute the discrete Fourier transform, which helps in spectral analysis.

% Define Parameters
fs = 8192; % Sampling frequency (8192 Hz)
t = 0:1/fs:1-1/fs; % Time vector for 1 second duration

% Generate Sine Waves
s1 = sin(2 * pi * 440 * t); % Sine wave at 440 Hz with amplitude 1.0 V
s2 = 0.5 * sin(2 * pi * 1000 * t); % Sine wave at 1000 Hz with amplitude 0.5 V

% Sum the Sine Waves to Create Composite Signal
sig = s1 + s2;

% Plot the Composite Signal
figure; % Create a new figure
subplot(3, 1, 1);
plot(t, sig);
title('Combined Signal (s1 + s2)');
xlabel('Time (s)');
ylabel('Amplitude');
grid;

% Compute and Plot the Spectrum of the Combined Signal
Y = fft(sig);
f = (0:length(Y)-1) * (fs / length(Y)); % Frequency vector
Pyy = abs(Y).^2 / length(Y); % Power spectral density

subplot(3, 1, 2);
plot(f, Pyy);
title('Spectrum of Combined Signal');
xlabel('Frequency (Hz)');
ylabel('Power');
grid;

% Zoom in to plot only up to 2000 Hz
subplot(3, 1, 3);
plot(f(1:floor(length(f)/2)), Pyy(1:floor(length(Pyy)/2)));
title('Spectrum of Combined Signal (Zoomed In)');
xlabel('Frequency (Hz)');
ylabel('Power');
grid;

% 2. Assume the combined two-tone signal is stored in a variable called sig.

% Notes:
% - Adding noise to a signal helps in understanding the robustness of signal processing techniques.
% - The 'randn' function generates Gaussian noise, which is commonly used in simulations.

% Add Gaussian Noise to the Signal
noisy = sig + randn(size(sig)); % Create noisy version of the signal

% Plot the Noisy Signal
figure; % Create a new figure
subplot(3, 1, 1);
plot(t, noisy);
title('Noisy Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid;

% Compute and Plot the Spectrum of the Noisy Signal
Y_noisy = fft(noisy);
Pyy_noisy = abs(Y_noisy).^2 / length(Y_noisy);

subplot(3, 1, 2);
plot(f, Pyy_noisy);
title('Spectrum of Noisy Signal');
xlabel('Frequency (Hz)');
ylabel('Power');
grid;

subplot(3, 1, 3);
plot(f(1:floor(length(f)/2)), Pyy_noisy(1:floor(length(Pyy_noisy)/2)));
title('Spectrum of Noisy Signal (Zoomed In)');
xlabel('Frequency (Hz)');
ylabel('Power');
grid;
