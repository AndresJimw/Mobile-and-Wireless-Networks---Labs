% Notes:
% - Sampling is the process of converting a continuous-time signal into a discrete-time signal.
% - The sampling period (Ts) determines how frequently the signal is recorded.
% - Using different sampling rates allows analysis of the impact on signal representation.

% Define Continuous-Time Signal
f = @(t) sin(2*pi*t);

% 1. Ts = 1/10, 0 ≤ n ≤ 100; axis([0,100,-1,1])
Ts1 = 1/10;
n1 = 0:100;
x1 = f(Ts1 * n1);

% 2. Ts = 1/3, 0 ≤ n ≤ 30; axis([0,30,-1,1])
Ts2 = 1/3;
n2 = 0:30;
x2 = f(Ts2 * n2);

% 3. Ts = 1/2, 0 ≤ n ≤ 20; axis([0,20,-1,1])
Ts3 = 1/2;
n3 = 0:20;
x3 = f(Ts3 * n3);

% 4. Ts = 10/9, 0 ≤ n ≤ 9; axis([0,9,-1,1])
Ts4 = 10/9;
n4 = 0:9;
x4 = f(Ts4 * n4);

% 1. Submit a hard copy of the figure containing all four subplots.
% Create Figure with Subplots
figure;

% Plot 1: Ts = 1/10
subplot(4, 1, 1);
stem(n1, x1);
title('Ts = 1/10');
xlabel('n');
ylabel('x[n]');
axis([0, 100, -1, 1]);
grid on;

% Plot 2: Ts = 1/3
subplot(4, 1, 2);
stem(n2, x2);
title('Ts = 1/3');
xlabel('n');
ylabel('x[n]');
axis([0, 30, -1, 1]);
grid on;

% Plot 3: Ts = 1/2
subplot(4, 1, 3);
stem(n3, x3);
title('Ts = 1/2');
xlabel('n');
ylabel('x[n]');
axis([0, 20, -1, 1]);
grid on;

% Plot 4: Ts = 10/9
subplot(4, 1, 4);
stem(n4, x4);
title('Ts = 10/9');
xlabel('n');
ylabel('x[n]');
axis([0, 9, -1, 1]);
grid on;

% 2. Analyze the results by comparing the sampled versions of the signal.
% Notes:
% - Higher resolution sampling (Ts = 1/10) captures the signal more accurately.
% - As Ts increases (Ts = 1/3, Ts = 1/2, Ts = 10/9), the sampled signal becomes more distorted.

% 3. Discuss how the choice of Ts affects the representation of the original signal.
% Notes:
% - A smaller Ts (higher sampling rate) results in a more accurate representation of the original signal.
% - A larger Ts (lower sampling rate) results in fewer samples and may cause distortion or aliasing.

% 4. Compare the high-resolution sampling case (Ts = 1/10) with lower-resolution cases (Ts = 1/3, Ts = 1/2, Ts = 10/9).
% Consider whether aliasing or distortion occurs at larger values of Ts.
% Notes:
% - In the high-resolution case (Ts = 1/10), the sampled signal closely resembles the continuous-time signal.
% - In lower-resolution cases (Ts = 1/3, Ts = 1/2, Ts = 10/9), the sampled signal deviates more from the original, leading to potential aliasing or distortion.
