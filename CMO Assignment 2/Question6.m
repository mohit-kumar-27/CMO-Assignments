% CMO - Assignment #2
% Question #6
% Author: Mohit Kumar
% Date: September 26,2021

clear all;
clc;

x0=[1,50,50,50,50,50,50,50,50,50]'; % initial point

%Gradient Descent Method
gradientDescentMethodQ6_1(x0);

disp('------------------------------------------------------------------------------>');

%Scaled Gradient Descent Method

beta=[1/200,1/700,1/2000];
k=zeros(1,3);
min=100;
for i =1 :3
        base_str = '\nbeta value : %f\n ';
        fmt_str = sprintf(base_str,beta(i));
        disp(fmt_str);
        k(i)=gradientDescentMethodQ6_2(x0,beta(i));
        if k(i)<min
            min=k(i);
            minI=i;
        end
end




