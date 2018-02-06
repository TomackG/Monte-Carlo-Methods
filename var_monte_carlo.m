N=10^5; %specifies number of random samples we pick

for i=1:N
    y(i)=rand; %generates random variable in U[0,1]
    x(i)=-log(1-y(i)); %transforms y into a variable with specified pdf
end

var=0; %initialises variance as zero

for i=1:length(x)
    var=var+(x(i)^(3/2)-3*sqrt(pi)/4)^2; %sums distance of each x(i) from
end                                      %true value of I

rms=sqrt(var/(N*(N-1)) %generates root mean square error of estimates
