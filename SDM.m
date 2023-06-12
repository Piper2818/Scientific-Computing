function [iters, x] = SDM(A, b, x0, Tol)
iters = 0;
% k = 0 
x = x0;
r = b - (A*x);
fprintf("Steepest Descent Method:")
fprintf('\nIter\tx\ty\tz\tw\n'); % print out the header for the "table" 
%for k = 1:MaxIter
while(norm(r) > Tol)
    if iters < 11 % we only want to print the first 10 iterations and the inital guess
            fprintf('%.2f %.2f %.2f %.2f %.2f\n',iters,x(1),x(2),x(3),x(4))
     end % end of if statement #2
z = A*r;
s = (r'*r) / (r'*z);

x = x + (s * r);
r = r - (s * z);


iters = iters + 1; 
end % end for loop

end % end of function 
