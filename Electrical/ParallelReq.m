clear
clc
resistors = input("Enter resistor values as a matrix: ")

x = 0;

for i = 1:length(resistors)
    x = x + 1/resistors(i);
end

R_eq = 1/x

