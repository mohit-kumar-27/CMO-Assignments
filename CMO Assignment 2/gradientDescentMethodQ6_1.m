function []= gradientDescentMethodQ6_1(x0)
% This function performs search using Gradient Descent Method with initial point 'x0'

disp('Gradient Descent Method------------------------------------>');
formatSpec='"Q6_oracle_2.exe" 19825,[%f,%f,%f,%f,%f,%f,%f,%f,%f,%f]';
par=sprintf(formatSpec,x0(1),x0(2),x0(3),x0(4),x0(5),x0(6),x0(7),x0(8),x0(9),x0(10));
[~, temp]=system(par); %getting values from exe file
temp= convertCharsToStrings(temp);
temp= split(temp);
fVal=str2num(temp(1)); %function value
grad=str2num(temp(2))'; %gradient value
x=x0;
tol=0.01; %tolerance
maxIter=50; %max iterations

i=0;
while i<maxIter
    u=-grad; %search direction
    t=exactLineSearchQ6_1(x); %step size
    xOld=x;
    x=x+t*u; %new point
    if norm(x-xOld)<tol
        x=xOld;
        break;
    end
    formatSpec='"Q6_oracle_2.exe" 19825,[%f,%f,%f,%f,%f,%f,%f,%f,%f,%f]';
    par=sprintf(formatSpec,x(1),x(2),x(3),x(4),x(5),x(6),x(7),x(8),x(9),x(10));
    [~, temp]=system(par); %getting results from exe file
    temp= convertCharsToStrings(temp);
    temp= split(temp);
    fVal=str2num(temp(1)); %function value
    grad=str2num(temp(2))'; %updating gradient
    i=i+1;
end
base_str = '\nGradient Descent Method\nFunction Value : %f\nTotal no of iterations : %d\nx Value : ';
fmt_str = sprintf(base_str,fVal,i);
disp(fmt_str);
disp(x);


