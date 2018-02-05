function y = myfac( c )
% This is a recursive function that calculates the factorial of an input c.
if c==0 % This stops the recursion when c is 0
    y=1; %This sets y=1
else if c<0 %This produces an error message if input is negative
        error('Argument must be non-negative');

    else %This recursively calls myfac until c is zero.
    y=c*myfac(c-1);
end

end

