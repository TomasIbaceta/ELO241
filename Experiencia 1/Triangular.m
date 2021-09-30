close all;
clear;
clc;
format short
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
    
    disp("\begin{table}[H]")
    disp("\begin{tabular}{|c|c|c|c|c|}")
    disp("\hline")
    string = sprintf('\\multicolumn{5}{|c|}{DC: %0.1f \\%% } \\\\ \\hline', DC); disp(string)
    disp("n      & a\_n     & b\_n     & 10log(a\_n)  &  10log(b\_n)     \\ \hline")
    
    for i=1:def
        a = subs(a_n,n,i);
        loga=10*log10(a);
        b = subs(b_n,n,i);
        logb=10*log10(b);
        %string=sprintf('n=%d, a=%0.5e, b=%0.5e',i,a,b);
        string = sprintf('%d & %0.5f & %0.5f & %0.5f & %0.5f \\\\ \\hline', i, a, b, loga, logb);
        disp(string)
    end
    disp("\end{tabular}")
    disp("\end{table}")
    disp(" ")
    disp(" ")
end
%%

losD=[0.25,0.5];
losn=[3,5,7,9];
T=50e-6; %periodo


syms x f_1(x) n t;


for i=losD
    tau=T*i;
    f_1(x)=piecewise(0 < x < tau, (1/tau)*x , tau < x < T , (tau-x)/(T-tau)+1);
    for m=losn
        a_0=0;
        a_n=(2/T)*int( f_1(x) * cos((2*n*pi*x)/T ) ,x,0,T);
        b_n=(2/T)*int( f_1(x) * sin((2*n*pi*x)/T ) ,x,0,T);       
        f=(a_0/2)+symsum(a_n*cos((2*n*pi*t)/T)+b_n*sin((2*n*pi*t)/T),n,1,m);
        string=sprintf("Duty Cycle: %d %%, Armonicos: %d",i*100,m);
        figure
        fplot(f, [0 100*10^-6])
        title(string)
    end
end
