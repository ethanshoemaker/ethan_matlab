% Author: Ethan Shoemaker
% Date: 03/31/2021


function v = pipe_velo(v_fun,v_guess,mu,D,rho,epsilon)

inputs = [v_guess,mu,D,rho,epsilon];

N=100; %number of iterations

if isreal(inputs)==1 & inputs>=0 %ensures that inputs are real and positive
    for i =1:N
        Re = (rho*v_guess*D)/mu; %computes Re using an initial guess for v
        f = moody(epsilon/D, Re); %uses function moody to find f value for previously calculated Re
        v_approx = v_fun(f); %approximates v using v_fun and the input f calculated in the last line
        diff = abs(v_guess-v_approx)/v_guess; %caclulates difference between the input v and output v
        
        if diff>0.01 %if difference is greater than 1%
            v_guess=v_approx; %new guess becomes the last approximation
        elseif diff<=0.01 %if difference is less than or equal to 1%
            v = v_approx; %final answer v is equal to the last calculated v(v_approx)
            break
        else
            disp('error')
        end
    end
    
        
else
    disp('error')
end