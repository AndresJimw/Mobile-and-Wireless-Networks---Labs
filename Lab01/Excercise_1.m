% Notes:
% - Understanding how discrete-time signals are represented and plotted is crucial for digital signal processing.
% - The 'stem' function is specifically used to visualize discrete-time signals.
% - Continuous-time signals can be approximated by plotting values at closely spaced time points and connecting them with lines.
% - Using the 'subplot' function allows for multiple plots in a single figure, facilitating comparative analysis.
% - The step size in the time vector affects the smoothness of the continuous-time signal's plot.

% Define Discrete-Time Signal
n = 0:2:60;
y = sin(n/6);

% Plot Discrete-Time Signal
subplot(3, 1, 1);
stem(n, y);
title('Discrete-Time Signal');
xlabel('n');
ylabel('y = sin(n/6)');

% Define First Continuous-Time Signal
n1 = 0:2:60;
z = sin(n1/6);

% Plot First Continuous-Time Signal
subplot(3, 1, 2);
plot(n1, z);
title('Continuous-Time Signal (Step Size 2)');
xlabel('n1');
ylabel('z = sin(n1/6)');

% Define Second Continuous-Time Signal
n2 = 0:10:60;
w = sin(n2/6);

% Plot Second Continuous-Time Signal
subplot(3, 1, 3);
plot(n2, w);
title('Continuous-Time Signal (Step Size 10)');
xlabel('n2');
ylabel('w = sin(n2/6)');
