% Golden search method where case one is a single iteration and case two
% runs till a tolorance has been hit 

function [x, y, z, xmin] = GoldenSearch(f, a, b, T, s)

iters = 0;
    
    r = (sqrt(5) - 1)/2; % Golden Ratio
    d = r*(b-a);
    x1 = a+d; 
    x2 = b-d; 
    error = 1; 

    switch s 

    case 1

        if f(x1) < f(x2)
            x = x2; % x is a
            y = x1; % y is m
            z = b; % z is b
            xmin = (x+y)/2;
        elseif f(x1) > f(x2)
            x = a; % x is  a 
            y = x2; % y is m 
            z = x1; % z is b 
            xmin = (y+z)/2;
        end

    case 2
    while error > T % start while
        if f(x1) < f(x2)
            a = x2;
        else
            b = x1;
        end
        d = r*(b-a);
        x1 = a+d; 
        x2 = b-d; 
        iters = iters + 1;
        error = (b-a);
    end % end while loop 
    x = iters;
    xmin = (x1+x2)/2;
    y = f(xmin);
    z =0; % not needed for this case
    end % end switch case 

end % end of function 
