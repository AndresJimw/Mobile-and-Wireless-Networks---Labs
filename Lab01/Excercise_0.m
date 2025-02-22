t = 0:0.01:10; % Data from 0 to 10 seconds
y = 5 * sin(t); % Evaluates function at each time in t

plot(t, y);
title('5sin(t)');
xlabel('time (sec)');
grid;
