% CMO - Assignment #2
% Question # 4 and 5
% Author: Mohit Kumar
% Date: September 26,2021

clear all;
clc;


xi=[0.1,0.6,-0.5,1.2];

for i=1:4
fprintf('Value of x : %f\n\n',xi(i));


%Gradient Descent Method
gradientDescentMethodQ4_5(xi(i));

disp('------------------------------------------------------------------------------>');

%Newton Method
newtonMethodQ4_5(xi(i));
fprintf('**************************************************************************\n\n')
end





