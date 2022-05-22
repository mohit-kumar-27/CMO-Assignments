% CMO - Assignment #1  
% Question #05
% Author: Mohit Kumar
% Date: August 31,2021

clear all
clc

x0=[10;10;10];
tol=1e-4;
maxIter=50;
fValOld=1e10;
X=x0;
Xold=x0;


for k=0:maxIter
    formatSpec='"getGradient.exe" 19825,[%f,%f,%f]';
    par=sprintf(formatSpec,X(1),X(2),X(3));
    [status, result]=system(par);
    result= convertCharsToStrings(result);
    data=str2num(result);
    fVal=data(1);
    grad=data(2:4);
    if(fValOld-fVal<tol)
        break;
    end
    fValOld=fVal;
    Xold=X;
    X=X-(1/(k+1))*(grad');
end

disp(['No of iterations required: ',num2str(k)])

