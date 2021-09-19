close all;
clear;
clc;

syms x f_1(x) n t;

%variables de usuario
T=50e-6; %periodo
D_porcentaje = 20; %en "%"
def=20; %numero de armonicos
%-----------------------------
%D = D_porcentaje/100; %ciclo de trabajo
%tau=T*D;

%entre 0 y tau, eso se ve como una recta que avanza en x con pendiente
%(1/tau)
%entre tau y T, la pendiente será negativa
%f_1(x)=piecewise(0 < x < tau, (1/tau)*x , tau < x < T , (tau-x)/(T-tau)+1);
%fplot(f_1,[-T/5,T+(T/5)]);
%grid on



%ver los casos de 1 a def

for DC=[10,20,25,33.3,50]
    D = DC/100; %ciclo de trabajo
    tau=T*D;
    f_1(x)=piecewise(0 < x < tau, (1/tau)*x , tau < x < T , (tau-x)/(T-tau)+1);
    
    %coeficientes
    a_n=(2/T)*int( f_1(x) * cos((2*n*pi*x)/T ) ,x,0,T);
    b_n=(2/T)*int( f_1(x) * sin((2*n*pi*x)/T ) ,x,0,T);
    
    disp("\begin{table}[]")
    disp("\begin{tabular}{|c|c|c|}")
    disp("\hline")
    string = sprintf('\\multicolumn{3}{|c|}{DC: %0.1f \\%% } \\\\ \\hline', DC); disp(string)
    disp("n      & a\_n     & b\_n     \\ \hline")
    
    for i=1:def
        a = subs(a_n,n,i);
        b = subs(b_n,n,i);
        %string=sprintf('n=%d, a=%0.5e, b=%0.5e',i,a,b);
        string = sprintf('%d & %0.5f & %0.5f  \\\\ \\hline', i, a, b);
        disp(string)
    end
    disp("\end{tabular}")
    disp("\end{table}")
    disp(" ")
    disp(" ")
end

