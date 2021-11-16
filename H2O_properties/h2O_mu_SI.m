function dynamic_viscosity = h2O_mu_SI(tempC);

%converts C to K
tempK = tempC + 273;

A = 2.414E-5; %N*s/m^2

B = 247.8; %K

C = 140; %K

dynamic_viscosity = A.*10.^((B)./(tempK-C));

end


