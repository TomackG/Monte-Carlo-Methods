mu=[1.5, 2.0, 3.0, 5.0]; %generates vector mu
N=10^6; %sets the sample size

for i=1:length(mu) %runs over entries in mu
    m=mu(i); %sets ith entry of mu as m
     for j=1:N 
         y(j)=rand; %generates random variable
         x(j)=-log(1-y(j))/m; %converts y(i) to random variable with pdf
                              %for corresponding mu
     end
     
     sum=0; %sets sum as zero for mc estimate
     var=0; %sets variance as zero for RMS error
     
     for j=1:length(x)
         sum=sum+(x(j)^(3/2)*exp(-x(j)))/(m*exp(-m*x(j))); %sums function
         %of random variables in x for specific m
         var=var+((x(j)^(3/2)*exp(-x(j)))/(m*exp(-m*x(j)))-3*sqrt(pi)/4)^2;
         %calculates variance of rv's in x for specific m
     end
     
     mc(i)=sum/N; %generates vector of M-C estimate for ith entry of mu
     rms(i)=sqrt(var/(N*(N-1))); %generates vector of RMS for ith entry of
end                              %mu
plot(mu,mc,'+',mu,rms,'x',[1.5,5],[3*sqrt(pi)/4, 3*sqrt(pi)/4])
%plots the estimate, rms error and actual value of I for each mu