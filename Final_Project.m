% Piper Morris
% Scientific Computing Final Project 
% 5/3/23

clc, clear, close all; 

% Problem one
% Steepest Decsent Method 

fprintf('\nSteepest Decsent Method:')
Tol = 10^-7; 
x0 = [0 0 0 0]';
A = [5 7 6 5;
    7 10 8 7;
    6 8 10 9; 
    5 7 9 10;];
b = [-10; -14; -11; -8;];

[iters, x] = SDM(A, b, x0, Tol)


% % Problem two 
% Define function 
f = @(x) abs((x.^2) - 2 ) + abs((2.*x) + 3);
a = -4; 
b = 0; 
m = (a+b)/2;
Tol = 10^-8; 
s = 2; 



% Part A
% Successive Parabolic Interpolation


fprintf('\nSuccessive Parabolic Interpolation/Golden Search Method: ')
[iters, xmin, min] = SPI_GSS(f, a, b, Tol)


% Part B 
% Golden Section Search Method

fprintf('\nGolden Search Method: ')
[iters, min, ~, xmin] = GoldenSearch(f, a, b, Tol, s)


% Problem 3
% Backward Euler Method

t = [0:0.05:2];
delta = 0.05;
u = zeros(1,length(t)-1);
u(1) = 1; 
Exact_sol = @(t) 1 + 4*t + (t.^2)/4;





for i = 1:length(t)-1
u_current = u(i) + delta *( 2 + sqrt(u(i) - (2.*t(i)) + 3));
u(i+1) = u(i) + delta *( 2 + sqrt(u_current - (2.*t(i+1)) + 3));
% sol = solve(u_next == u(i) + h*(2 + sqrt(u_next - 2*t(i + 1) + 3))); % Solve foy u_next
% u(i+1) = double(sol); % Backward Euler Update

end



plot(t,u,'*-')
hold on 
plot(t, Exact_sol(t))
title('Exact Vs Backward Euler')
xlabel('Time')
ylabel('Function')
legend('Approx.', 'Exact','Location','northwest')
