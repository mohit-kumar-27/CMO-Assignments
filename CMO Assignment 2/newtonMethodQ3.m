function []= newtonMethodQ3(x0)
% This function performs search using Newton Method with initial point 'x0'

disp('Newton Method----------------------------------------->')
formatSpec='"Q3_oracle_2.exe" 19825,[%f,%f,%f,%f]';
par=sprintf(formatSpec,x0(1),x0(2),x0(3),x0(4));
[~, temp]=system(par); %getting values from exe file
temp= convertCharsToStrings(temp);
temp= split(temp);
fVal=str2num(temp(1)); %function value at initial point
grad=str2num(temp(2))'; %gradient at initial point
hess=[]; %hessian at initial point
for m=1:4
    temp(2+m)=replace(temp(2+m),"]]","]");
    temp(2+m)=replace(temp(2+m),"[[","[");
    hess=[hess;str2num(temp(2+m))];
end

x=x0;
tol=10e-10; %tolerance
maxIter=50; %max iterations

dirDer=grad'*inv(hess)*grad; %directional derivative in the newton direction

i=0;
while dirDer/2>tol && i<maxIter
    u=-inv(hess)*grad; %search direction
    t=backtrackingSearchQ3(x); %step size using backtracking search
    x=x+t*u; %new point
    formatSpec='"Q3_oracle_2.exe" 19825,[%f,%f,%f,%f]';
    par=sprintf(formatSpec,x(1),x(2),x(3),x(4));
    [~, temp]=system(par); %getting values from exe file
    temp= convertCharsToStrings(temp);
    temp= split(temp);
    fVal=str2num(temp(1)); %updating function value
    grad=str2num(temp(2))'; %updating gradient
    hess=[]; %updating hessian
    for m=1:4
        temp(2+m)=replace(temp(2+m),"]]","]");
        temp(2+m)=replace(temp(2+m),"[[","[");
        hess=[hess;str2num(temp(2+m))];
    end
    
    dirDer=grad'*inv(hess)*grad; %updating directional derivative
    i=i+1;
    if (i ==1 || i==5 || i==10 || i==20)
        base_str = '\nAfter %d iterations\nFunction Value : %f\nX value : ';
        fmt_str = sprintf(base_str,i,fVal);
        disp(fmt_str);
        disp(x);
    end
end
base_str = '\nNewton Method\nFunction Value : %f\nTotal no of iterations : %d\nX value : ';
fmt_str = sprintf(base_str,fVal,i);
disp(fmt_str);
disp(x);

end






