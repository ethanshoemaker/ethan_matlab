%%This program solves 2D heat transfer problems using the finite-difference
%%method
%Author: Ethan Shoemaker
%ME 450 - Fall 2021

clear all
close all
clc

x_dim = 1; %enter x-dimension here
y_dim = 1; %enter y-dimension here
%N = 4; %number of nodes in each direction
%given surface temperatures
N_surface = 873;
W_surface = 573;
T_max = [];
T_avg = [];


for N = 4

    delta_x = x_dim/N; %delta_x
    delta_y = y_dim/N; %delta_y
    x = 0:1/(N-1):1;
    y = x;
    [X,Y] = meshgrid(x,y);
 

    B = N+1:N:(N*N)-((N-1)+N);
    C = [2:1:N-1];
    D = N+2:1:2*N-1;
    G = [];

    for i = 1:N-3
        E = (D(1)+i*N):1:(D(N-2)+i*N);
        D = [D E];
    end

    A = eye(N*N);

    A(1,(N*N)+1) = 0.25*(W_surface)+0.25*(N_surface);

    for i = B
        A(i,(N*N)+1) = .25*N_surface;
    end

    for i = C
        A(i,(N*N)+1) = .25*W_surface;
    end

    for i = D
        A(i,i+1) = -0.25;
        A(i,i+N) = -0.25;
        A(i,i-N) = -0.25;
        A(i,i-1) = -0.25;
    end

    A((N*N)-(N-1),(N*N)+1) = (1/3)*N_surface;
    A(N,(N*N)+1) = (1/3)*W_surface;

    %top left node
    A(1,2) = -0.25;
    A(1,N+1) = -0.25;

    %top right node
    A(N,N-1) = -1/3;
    A(N, N*2) = -1/3;

    %bottom left node
    A(1+(N*(N-1)),1+(N*(N-1))-N) = -1/3;
    A(1+(N*(N-1)),2+(N*(N-1))) = -1/3;

    %bottom right node
    A(N*N,(N*N)-1) = -0.5;
    A(N*N,(N*N)-N) = -0.5;

    %top row non-corner nodes

    for i = 2:N-1
        A(i,i-1) = -0.25;
        A(i,i+1) = -0.25;
        A(i,i+N) = -0.25;
    end

    %bottom row non-corner nodes

    for i = N*N-(N-2):(N*N)-1
        A(i,i-1) = -1/3;
        A(i,i+1) = -1/3;
        A(i,i-N) = -1/3;
    end

    %right side non-corner nodes

    for i = 2*N:N:(N*N)-N
        A(i,i-N) = -1/3;
        A(i,i-1) = -1/3;
        A(i,i+N) = -1/3;
    end

    %left side non-corner nodes

    for i = 1+N:N:(N*N)-N-(N-1)
        A(i,i+1) = -0.25;
        A(i,i-N) = -0.25;
        A(i,i+N) = -0.25;
    end

    Z = rref(A);
    Z = Z(:,(N*N)+1);

    T = reshape(Z,N,N);


    figure();
    surf(X,Y,flip(T),'FaceAlpha',0.75)
    colorbar
    colormap jet
    h = colorbar;
    ylabel(h, 'Temperature (K)')
    title("Surface Plot of Temperature (K) - " + N + "x" + N + " mesh")
    xlabel('x-distance (m)')
    ylabel('y-distance (m)')
    zlabel('Temperature (K)')

    figure();
    heatmap(T,'Colormap',jet)
    title("Temperature(K) Heatmap - " + N + "x" + N + " mesh")
    xlabel('Node Column')
    ylabel('Node Row')
    

    %figure();
    %contour(X,Y,flip(T),30,'showtext','on')
    %l = colorbar;
    %ylabel(l, 'Temperature (K)')
    %title("Contour Plot of Isotherm Lines - " + N + "x" + N + " mesh")
    %xlabel('x-distance (m)')
    %ylabel('y-distance (m)')

    
    %tmax = max(T,[],'all');
    %T_max = [T_max tmax];

    %tavg = mean(T,'all');
    %T_avg = [T_avg tavg];
end
