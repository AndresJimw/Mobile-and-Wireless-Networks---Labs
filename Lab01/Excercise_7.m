% Notes:
% - This exercise involves generating three sine waves with different frequencies and analyzing their spectra.
% - Understanding the synthesis and analysis of composite signals is fundamental in signal processing.
% - The 'fft' function in MATLAB computes the discrete Fourier transform of a signal.

% Define Parameters
fs = 1000; % Sampling frequency (1000 Hz)
t = 0:1/fs:2; % Time vector from 0 to 2 seconds with 1 ms steps

% Generate Individual Sine Waves
f1 = 10; % Frequency of the first sine wave (10 Hz)
f2 = 30; % Frequency of the second sine wave (30 Hz)
f3 = 70; % Frequency of the third sine wave (70 Hz)

y1 = sin(2 * pi * f1 * t); % First sine wave
y2 = sin(2 * pi * f2 * t); % Second sine wave
y3 = sin(2 * pi * f3 * t); % Third sine wave

% Plot Individual Sine Waves
figure;
subplot(4, 1, 1);
plot(t, y1);
title('10 Hz Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
grid;

subplot(4, 1, 2);
plot(t, y2);
title('30 Hz Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
grid;

subplot(4, 1, 3);
plot(t, y3);
title('70 Hz Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
grid;

% Create Composite Signal
y_composite = y1 + y2 + y3;

% Plot Composite Signal
subplot(4, 1, 4);
plot(t, y_composite);
title('Composite Signal (10 Hz + 30 Hz + 70 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid;

% Compute DFT of Composite Signal
Y = fft(y_composite);

% Define Frequency Axis
n = length(y_composite);
f = (0:n-1) * (fs/n);

% Plot DFT of Composite Signal
figure;
plot(f, abs(Y)/n);
title('DFT of Composite Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid;
xlim([0 100]); % Zoom into 0-100 Hz
