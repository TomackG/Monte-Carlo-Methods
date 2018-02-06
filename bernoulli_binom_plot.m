n=100; %sets number of sample paths
N=20; %sets number of time-steps
p=0.3; %sets proabability p

for j=1:n %loops over the number of paths
    for i=1:N; %loops over time-steps
        x(1,j)=0; %sets initial value as 0
        y=rand; %generates random number ~U(0,1)
        if y<=p %checks if y<=p
            xn=1; %sets xn to 1 if so
        else
            xn=-1; %sets xn to -1 if not
        end
        x(i+1,j)=x(i,j)+xn; %sets ith value of column vector as x(i-1)+xn
    end
end

n1=11; %sets number of bins
a=-5; %sets minimum value of range of histogram
b=6; %sets maximum value of range for histogram
dx=(b-a)/n1; %sets size of each bin
v=x(5,:); %sets v as 5th row of the vector x
xrange=[a:dx:b-dx]; %specifies range for histogram

h=myhist(v,a,b,n1); %calls function myhist that generates a vector h

for i=1:length(h)
    ncounts(i)=h(i)/(n*dx); %scales h appropriately
end

n=5; %sets value of n for actual binomial distribution 
x1=[-5:2:5]; %generates range of values for the displacement x1
for i=1:length(x1) %runs over entries of x1
    y(i)=mybinom(n, (x1(i)+n)/2)*p^((x1(i)+n)/2)*(1-p)^((n-x1(i))/2);
end%calculates the actual probability of observing x1(i) after n time-steps
plot(xrange,ncounts,'+',x1,y,'x') %plots histogram and actual pdf
