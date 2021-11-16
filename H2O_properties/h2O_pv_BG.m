function vapor_pressure = h2O_pv_BG(tempF);

%creates matrix of temperature data in degress F
temp_data = [32 40 50 59 60 68, 70:10:200,212];

%creates matrix of vapor pressure in psia
pv_data = [0.0886 0.122 0.178 0.247 0.256 0.339 0.363 0.507 0.699 0.950 1.28 1.70 2.23 2.89 3.72 4.75 6.00 7.52 9.34 11.5 14.7];

%interpolates to find vapor pressure between known values in the table
vapor_pressure = interp1(temp_data, pv_data, tempF);


end