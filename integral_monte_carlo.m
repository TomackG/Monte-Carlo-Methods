N=10^5; %determines number of random samples we pick

for i=1:N
    y(i)=rand; %generates random variable from U[0,1]
    x(i)=-log(1-y(i)); %generates random variable with pdf f(x)
end

sum=0; %initialises sum as zero

for i=1:length(x)
    sum=sum+x(i)^(3/2); %sums x^(3/2) over each x(i)
end

err=abs(3*sqrt(pi)/4-sum/N);%calculates expected value i.e estimate

