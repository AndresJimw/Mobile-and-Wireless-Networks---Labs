% Notes:
% - Understanding the creation and plotting of sinusoidal signals is essential for signal processing and communications.
% - Sinusoidal signals are often represented in terms of amplitude, frequency, and phase.
% - The 'plot' function is used to visualize continuous-time signals in MATLAB.
% - Phase shifts need to be converted from degrees to radians for correct computation.

% Define Time Vector
t = 0:1e-5:4*0.0008; % Create a time vector from 0 to 4 cycles of 0.0008 seconds each

% Define First Sine Wave
y1 = 3.5 * sin(2 * pi * 1250 * t); % Sine wave with amplitude 3.5, frequency 1250 Hz, phase shift 0 degrees

% Define Second Sine Wave
y2 = 4.5 * sin(2 * pi * 1250 * t - 45 * pi / 180); % Sine wave with amplitude 4.5, frequency 1250 Hz, phase shift -45 degrees (converted to radians)

% Plot Both Sine Waves
plot(t, y1, t, y2);
title('Two Sine Waves');
xlabel('time (sec)');
grid;
legend('y1', 'y2');
