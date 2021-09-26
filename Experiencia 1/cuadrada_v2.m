%senal cuadrada dado un ciclo de trabajo
%f(x)=1 para te[0<tau] y f(x)=0 para te[tau<T]
close all;
clear;
clc;

%variables de usuario
T=50e-6; %periodo
DC_p = [10, 20, 25, 33.3, 50];
n_a=20; %numero de armonicos

%----------------
DC = DC_p/100;
syms t n k tau;

a_0 = (2/T)*tau;
a_n = (2/T)*int(cos((2*n*pi*t)/T),-tau/2,tau/2);
b_n = (2/T)*int(sin((2*n*pi*t)/T),-tau/2,tau/2);

f=(a_0/2)+symsum(a_n*cos((2*n*pi*t)/T)+b_n*sin((2*n*pi*t)/T), n, 1, n_a); 
%fplot(f,[-T/5,T+(T/5)]);


for i=DC
    A = zeros(n_a,3);
    a_n_ = subs(a_n,tau,i*T);
    b_n_ = subs(b_n,tau,i*T);
    for j = 1:n_a
        A(j,1) = j;              %primera columna: n
        A(j,2) = subs(a_n_,n,j); %segunda columna: a_n
        A(j,3) = subs(b_n_,n,j); %tercera columna: b_n 
        
        if vpa(10*log10(subs(a_n_,n,j))) < -100 %cuarta columna: 10*log(a_n)
           A(j,4) = log(0); %no tiene sentido escribir -100 en la table
        else
            A(j,4) = 10*log10(subs(a_n_,n,j)); %cuarta columna: 10*log_10(a_n)
        end
    end
    mytitle = sprintf("DC:%d%%,n:%d",i*100,n_a);
    matrix2table(A,mytitle,1)
end

