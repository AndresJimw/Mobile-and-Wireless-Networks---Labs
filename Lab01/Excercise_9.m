% Notes:
% - The Fourier series represents a function as a sum of sinusoidal functions.
% - The square wave can be approximated by summing the terms of its Fourier series.
% - The 'fft' function is used to compute the discrete Fourier transform, which helps in spectral analysis.

% Define Parameters
A = 5; % Amplitude of the square wave
T = 0.1e-3; % Period of the square wave (0.1 ms)
f0 = 1/T; % Fundamental frequency
t = 0:1e-6:3*T; % Time vector with a duration of 3 periods

% 1. Graph the first term of the Fourier Series representation of the square wave
% with amplitude A = 5 and period T = 0.1 ms. Additionally, plot its spectrum.

% First Term of the Fourier Series
y1 = (4*A/pi) * sin(2*pi*f0*t);

% Plot the First Term of the Fourier Series
figure;
subplot(3, 2, 1);
plot(t, y1);
title('First Term of the Fourier Series');
xlabel('Time (s)');
ylabel('Amplitude');
grid;

% Compute and Plot the Spectrum of the First Term
Y1 = fft(y1);
f = (0:length(Y1)-1) * (1/(length(Y1) * (t(2) - t(1)))); % Frequency vector
Pyy1 = abs(Y1).^2 / length(Y1); % Power spectral density

subplot(3, 2, 2);
plot(f, Pyy1);
title('Spectrum of First Term');
xlabel('Frequency (Hz)');
ylabel('Power');
grid;

% 2. Graph the first three terms of the Fourier Series and plot their combined spectrum.

% First Three Terms of the Fourier Series
y2 = y1 + (4*A/pi) * (1/3) * sin(2*pi*3*f0*t) + (4*A/pi) * (1/5) * sin(2*pi*5*f0*t);

% Plot the First Three Terms of the Fourier Series
subplot(3, 2, 3);
plot(t, y2);
title('First Three Terms of the Fourier Series');
xlabel('Time (s)');
ylabel('Amplitude');
grid;

% Compute and Plot the Spectrum of the First Three Terms
Y2 = fft(y2);
Pyy2 = abs(Y2).^2 / length(Y2); % Power spectral density

subplot(3, 2, 4);
plot(f, Pyy2);
title('Spectrum of First Three Terms');
xlabel('Frequency (Hz)');
ylabel('Power');
grid;

% 3. Graph the first seven terms of the Fourier Series and plot their combined spectrum.

% First Seven Terms of the Fourier Series
y3 = y2 + (4*A/pi) * (1/7) * sin(2*pi*7*f0*t) + (4*A/pi) * (1/9) * sin(2*pi*9*f0*t) + ...
    (4*A/pi) * (1/11) * sin(2*pi*11*f0*t) + (4*A/pi) * (1/13) * sin(2*pi*13*f0*t);

% Plot the First Seven Terms of the Fourier Series
subplot(3, 2, 5);
plot(t, y3);
title('First Seven Terms of the Fourier Series');
xlabel('Time (s)');
ylabel('Amplitude');
grid;

% Compute and Plot the Spectrum of the First Seven Terms
Y3 = fft(y3);
Pyy3 = abs(Y3).^2 / length(Y3); % Power spectral density

subplot(3, 2, 6);
plot(f, Pyy3);
title('Spectrum of First Seven Terms');
xlabel('Frequency (Hz)');
ylabel('Power');
grid;
