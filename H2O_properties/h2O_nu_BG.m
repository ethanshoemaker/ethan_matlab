function kinematic_viscosity = h2O_nu_BG(tempF)

%imports mu
x = h2O_mu_BG(tempF);

%imports rho
y = h2Orho_BG(tempF);

kinematic_viscosity = x./y;

end