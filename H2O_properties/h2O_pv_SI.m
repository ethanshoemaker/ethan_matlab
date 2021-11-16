function vapor_pressure = h2O_pv_SI(tempC)

%creates matrix of temperature data in degress celsius
temp_data = [0:5:100];

%creates matrix of vapor pressure in kPa
pv_data = [0.661 0.872 1.23 1.71 2.34 3.17 4.25 5.63 7.38 9.59 12.4 15.8 19.9 25.0 31.2 38.6 47.4 57.8 70.1 84.6 101];

%interpolates to find vapor pressure between known values in the table
vapor_pressure = interp1(temp_data, pv_data, tempC);


end