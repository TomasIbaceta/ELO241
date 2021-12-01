syms t
R = 50; %100 para mayor, 50 para menor [ohm]
C = 100e-6; %100uF
L = 250e-3; %250 mH

Z0 = 75; %75[ohm]
Vg = 1; %1[V]
Vb = Vg * R / (Z0 + R);

T_rc = (5*R*C)/2 % permutamos a la mitad para que se vea bien
T_rl = (5*L/R)/2 % permutamos a la mitad para que se vea bien

%RCSerie NUEVO
eqs = (Vg/2)*heaviside(t-0) - (Vg/2)*heaviside(t-T_rc) ...... 
      + ( (Vg*Z0 / (R+Z0)^2*C) * exp( -(t-T_rc)/((R+Z0)*C) ) ) * heaviside(t-T_rc);
pretty(eqs)
 fplot ( eqs, [-1*T_rc, 2*T_rc] )


%RCSerie
% fplot ( (Vg/2)*heaviside(t-0) - (Vg/2)*heaviside(t-T_rc) ...... 
%        +( Vg + (Vb-Vg) * exp( -(t-T_rc)/(R*C) ) ) * heaviside(t-T_rc), [-1*T_rc, 2*T_rc] )

%RCParalelo
% fplot ( (Vg/2)*heaviside(t-0) - (Vg/2)*heaviside(t-T_rc) ...... 
%        +( Vb + (0-Vb) * exp( -(t-T_rc)/(R*C) ) ) * heaviside(t-T_rc), [-1*T_rc, 3*T_rc] )

%RLSerie
%fplot ( (Vg/2)*heaviside(t-0) - (Vg/2)*heaviside(t-T_rl) ...... 
%       +( Vb + (Vg-Vb) * exp( - (t-T_rl) / (L/R) ) ) * heaviside(t-T_rl), [-1*T_rl, 3*T_rl] )