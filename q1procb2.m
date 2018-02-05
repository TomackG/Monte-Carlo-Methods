for n=1:6
    
    N=10^n; %specifies sample size
    
    for i=1:N
        y(i)=rand; %generates random variable from U[0,1]
        x(i)=-log(1-y(i)); %generates random variable with pdf f(x)
    end
    
    sum=0; %initialises sum as zero
    var=0; %initialises variance as zero
    
    for i=1:length(x)
        sum=sum+x(i)^(3/2); %sums g(x(i)) over each x(i)
        var=var+(x(i)^(3/2)-3*sqrt(pi)/4)^2; %sums distance of each x(i)
    end                                      %from true value of I
    
    rms(n)=sqrt(var/(N*(N-1))); %calculates root mean square error for
                          %for corresponding n value
    err(n)=abs(3*sqrt(pi)/4-sum/N); %calculates absolute error for
                                    %corresponding n value
    ns(n)=N; %generates vector containing each value of n

end

plot(log(ns),log(err),'+',log(ns),log(rms),'x') %generates loglog plot