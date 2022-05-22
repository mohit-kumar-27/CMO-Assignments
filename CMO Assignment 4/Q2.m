% Mohit Kumar SR No.- 19825
% CMO Assignment 4
% Question 2

close all;
clear all;
clc;

M=readmatrix('a4q2_headingangles.csv'); % reading data from excel file
vmin=0.01;
start=[0 0]'; % starting point
finish=[3,4]'; % destination point
f=-1*ones(100,1); % setting up the linear program
Aeq=[cos(M);sin(M)];
beq=finish-start-vmin*(sum(Aeq,2));
lb=zeros(100,1);
u = linprog(f,[],[],Aeq,beq,lb,[]); % solution of the linear program
v=vmin+u; % computing the actual speeds
X=[start]; % computing the trajectory points
for i=1:100
    x=X(:,i)+[v(i)*cos(M(i)) v(i)*sin(M(i))]';
    X=[X,x];
end
% plotting
plot(X(1,:),X(2,:),'ro-');
xlabel('x');
ylabel('y');