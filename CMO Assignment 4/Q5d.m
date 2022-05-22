% Mohit Kumar SR No.- 19825
% CMO Assignment 4
% Question 5 part d

close all;
clear all;
clc;
A=[1 1;-1 0;0 -1]; % A matrix
b=[1 0 0]'; % b matrix
L=max(eig(A*A')); % Lipschitz constant
stepSize=1/L; % step size 1/L
y=[2 1]'; % point to be projected
m=3;
lambdaOld=[0 0 0]'; % initial values
lambda=[0 0 0]';
X1=[];
for i=1:10 % gradient projection algorithm
    grad=(A*A')*lambdaOld-(A*y-b);
    for j =1:m
        val=lambdaOld(j)-stepSize*grad(j);
        if(val>=0)
            lambda(j)=val;
        else
            lambda(j)=0;
        end
    end
    x=y-A'*lambda; % computing the projection point
    X1=[X1,x]; % storing the points
    lambdaOld=lambda;
end
stepSize=2/L; % stepsize 2/L
lambdaOld=[0 0 0]'; % initial values
lambda=[0 0 0]';
X2=[];
for i=1:10 % gradient projection algorithm
    grad=(A*A')*lambdaOld-(A*y-b);
    for j =1:m
        val=lambdaOld(j)-stepSize*grad(j);
        if(val>=0)
            lambda(j)=val;
        else
            lambda(j)=0;
        end
    end
    x=y-A'*lambda;
    X2=[X2,x]; % storing the points
    lambdaOld=lambda;
end
% plotting
figure;
plot(X1(1,:),X1(2,:),'rx');
xlabel('x');
ylabel('y');
title('step size 1/L');
figure;
plot(X2(1,:),X2(2,:),'bo');
xlabel('x');
ylabel('y');
title('step size 2/L');

