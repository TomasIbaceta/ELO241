close all;
clear;
clc;

syms x f_1(x) n t;

%variables de usuario
T=50e-6; %periodo
D_porcentaje = 20; %en "%"
def=20; %numero de armonicos
%-----------------------------
D = D_porcentaje/100; %ciclo de trabajo
tau=T*D;

f_1(x)=piecewise(0 < x < tau, (1/tau)*x , tau < x < T , (tau-x)/(T-tau)+1);
%fplot(f_1,[-T/5,T+(T/5)]);
%grid on

%coeficientes
a_n=(2/T)*int( f_1(x) * cos((2*n*pi*t)/T ) ,t,0,T);
b_n=(2/T)*int( f_1(x) * sin((2*n*pi*t)/T ) ,t,0,T);

