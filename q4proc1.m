n=500; %sets number of random walks generated
t0=0; %sets initial time
T=500; %sets final time
dt=0.001; %sets size of timesteps
tspan=[t0:dt:T]; %sets vector of time steps

x0=0; %sets initial condition as zero
for j=1:n %loops over number of random walks
    x(1,j)=x0; %sets inital condition as first entry in jth column of x
    for i=1:length(tspan)-1 %runs over time increments
        x(i+1,j)=x(i,j)-(x(i,j)*dt)+sqrt(dt)*randn; %generates random walk
    end
end

n1=100; %sets number of bins
a=-2.5; %sets minimum value of range of histogram
b=2.5; %sets maximum value of range for histogram
dx=(b-a)/n1; %sets size of each bin
v=x(i+1,:); %sets v as final row of matrix x
xrange=[a:dx:b-dx]; %specifies range for histogram

h=myhist(v,a,b,n1); %calls function myhist that generates a vector h

for i=1:length(h)
    ncounts(i)=h(i)/(n*dx); %scales h appropriately
end

plot(xrange,ncounts,'+',xrange,exp(-xrange.^2)/sqrt(pi)) %generates plot
