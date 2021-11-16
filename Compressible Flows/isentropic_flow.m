clear
clc

%ENTER 0 for M2 to find T_0/T, p_0/p, and rho_0/rho

gamma = 1.4; %enter specific heat ratio here (1.4 for air)

M1 = 0.16; %enter local upstream mach number here
M2 = 0; %enter local downstream mach number here

x = 1 + ((gamma-1)/(2))*M1^2;
y = 1 + ((gamma-1)/(2))*M2^2;

T_ratio = x/y %T2/T1

exp1 = (gamma)/(gamma-1);
exp2 = (1)/(gamma-1);
exp3 = gamma + 1;
exp4 = -2*(gamma-1);
exp5 = exp3/exp4;

p_ratio = (x/y)^exp1 %p2/p1

rho_ratio = (x/y)^exp2 %rho2/rho1





