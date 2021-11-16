clear
clc

%enter unknown parameter value as 'x' 
M = 10;
theta = 12;
beta = 'x';

gamma = 1.4;


if M == 'x' %if beta and theta are known
    
    for M = 0:0.01:20
        theta1 = atand((2*cotd(beta))*((M^2*sind(beta)^2-1)/(M^2*(gamma+cosd(2*beta))+2)));
        if abs(theta1-theta) < 0.01
            M
            break
        end
    end

elseif theta == 'x' %if beta and M are known
    
    theta = atand((2*cotd(beta))*((M^2*sind(beta)^2-1)/(M^2*(gamma+cosd(2*beta))+2)))


elseif beta == 'x' %if theta and M are known
    
    for beta = 0:0.01:90
        theta1 = atand((2*cotd(beta))*((M^2*sind(beta)^2-1)/(M^2*(gamma+cosd(2*beta))+2)));
        if abs(theta1-theta) < 0.01
            beta
            break
        end
    end

end

    