function []= gradientDescentMethodQ3(x0)
% This function performs search using Gradient Descent Method with initial point 'x0'

disp('Gradient Descent Method------------------------------------>');
formatSpec='"Q3_oracle_2.exe" 19825,[%f,%f,%f,%f]';
par=sprintf(formatSpec,x0(1),x0(2),x0(3),x0(4));
[~, temp]=system(par); %getting values from exe file
temp= convertCharsToStrings(temp);
temp= split(temp);
fVal=str2num(temp(1)); %function value
grad=str2num(temp(2))'; %gradient value

x=x0; 
tol=10e-10; %tolerance
maxIter=50; %max iterations

i=0;
while norm(grad)>tol && i<maxIter
    u=-grad; %search direction
    t=backtrackingSearchQ3(x); %step size
    x=x+t*u; %new point
    formatSpec='"Q3_oracle_2.exe" 19825,[%f,%f,%f,%f]';
    par=sprintf(formatSpec,x(1),x(2),x(3),x(4));
    [~, temp]=system(par); %getting results from exe file
    temp= convertCharsToStrings(temp);
    temp= split(temp);
    fVal=str2num(temp(1)); %function value
    grad=str2num(temp(2))'; %updating gradient
    i=i+1;
    if (i ==1 || i==5 || i==10 || i==20)
        base_str = '\nAfter %d iterations\nFunction Value : %f\nx Value : ';
        fmt_str = sprintf(base_str,i,fVal);
        disp(fmt_str);
        disp(x);
    end
end
base_str = '\nGradient Descent Method\nFunction Value : %f\nTotal no of iterations : %d\nx Value : ';
fmt_str = sprintf(base_str,fVal,i);
disp(fmt_str);
disp(x);


