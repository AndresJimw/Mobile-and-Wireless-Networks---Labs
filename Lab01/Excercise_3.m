% Notes:
% - Generating and understanding sinusoidal signals is fundamental for signal processing and communications.
% - Sinusoidal signals are often characterized by their amplitude, frequency, and phase.
% - The 'cos' function is used to generate cosine waveforms in MATLAB.
% - Combining signals by summing them is a common practice in signal processing.

% Define Frequency and Period
f = 4e3; % Frequency of the sinusoid in Hz (4000 Hz)
T = 1/f; % Period of the sinusoid (250 microseconds)

% Define Time Step and Time Vector
tstep = T/25; % Time step to generate 25 samples per period
t = -T:tstep:T; % Time vector from -T to T (one period before to one period after)

% Define the First Sinusoidal Signal
x1 = 36 * cos(2 * pi * f * t);

% Define the Second Sinusoidal Signal
x2 = 43 * cos(2 * pi * f * t);

% Sum of the first and second sinusoidal signals
x3 = x1 + x2;

% Plot the Signals
subplot(3, 1, 1);
plot(t, x1);
title('x1(t) = 36cos(2\pi \cdot 4000 \cdot t)');
xlabel('time (sec)');
grid;

subplot(3, 1, 2);
plot(t, x2);
title('x2(t) = 43cos(2\pi \cdot 4000 \cdot t)');
xlabel('time (sec)');
grid;

subplot(3, 1, 3);
plot(t, x3);
title('x3(t) = x1(t) + x2(t)');
xlabel('time (sec)');
grid;
