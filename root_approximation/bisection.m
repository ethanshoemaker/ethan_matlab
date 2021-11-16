clear
clc

f = @(x) x^2-7; %some function, enter it here

a = 2; %lower bound of interval, enter value
b = 3; %upper bound of interval, enter value

c = a; 
d = b;

t = 10^(-2); %enter a value for tolerable error

p = (a+b)/2;

sum = 1;

while abs(p-a)>t && abs(p-b)>t
   
    if f(a)*f(p) < 0
    b = p;
    p = (a+b)/2;
    f(p);
    sum=sum+1;
    
    elseif f(b)*f(p) < 0
    a = p;
    p = (a+b)/2;
    f(p);
    sum=sum+1;
    
    end
    
end
sum

fprintf('The solution of the function on [%i,%i] is approximated within an \nallowable error of %i to  be at x = %f',c,d,t,p)









