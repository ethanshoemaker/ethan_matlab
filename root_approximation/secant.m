clear
clc

f=@(x) x^3-2*x+1; %original function

p0 = -2; %initial p values
p1 = -1; 

t = 10^(-8); %acceptable tolerance

N=100;

p = p1-f(p1)*((p1-p0)/(f(p1)-f(p0)))

for i = 1:N;
    
    if abs(p-p0) < t;  
        break
    elseif abs(p-p0) > t;
        p0=p1;
        p1=p;
        p = p1-f(p1)*((p1-p0)/(f(p1)-f(p0)));
    end
    
end

if i == N;
    fprintf('failed to find a solution after %d iterations',N)
else
    fprintf('solution is %d and converges in %d iterations', p, i-1)
end

