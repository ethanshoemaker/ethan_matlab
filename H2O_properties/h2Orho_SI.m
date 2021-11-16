function density = h2Orho_SI(tempC);

%creates matrix of temperature data in degress celsius
temp_data = [0:5:100];

%creates matrix of density data in kg/m^3
density_data = [1000 1000 1000 999 998 997 996 994 992 990 988 986 983 980 978 975 972 969 965 962 958];

%interpolates to find density between known values in the table
density = interp1(temp_data, density_data, tempC);


end