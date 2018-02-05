function y = mybinom( n, k )
%This function calculates the binomial coefficient n choose k.
y=myfac(n)/(myfac(n-k)*myfac(k)); %This is a direct computation that calls
                                  %the previously defined function myfac

end

