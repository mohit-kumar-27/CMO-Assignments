% CMO - Assignment #2
% Question #3
% Author: Mohit Kumar
% Date: September 26,2021

clear all;
clc;

%Backtracking Line Search
x0=[-1,-1,-1,-1]'; %point
[stepSize,fVal]= backtrackingSearchQ3(x0);
base_str = 'Backtracking Line Search\nStep Size : %f\nFunction Value : %f\n';
fmt_str = sprintf(base_str,stepSize, fVal);
disp(fmt_str);

disp('------------------------------------------------------------------------------>');

x0=[5,-3,-5,3]'; % initial point

%Gradient Descent Method
gradientDescentMethodQ3(x0);

disp('------------------------------------------------------------------------------>');

%Newton Method
newtonMethodQ3(x0);





