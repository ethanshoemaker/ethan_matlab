% Author: Ethan Shoemaker
% Date: 03/31/2021
% This function accepts relative roughness and Re as inputs and iterates to
% find the correct friction factor associated with the inputs. The function
% uses the Colebrook equation, which is a fit to the moody diagram.

function f = moody(rel_rough, Re)


N=100; %number of times to iterate
f1 = 0.02; %initial guess

if isreal(rel_rough)==1 & isreal(Re)==1 & rel_rough >= 0 & Re>=0 %checks to make sure inputs are real and positive
    
    if Re > 2300 %checks to see if flow is in turbulent regime
 
        for i = 1:N
            f2 = ((1)./(-2*log10((rel_rough/3.7)+(2.51./(Re.*sqrt(f1)))))).^2; %new f value
            diff = abs(f2-f1)/f1; %calculates the percent error between the last f value and the new one
            if diff > 0.01; %if the difference between previous and new f value is greater than 1%
                f1=f2; %updates f1 to be whatever f2 was calculated to be
            else
                f=f2; %if f1 and f2 are within 1% of each other, f2 is the answer and is equal to f
                break
            end
        end
        
    else
        f = 64./Re; %if laminar
    end
else
    disp('Inputs must be real and positive')
end
