% Notes:
% - FFT (Fast Fourier Transform) is an efficient algorithm to compute the discrete Fourier transform and its inverse.
% - Spectral analysis helps in identifying the frequency components of a signal, especially when it's buried in noise.

% Generate Time Vector
t = 0:0.001:0.25; % Time vector from 0 to 0.25 seconds with 1 ms steps

% Generate Signal with Sine Waves at 50 Hz and 120 Hz
x = sin(2 * pi * 50 * t) + sin(2 * pi * 120 * t); % Sum of sine waves

% Plot Time Domain Signal
figure; % Create a new figure
plot(x(1:50));
title('Time domain signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid;

% Apply FFT
Y = fft(x, 251); % Compute the FFT of the signal with 251 points

% Calculate Power Spectral Density
Pyy = Y .* conj(Y) / 251; % Compute power spectral density

% Generate Frequency Axis
f = 1000 / 251 * (0:127); % Frequency axis for the first 128 points

% Plot Power Spectral Density
figure; % Create a new figure
plot(f, Pyy(1:128));
title('Power spectral density');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency');
grid;


% Notes:
% - Fourier series represents a function as a sum of sinusoidal functions.
% - Understanding Fourier series helps in analyzing periodic signals in both time and frequency domains.

% Define Time Vector for Fourier Series
t = 0:0.1e-3/100:3*0.1e-3; % 100 samples per cycle with 3 cycles

% Generate Fourier Series Terms
y1 = (20/pi) * sin(2 * pi * 1e4 * t);
figure; % Create a new figure
subplot(3, 1, 1);
plot(t, y1);
title('One Term of Fourier Series');
grid;

y2 = (20/pi) * (1/3 * sin(2 * pi * 3 * 1e4 * t));
y3 = (20/pi) * (1/5 * sin(2 * pi * 5 * 1e4 * t));
subplot(3, 1, 2);
plot(t, y1 + y2 + y3);
title('First Three Terms of Fourier Series');
grid;

y4 = (20/pi) * (1/7 * sin(2 * pi * 7 * 1e4 * t));
y5 = (20/pi) * (1/9 * sin(2 * pi * 9 * 1e4 * t));
y6 = (20/pi) * (1/11 * sin(2 * pi * 11 * 1e4 * t));
y7 = (20/pi) * (1/13 * sin(2 * pi * 13 * 1e4 * t));
subplot(3, 1, 3);
plot(t, y1 + y2 + y3 + y4 + y5 + y6 + y7);
title('First Seven Terms of Fourier Series');
grid;
