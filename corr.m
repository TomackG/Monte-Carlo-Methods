t1=250; %sets value for t1
nt=T-t1; %calculates difference between t1 and T
tau=[0:nt]; %generates vector tau

for i=1:length(tau) %runs over entries of tau
    sum=0; %sets sum to 0
    for j=1:n %runs over columns of x
        sum=sum+x(t1,j)*x(t1+tau(i),j); %calculates sum
    end
    E(i)=sum/n; %calculates expected value for each tau
end
plot(tau,E,'.'); %generates plot