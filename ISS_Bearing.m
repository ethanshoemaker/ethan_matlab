clear
clc

tic
R1 = 0.1; %m
R2 = 0.15; %m
omega1 = 0; %rad/s
omega2 = 2; %rad/s
mu = 0.1; %N*s/m^2
theta = linspace(0,2*pi,30);
r = linspace(R1,R2,30);


C2 = (omega1-omega2)/(-1*(1/R2^2)+1/R1^2);
C1 = 2*omega2 - ((2*C2)/(R2^2));

C3 = (((100/(4*mu))*(R2^2-R1^2))/(log(R2)-log(R1)));
C4 = ((100*R1^2)/(4*mu))-log(R1)*C3;

[R, THETA] = meshgrid(r,theta);

u_theta = C1*(r./2)+(C2./r);

U_THETA = meshgrid(u_theta);

u_z = ((-100*r.^2)/(4*mu))+log(r)*C3+C4;

W = meshgrid(u_z);

[R, THETA] = meshgrid(r,theta);

X = R.*cos(THETA);
Y = R.*sin(THETA);
Z = zeros(30,30);

U = -1.*U_THETA.*sin(THETA);
V = U_THETA.*cos(THETA);

figure
plot(r,u_theta)
xlabel('Radial distance from center (m)')
ylabel('Theta velocity (m/s)')
title('Distance from center (r) vs theta velocity (omega1=0,omega2=2)')

figure
plot(r,u_z)
xlabel('Radial distance from center (m)')
ylabel('z-direction velocity (m/s)')
title('Distance from center (r) vs z-direction velocity (omega1=0,omega2=2)')

figure
quiver3(X,Y,Z,U,V,W,2);
xlabel('x position (m)')
ylabel('y position (m)')
title('Quiver Plot of U, V, W in X, Y, Z Space')

velo_mag = sqrt(U.^2+V.^2+W.^2);

figure
contourf(R,THETA,velo_mag);
c = colorbar;
c.Label.String = 'Velocity (m/s)';
xlabel('Distance from center (meters)')
ylabel('Theta(rads)')
title('Contour of Velocity Magnitude in R-Theta Space')

figure
contourf(X,Y,velo_mag);
c = colorbar;
c.Label.String = 'Velocity Magnitude (m/s)';
xlabel('x posittion (meters)')
ylabel('y position (meters)')


figure
quiver(X,Y,U,V)
xlabel('X')
ylabel('Y')
toc









