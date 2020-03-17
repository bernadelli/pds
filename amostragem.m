%F0 = 1,2 kHz, Fs = 16 kHz, phi_0 = pi/4 rad, A = 10, t0 = 0, tf = 5 ms

Fs=16e3;
t=0:1/Fs:5e-3;
n=0:length(t)-1;

subplot(211);
plot(t,10*sin(2*pi*1200*t+pi/4));
xlabel('continuous time');
ylabel('amplitude')
title('Continuous-time sinusoidal signal')

subplot(212);
stem(10*sin(2*pi*1200/16000*n+pi/4))
xlabel('discrete time');
ylabel('amplitude')
title('Discrete-time sinusoidal signal')