alpha=0; %sets value for alpha
beta=1; %sets value for beta
N=1000; %sets sample size
for j=1:5000 %runs from 1 to 5000
    sum=0; %initialises sum as zero
    for i=1:N %runs over sample size
        y(i)=rand; %generates a random variable from [0,1]
        x(i)=beta*tan(pi*y(i)+atan(-alpha/beta))+alpha; %converts y(i) to
        sum=sum+pi*exp(-x(i)^2/2)*(1+x(i)^2)/sqrt(2*pi); %random variable
    end %from Lorentz distribution
    mc(j)=sum/N; %sets estimate as jth entry of vector mc
end

n=100; %sets number of bins
a=0.7; %sets minimum of range for histogram
b=1.3; %sets maximum of range for histogram
dx=(b-a)/n; %sets size of each bin
xrange=[a:dx:b-dx]; %specifies range as vector using left endpoints of bins

h=myhist(mc,a,b,n); %calls function myhist

for i=1:length(h) %runs over entries of h
    ncountsl(i)=h(i)/(N*dx); %appropriately scales entries of h
end
plot(xrange,ncountsl,'+') %generates plot
