%senal cuadrada dado un ciclo de trabajo
%f(x)=1 para te[0<tau] y f(x)=0 para te[tau<T]
close all;
clear;
clc;

%variables de usuario
T=50e-6; %periodo
D_porcentaje = 50; %en "%"
def=20; %numero de armonicos
%-----------------------------
D = D_porcentaje/100; %ciclo de trabajo
tau=T*D;
syms t;
syms n;

a_0=(2/T)*tau;
a_n=(2/T)*int(cos((2*n*pi*t)/T),-tau/2,tau/2);
b_n=(2/T)*int(sin((2*n*pi*t)/T),-tau/2,tau/2);

f=(a_0/2)+symsum(a_n*cos((2*n*pi*t)/T)+b_n*sin((2*n*pi*t)/T), n, 1, def); %a_0/2 + sumatoria de 1 hasta def en torno a n de tal función
fplot(f,[-T/5,T+(T/5)]);

%poner afuera el caso 0
string=sprintf('n=0, a_0=%0.5e, b_0=0',a_0); disp(string)

%ver los casos de 1 a def
for n=1:def
    a=subs(a_n,n);
    b=subs(b_n,n);
    string=sprintf('n=%d, a_n=%0.5e, b_n=%0.5e',n,a,b);
    disp(string)
end
    
