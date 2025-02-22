% Notes:
% - Understanding different periodic waveforms is essential for various applications in signal processing.
% - MATLAB provides functions like 'square' and 'sawtooth' to generate these waveforms.

% Plot 1: Square Wave
subplot(4, 1, 1);
t = 0:0.001:2; % Time vector from 0 to 2 seconds with 1 ms steps
ysquare = square(2 * pi * 3 * t); % 3 Hz square wave
plot(t, ysquare);
title('3 Hz Square Wave');

% Plot 2: Triangular Pulse
subplot(4, 1, 2);
t = 0:1/1e3:1; % Time vector from 0 to 1 second with 1 kHz sampling frequency
d = 0:1/5:1; % 3 Hz repetition frequency
y = pulstran(t, d, 'tripuls', 0.1, -1); % Generate triangular pulses
plot(t, y);
xlabel('Time (s)');
ylabel('Waveform');

% Plot 3: Sawtooth Wave
subplot(4, 1, 3);
T = 10 * (1/50); % Duration corresponding to 10 periods of 50 Hz
Fs = 1000; % Sampling frequency 1000 Hz
dt = 1/Fs; % Time step
t = 0:dt:T-dt; % Time vector
x = sawtooth(2 * pi * 50 * t); % 50 Hz sawtooth wave
plot(t, x);
grid on;

% Plot 4: Gaussian Pulse Train
subplot(4, 1, 4);
t = 0:1/50e3:10e-3; % Time vector from 0 to 10 ms with 50 kHz sampling frequency
d = [0:1/1e3:10e-3; 0.8.^ (0:10)]'; % Gaussian pulse delays and amplitudes
y = pulstran(t, d, 'gauspuls', 10e3, 0.5); % Generate periodic Gaussian pulses
plot(t, y);
xlabel('Time (s)');
ylabel('Periodic Gaussian Pulse');
