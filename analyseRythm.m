clear, clc, close all
[signal,Fs] = audioread('120BPM_C_croche.wav');
signal = signal(:, 1);                        % get the first channel
N = length(signal)                          % signal length
Fs
t = (0:N-1)/Fs;                     % signal time vector

FFTSize = 256;
hopSize = 128; 
FFTNumber = N /128
FFTVector = 0:FFTNumber-1;
Y= fft(signal,FFTSize)
P2 = abs(Y/FFTSize);
P1 = P2(1:FFTSize/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(FFTSize/2))/FFTSize;
figure(1)
semilogx(f,P1)

title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
for i=FFTNumber
    
end
    

%time domain signal
figure(2)
plot(t, signal)         
xlim([0 max(t)])
ylim([-1.1*max(abs(signal)) 1.1*max(abs(signal))])
xlabel('Time, s')
ylabel('Amplitude')
title('The signal in the time domain')

% plot the signal spectrogram
figure(2)
spectrogram(signal, FFTSize, hopSize, FFTSize, Fs, 'yaxis')
box on
xlabel('Time, s')
ylabel('Frequency, Hz')
title('Spectrogram of the signal')

h = colorbar;
set(h, 'FontName', 'Times New Roman', 'FontSize', 14)
ylabel(h, 'Magnitude, dB')


