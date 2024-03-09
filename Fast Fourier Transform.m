% Define a sample signal
Fs = 1000;              % Sampling frequency
T = 1/Fs;               % Sampling period
L = 1000;               % Length of signal
t = (0:L-1)*T;          % Time vector

% Create a signal containing a 50 Hz sinusoid and a 120 Hz sinusoid
S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);

% Add some random noise to the signal
X = S + 2*randn(size(t));

% Plot the signal in the time domain
subplot(2,1,1);
plot(1000*t(1:50),X(1:50));
title('Signal Corrupted with Zero-Mean Random Noise');
xlabel('t (milliseconds)');
ylabel('X(t)');

% Calculate the Fourier transform of the signal
Y = fft(X);

% Compute the two-sided spectrum P2.
P2 = abs(Y/L);

% Compute the single-sided spectrum P1 based on P2.
P1 = P2(1:L/2+1);

% Define the frequency domain f and plot the single-sided amplitude spectrum
f = Fs*(0:(L/2))/L;
subplot(2,1,2);
plot(f,P1);
title('Single-Sided Amplitude Spectrum of X(t)');
xlabel('f (Hz)');
ylabel('|P1(f)|');
