function dynamic_viscosity = h2O_mu_BG(tempF)

%converts F to K
tempK = ((tempF-32)./(1.8)) + 273;

A = 5.05E-7; %N*s/m^2

B = 247.8; %K

C = 140; %K

dynamic_viscosity = A.*10.^((B)./(tempK-C));

end