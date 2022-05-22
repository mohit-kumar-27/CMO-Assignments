function [stepSize,fVal]= backtrackingSearchQ3(x0)
% This function returns the optimal 'step size' at point 'x0'
% using backtracking search algorithm

alpha=0.5; %defining constants
beta=0.5;
tol=10e-7; %tolerance
maxIter=30; %maximum iterations
formatSpec='"Q3_oracle_2.exe" 19825,[%f,%f,%f,%f]';
par=sprintf(formatSpec,x0(1),x0(2),x0(3),x0(4));
[~, temp]=system(par); %getting the values from exe file
temp= convertCharsToStrings(temp);
temp= split(temp);
fVal=str2num(temp(1)); %function value
grad=str2num(temp(2))'; %gradient value
u=-grad; %search direction
t=1; %initial step size
x=x0+t*u; %new point

i=0;
while i<maxIter
    formatSpec='"Q3_oracle_2.exe" 19825,[%f,%f,%f,%f]'; 
    par=sprintf(formatSpec,x(1),x(2),x(3),x(4));
    [~, temp]=system(par); %getting values from exe file
    temp= convertCharsToStrings(temp);
    temp= split(temp);
    fValNew=str2num(temp(1)); %function value at new point
    
    if(fValNew <= fVal+alpha*t*(grad'*u) || norm(t*u)<tol)
        fVal=fValNew; %optimal function value
        break;
    end
    
    t=beta*t; %updating step size
    x=x0+t*u; %new point
    i=i+1;
end
stepSize=t; %optimal step size
end