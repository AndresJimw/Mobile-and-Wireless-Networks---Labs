% Notes:
% - Digital signal processing (DSP) is widely used in speech processing for tasks such as compression, transmission, recognition, and speaker identification.
% - This exercise demonstrates the fundamental steps of reading and manipulating a speech signal in MATLAB.

% Step 1: Use the audioread command to load speech.au into MATLAB
file_path = 'D:\Archivos de Usuario\Documents\MATLAB\Mobile and Wireless Networks\Lab01\speech\speech.au';
[audio_signal, Fs] = audioread(file_path);

% Step 2: Plot the signal as a continuous-time waveform using the plot command
figure;
plot(audio_signal);
title('Continuous-Time Waveform of Speech Signal');
xlabel('Sample Number');
ylabel('Amplitude');
grid on;

% Step 3: Play the signal through your workstation's digital-to-analog converter using the sound function
sound(audio_signal, Fs);
