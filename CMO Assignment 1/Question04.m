% CMO - Assignment #1  
% Question #04
% Author: Mohit Kumar
% Date: August 31,2021

clear all
clc

b=[1;1];
x=[0,1;1,0;1,1];
data=[];

for k=1:3
    X=x(k,:);
    formatSpec='"getFuncValue.exe" 19825,[%f,%f]';
    par=sprintf(formatSpec,X(1),X(2));
    [status, result]=system(par);
    result= convertCharsToStrings(result);
    fVal=str2num(result);
    data=[data;fVal];
end

b=data(1)-1;
a=data(2)-1;
c=(data(3)-b-a-2)/2;
A=[a,c;c,b];
det=a*b-c*c;

if(a>0&&det>0)
    disp('Function has a global minimum since A is positive definite');
else
    disp('Function does not have a global minimum since A is not positive definite');
end




    
   
   
