function kinematic_viscosity = h2O_nu_SI(tempC)

%imports mu
x = h2O_mu_SI(tempC);

%imports rho
y = h2Orho_SI(tempC);

kinematic_viscosity = x./y;

end