%%
func = @(t) sinc(t);
%func = @(t) sinc(t).*cos(pi.*t);
dt = 0.1;
tmin = -4;
tmax =4;
t = tmin:dt:tmax;
figure(1)
plot(t,func(t))
grid on
%%
a = 0; %inicio da integra��o
b = inf;  %fim da integra��o
Func  = @(t) (2*exp(-t/2)).^2;
E = integral(Func, a, b)
%%