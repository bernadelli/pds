%%
%Bernadelli 2020; clariton.bernadelli@uftm.edu.br; claritonbernadelli@gmail.com

%KALMAN FILTERNG APPLIED TO POWER SYSTEM MEASUREMENT FOR RELAYING
%M.S. Sachdev; H.C. Woxd; N.G. Johnson - 1985
%%
%clc
%close all
%clear all
%%
n=100; %samples
t=0;   
f=60;  %signal freq
fs=1000;%sample freq
Ts=1/fs;
for i=1:n
    y(i)=cos(2*pi*f*t); % Ideal sampled signal
    tempo(i)=t;
    t=t+Ts;
end
V=zeros(2,n);
V(1,:)=y;
figure
subplot (4,1,1)
plot(V(1,:))

theta=2*pi/(fs/f);
p=[cos(theta) -sin(theta);sin(theta) cos(theta)]; %Matriz p, deslocamento do fasor
q=p; %Matriz q, deslocamento da vairação de carga

for i=1:n
    
    V(:,i)= p * [V(1,i); V(2,i)] + q *[0.005;0.005]; %Steade state
end
subplot (4,1,2)
plot(V(1,:))

c=[1 0]; % Just real part
pd = makedist('Normal','mu',0,'sigma',0.1);
sz=[1 n];
b=random(pd,sz); %Random vector b with normal distribution, zero mean and 0,1 deviation

Vs=c * V + b; %Signal acquisition

subplot (4,1,3)
plot(Vs)

M=[(0.24)^2 0;0 (0.24)^2]; %Covariance matrix
B=cov(b); %Noise covariance
%B=[(0.010)^2 0;0 (0.010)^2];
U=[(0.005)^2 0;0 (0.005)^2];
Vhat=zeros(2,i);
%Kalman gains
for i=1:n
    K=M*c'*(c*M*c'+ B)^-1;
    
    Z=(eye(2)-K*c)*M;
    
    M=p*Z*p'+q*U*q';
    
    Vhat(:,i+1)=p*Vhat(:,i)+K*(Vs(i)-c*p*Vhat(:,i)); %Sinal estimado
end
Vhat=Vhat(:,1:n);
subplot (4,1,4)
plot(Vhat(1,:))