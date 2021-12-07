clc 
clear
syms R C Vg Z0 s T
assume(T>0)
Vb = (Vg*Z0)/(Z0+R);
Vt = (Vg * (R + 1/(s*C) ) / (  Z0 + R + 1/(s*C) )) * (1/s)*exp(-T*s);
Vt = Vt + Vb * (1/s)*exp(-T*s);
%pretty(eq)
pretty(simplify(ilaplace(Vt)));

%% 
clc 
clear
syms R Vg Z0 s T L
assume(T>0)
Vb = (Vg*Z0)/(Z0+R);
Vt = (Vg * (R + s*L ) / (  Z0 + R + s*L )) * (1/s)*exp(-T*s);
Vt = Vt + Vb * (1/s)*exp(-T*s);
%pretty(eq)
pretty(simplify(ilaplace(Vt)));




% %% 
% clc
% clear
% 
% syms R C Vg Vb Z0 s
% 
% eq = Vg * R * s * C / ( (Z0 + R)*(s*C)+1 );
% pretty(eq)
% pretty(ilaplace(eq))

