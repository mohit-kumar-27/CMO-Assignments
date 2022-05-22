% CMO - Assignment #1  
% Question #03
% Author: Mohit Kumar
% Date: August 31,2021

clear all
clc

[status, result]=system('"getDataPoints.exe" 19825');

result= convertCharsToStrings(result);
temp_data = split(result);
len=length(temp_data);
data=[];
for k=1:len
    d=str2num(temp_data(k,:));
    data=[data;d];
end

y=data(:,1);
x=data(:,2:6);

N=length(y);
X=[ones(N,1) x];
Y=y;
phi=inv(X'*X)*X'*Y;

b=phi(1,1)
w=phi(2:6,:)






