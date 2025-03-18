load hc1.mat

Fs = 20000;
Fc = 8000;
Fl = 300;
Fcn = Fc/(Fs/2);
Fln = Fl/(Fs/2);
N = length(ch1); %smaple size
t = (0:N-1)/Fs; %time vector
k = 0:N;

B = fir1(150,[Fln Fcn],chebwin(151,60));
filtered_data = filter(B,1,ch1);
figure (2);
freqz(B,1)
X = fft(ch1);
X = X(1:floor(N/2));     % Keep only positive frequencies
freq = (0:floor(N/2)-1)*Fs/N;   % Frequency vector corresponding to the positive frequencies
Y = fft(filtered_data);
Y= Y(1:floor(N/2));

figure(1);
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
plot(ch1);
title('Original Signal');
xlabel('Sample Number');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(filtered_data);
title('Filtered Signal');
xlabel('Sample Number');
ylabel('Amplitude');
