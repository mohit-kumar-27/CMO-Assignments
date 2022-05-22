function []= newtonMethodQ4_5(xi)

% This function performs search using Newton Method with initial point 'xi'

disp('Newton Method----------------------------------------->')

grad=xi/(xi^2+1); %gradient at initial point
hess= (1-xi^2)/((xi^2+1)^2);%hessian at initial point
fVal=0.5*log(xi^2+1); %function value at initial point

x=xi;
tol=0.05; %tolerance
maxIter=30; %max iterations

dirDer=grad*(hess^-1)*grad; %directional derivative in the newton direction

i=0;
while dirDer/2>tol && i<maxIter
    u=-(hess^-1)*grad; %search direction
    t=backtrackingSearchQ4_5(x); %step size using backtracking search
    x=x+t*u; %new point

    fVal=0.5*log(x^2+1); %updating function value
    grad=x/(x^2+1); %updating gradient
    hess=(1-x^2)/((x^2+1)^2); %updating hessian
    dirDer=grad*(hess^-1)*grad; %updating directional derivative
    i=i+1;
    if (i ==1 || i==5 || i==10 || i==20)
        base_str = 'After %d iterations\nvalue of x : %f\nFunction Value : %f\n';
        fmt_str = sprintf(base_str,i,x,fVal);
        disp(fmt_str);
    end
end
base_str = 'Newton Method\nvalue of x : %f\nFunction Value : %f\nTotal no of iterations : %d\n';
fmt_str = sprintf(base_str,x,fVal,i);
disp(fmt_str);

end






