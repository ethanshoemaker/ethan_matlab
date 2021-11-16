clear
clc

f=@(x) x^3-2*x+1; %original function
f1=@(x) 3*x^2-2; %first derivative

p0 = -2; %initial p value

t = 10^(-8); %acceptable tolerance

p = p0-(f(p0)/f1(p0)); %p1

N=100;

for i = 1:N;
    if abs(p-p0) < t;
        break
    elseif abs(p-p0) > t;
        p0 = p
        p = p0-(f(p0)/f1(p0))
    end
end

if i == N;
    fprintf('failed to find a solution after %d iterations',N)
else
    fprintf('solution is %d and converges in %d iterations', p, i-1)
end

