function [stepSize,fVal]= backtrackingSearchQ4_5(xi)
% This function returns the optimal 'step size' at point 'xi'
% using backtracking search algorithm

alpha=0.5; %defining constants
beta=0.1;
tol=10e-2; %tolerance
maxIter=30; %maximum iterations
fVal=0.5*log(xi^2+1); %function value
grad=xi/(xi^2+1); %gradient value
u=-grad; %search direction
t=1; %initial step size
x=xi+t*u; %new point

i=0;
while i<maxIter
    fValNew=0.5*log(x^2+1); %function value at new point
    
    if(fValNew <= fVal+alpha*t*grad*u || norm(t*u)<tol)
        fVal=fValNew; %optimal function value
        break;
    end
    
    t=beta*t; %updating step size
    x=xi+t*u; %new point
    i=i+1;
end
stepSize=t; %optimal step size
end