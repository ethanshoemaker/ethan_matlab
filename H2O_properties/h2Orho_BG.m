function density = h2Orho_BG(tempF)

%creates matrix of temperature data in degress F
temp_data = [32 40 50 59 60 68, 70:10:200,212];

%creates matrix of density data in kg/m^3
density_data = [1.94 1.94 1.94 1.94 1.94 1.94 1.93 1.93 1.93 1.93 1.92 1.92 1.91 1.91 1.90 1.89 1.89 1.88 1.87 1.87 1.86];

%interpolates to find density between known values in the table
density = interp1(temp_data, density_data, tempF);


end
