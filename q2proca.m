N=1000; %sets sample size for approximation

for j=1:5000 %loops over number of estimates we want to generate
    sum=0; %sets sum as 0
    for i=1:N %loops over sample
        y(i)=rand; %generates random number from U(0,1)
        x(i)=20*y(i)-10; %superpositions y(i) so that x~U(-10,10)
        sum=sum+20*exp(-x(i)^2/2)/(sqrt(2*pi)); %sums g(x(i)) for each x(i)
    end
    mc(j)=sum/N; %assigns m-c approximation to jth position in vector mc
end

n=100; %sets number of bins
a=0.7; %sets minimum of range for histogram
b=1.3; %sets maximum of range for histogram
dx=(b-a)/n; %sets size of each bin
xrange=[a:dx:b-dx]; %specifies range as vector using left endpoints of bins

h=myhist(mc,a,b,n); %calls function myhist

for i=1:length(h) %runs over entries of h
    ncountsu(i)=h(i)/(N*dx); %appropriately scales entries of h
end
plot(xrange,ncountsu,'+') %generates plot

    