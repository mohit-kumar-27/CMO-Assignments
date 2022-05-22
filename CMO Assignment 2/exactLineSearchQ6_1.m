function [stepSize,fVal]= exactLineSearchQ6_1(x0)
% This function returns the optimal 'step size' at point 'x0'
% using exact line search algorithm('bisection method')

a=0; %lower search limit
b=1; %upper search limit

formatSpec='"Q6_oracle_2.exe" 19825,[%f,%f,%f,%f,%f,%f,%f,%f,%f,%f]';
par=sprintf(formatSpec,x0(1),x0(2),x0(3),x0(4),x0(5),x0(6),x0(7),x0(8),x0(9),x0(10));
[~, temp]=system(par); %getting the values from exe file
temp= convertCharsToStrings(temp);
temp= split(temp);
fVal=str2num(temp(1)); %function value
grad=str2num(temp(2))'; %gradient value

u=-grad; %search direction

lambda= (a+b)/2; %initial step size
x=x0+lambda*u;%new point

maxIter=30; %maximum iterations
i=0;
while i<maxIter
    formatSpec='"Q6_oracle_2.exe" 19825,[%f,%f,%f,%f,%f,%f,%f,%f,%f,%f]';
    par=sprintf(formatSpec,x(1),x(2),x(3),x(4),x(5),x(6),x(7),x(8),x(9),x(10));
    [~, temp]=system(par); %getting values from exe file
    temp= convertCharsToStrings(temp);
    temp= split(temp);
    fVal=str2num(temp(1)); %function value at new point
    gradNew=str2num(temp(2))'; %gradient at new point
    
    lambdaFunc= gradNew'*u;   %performing bisection search
    if lambdaFunc>0
        b=lambda;     
    elseif lambdaFunc<0
        a=lambda;
    else
        break;
    end
    i=i+1;
    lambda= (a+b)/2;
    x=x0+lambda*u;
end
stepSize=lambda;
end
