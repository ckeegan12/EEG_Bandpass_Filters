load('hc1.mat');

% Parameters
Fs = 20000;             % Sampling frequency (Hz)
low_cutoff = 300;       % Low cutoff frequency (Hz)
high_cutoff = 8000;     % High cutoff frequency (Hz)
order = 4;              % Fourth-order filter
N = length(ch1);        % Amount of data points

% Filter Coefficients
Wn = [low_cutoff,high_cutoff] / (Fs/2); % Normalized Frequency
[b, a] = butter(order, Wn, 'bandpass'); % Butterworth band-pass filter
zplane(b,a)                             % Checks stability of the filterby looking at poles

% Zero-phase filtering using Butterworth 
zero_phase_filter = @(signal) filtfilt(b, a, signal);
eeg_signal = double(ch1 (:));                           
filtered_signal = zero_phase_filter(eeg_signal);

% Time vector for plotting
t = (0:length(eeg_signal)-1) / Fs;

%Fourier Transform Analysis
X = fft(ch1);
X = X(1:floor(N/2));
freqz(b,a,512,Fs)
freq = (0:floor(N/2)-1)*Fs/N;   % Frequency vector corresponding to the positive frequencies
Y = fft(filtered_signal);
Y = Y(1:floor(N/2));

figure(2);
stem(freq,abs(X))
title("FFT of unfiltered signal data")
xlabel("Frequency [Hz]")
ylabel("Amplitude")

figure(3);
stem(freq,abs(Y))
title("FFT of filtered signal data")
xlabel("Frequency [Hz]")
ylabel("Amplitude")

figure(4);
subplot(2, 1, 1);
plot(t,ch1);
title('Original Signal');
xlabel('Sample Number');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(t,filtered_signal);
title('Filtered Signal');
xlabel('Sample Number');
ylabel('Amplitude');
