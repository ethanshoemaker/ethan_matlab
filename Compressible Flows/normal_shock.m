clear
clc

M1 = 1.104; %enter upstream mach number here

R = 287; %gas constant in J/kg*K
gamma = 1.4; %enter specific heat ratio here (1.4 for air)

M2 = sqrt((1+((gamma-1)/2)*M1^2)/(gamma*M1^2-((gamma-1)/(2))))

a = (gamma+1)*M1^2;
b = 2+(gamma-1)*M1^2;

rho_ratio = a/b %rho2/rho1

velo_ratio = 1/rho_ratio

x = (2*gamma)/(gamma+1);
y = (M1^2-1);

p_ratio = 1+x*y %p2/p1

T_ratio = (1+x*y)*(b/a) %T2/T1

h_ratio = T_ratio %h2/h1


delta_s = R*log((1+x*y)^(1/(gamma-1))*(a/b)^((-1*gamma)/(gamma-1)))


stagp_ratio = exp((-1*delta_s)/(R))

