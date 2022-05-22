% Mohit Kumar SR No.- 19825
% CMO Assignment 4
% Question 5 part c

close all;
clear all;
clc;
A=[1 1 1;-1 0 0;0 -1 1]; % A matrix
b=[5 0 0]'; % b matrix
L=max(eig(A*A')); % Lipschitz constant
stepSize=1/L;
y=[3 -1 2]'; % point to be projected
m=3;
lambdaOld=[0 0 0]'; % initial values
lambda=[0 0 0]';
for i=1:100 % gradient projection algorithm
    grad=(A*A')*lambdaOld-(A*y-b);
    for j =1:m
        val=lambdaOld(j)-stepSize*grad(j);
        if(val>=0)
            lambda(j)=val;
        else
            lambda(j)=0;
        end
    end
    lambdaOld=lambda;
end
x=y-A'*lambda; %computing the projection point
disp('The projection of the point was found to be:');
x