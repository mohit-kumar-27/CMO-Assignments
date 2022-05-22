function []= gradientDescentMethodQ4_5(xi)
% This function performs search using Gradient Descent Method with initial point 'xi'

disp('Gradient Descent Method-------------------------------->')

fVal=0.5*log(xi^2+1); %function value
grad=xi/(xi^2+1); %gradient value

x=xi;
tol=0.05; %tolerance
maxIter=30; %max iterations

i=0;
while abs(grad)>tol && i<maxIter
    u=-grad; %search direction
    t=backtrackingSearchQ4_5(x); %step size
    x=x+t*u; %new point

    fVal=0.5*log(x^2+1); %function value
    grad=x/(x^2+1); %updating gradient
    i=i+1;
    if (i ==1 || i==5 || i==10 || i==20)
        base_str = 'After %d iterations\nvalue of x : %f\nFunction Value : %f\n';
        fmt_str = sprintf(base_str,i,x,fVal);
        disp(fmt_str);
    end
end
base_str = 'Gradient Descent Method\nvalue of x : %f\nFunction Value : %f\nTotal no of iterations : %d\n';
fmt_str = sprintf(base_str,x,fVal,i);
disp(fmt_str);


