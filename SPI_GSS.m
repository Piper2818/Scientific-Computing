function [iters, xmin, min] = SPI_GSS(f,a,b,Tol) % start of function 
m = (a+b)/2; 
iters = 0; 
error = 1;
intervali = [a m b];

num = (f(a)-f(m))*(b-m)^2 - (f(b)-f(m))*(m-a)^2;
denom = (f(a)-f(m))*(b-m) + (f(b)-f(m))*(m-a);
xmin = m + (0.5 * (num/denom));


while error > Tol

    %Find the slope of a line through two points 
    slope = (f(b)-f(a)) / (b-a);

    % Find the y intercept useing that slope and point one 
    y_inter = f(a) - (slope*a);

    % Plug the slope, y intercept, and x value for the third point into y =
    % mx + b eqn. 
    y_line = (slope*m) + y_inter;
  
    if f(xmin) > f(m) | f(m) == y_line % start big if 
        
       %fprintf('\nGolden Search')
        [x,y,z,xn] = GoldenSearch(f, a, b, Tol, 1);
        a = x;
        m = y;
        b = z;
        xmin = xn;
        interval = [a m b];
        
    else 
    %fprintf('\nSPI Method')
    if xmin < m 
            b = m;
            m = xmin;

            interval = [a m b ];
         
    elseif xmin < b
            a = m; 
            m = xmin;

            interval = [a m b ];
    end

     num = (f(a)-f(m))*(b-m)^2 - (f(b)-f(m))*(m-a)^2;
     denom = (f(a)-f(m))*(b-m) + (f(b)-f(m))*(m-a);
     xmin = m + (0.5 * (num/denom));

    end % end big if 

    error = abs(b-a);
    iters = iters + 1;

end % end while loop  

min = f(xmin); 

end % end of function 

