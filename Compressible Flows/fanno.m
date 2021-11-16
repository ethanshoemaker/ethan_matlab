%Author: Ethan Shoemaker
%Date: 04/12/21
%This program uses mach numbers at 2 points in a flow to calculate several
%property ratios.

clear
clc

gamma = 1.4; %specific heat ratio (1.4 for air)
R = 287; %gas constant in J/kg*K

M1 = 0.3; %Enter upstream mach number here
M2 = 1; %Enter downstream mach number here, M2=1 if at * condition

exp1 = gamma+1;
exp2 = 2*(gamma-1); 

T_ratio = ((1+((gamma-1)/2)*M1^2)/((1+((gamma-1)/2)*M2^2))); %T2/T1
p_ratio = (M1/M2)*sqrt(T_ratio) %p2/p1
rho_ratio = (M1/M2)*sqrt(1/T_ratio); %rho2/rho1
v_ratio = 1/rho_ratio; %v2/v1
delta_s = R*log((M2/M1)*T_ratio^(exp1/exp2)); %entropy change
thing = (1/gamma)*((1/M1^2)-(1/M2^2))+((gamma+1)/(2*gamma))*log((M1^2/M2^2)*(1/T_ratio)) %4fL/D_H

T_ratio_star = 1/T_ratio; %T1/T*
p_ratio_star = 1/p_ratio; %p1/p*
rho_ratio_star = 1/rho_ratio; %rho1/rho*
v_ratio_star = 1/v_ratio; %v1/v*
