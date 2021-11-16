clear
clc

gamma = 1.4; %specific heat ratio (1.4 for air)
cp = 1; %specific heat at constant pressure (1 kJ/kg*K for air)

M1 = 0.325;
M2 = 1;

exp1 = (gamma)/(gamma-1);
exp2 = (gamma+1)/(gamma);

p_ratio = (1+gamma*M1^2)/(1+gamma*M2^2) %p2/p1
T_ratio = (p_ratio)^2*(M2/M1)^2 %T2/T1
rho_ratio = (1/p_ratio)*(M1/M2)^2 %rho2/rho1
v_ratio = 1/rho_ratio %v2/v1
chunk = (1+((gamma-1)/(2))*M2^2)/(1+((gamma-1)/(2))*M1^2);
stagT_ratio = p_ratio^2*(M2/M1)^2*chunk %T02/T01
stagp_ratio = p_ratio*chunk^exp1 %p02/p01
delta_s = cp*log((M2^2/M1^2)*(p_ratio)^(exp2))

T_ratio_star = 1/T_ratio %T1/T*
p_ratio_star = 1/p_ratio %p1/p*
rho_ratio_star = 1/rho_ratio %rho1/rho*
v_ratio_star = 1/v_ratio %v1/v*
stagT_ratio_star = 1/stagT_ratio %T01/T0*
stagp_ratio_star = 1/stagp_ratio %p01/p0*


