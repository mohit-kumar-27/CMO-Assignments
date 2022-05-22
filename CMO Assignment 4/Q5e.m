% Mohit Kumar SR No.- 19825
% CMO Assignment 4
% Question 5 part e

close all;
clear all;
clc;
A=[1 3 0;0 2 1;0 0 0]; % A matrix
b=[1 -1 0]'; % b matrix
L=max(eig(A*A')); % Lipschitz constant
stepSize=1/L;
y=[0 0 0]'; % point to be projected
lambdaOld=[0 0 0]'; % initial values
lambda=[0 0 0]';
for i=1:100 % gradient projection algorithm
    grad=(A*A')*lambdaOld-(A*y-b);
    lambda=lambdaOld-stepSize*grad;
    lambdaOld=lambda;
end
x=y-A'*lambda; % computing the projection point
disp('The projection of the point was found to be:');
x