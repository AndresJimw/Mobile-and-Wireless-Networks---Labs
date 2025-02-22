% Notes:
% - Continuous-time signals are defined for every instant of time.
% - The 'plot' function is used to visualize continuous-time signals in MATLAB.
% - Understanding how to create and plot continuous-time signals is essential for signal processing.

% Define Time Vector
t = 0:0.01:10; % Data from 0 to 10 seconds, with an increment of 0.01 seconds

% Define Continuous-Time Signal
y = 5 * sin(t); % Evaluates the sine function at each time in t

% Plot the Continuous-Time Signal
plot(t, y);
title('5sin(t)'); 
xlabel('time (sec)');
grid; 
