function h = myhist( v,a,b,n )
dt=(b-a)/n;%calculates the size of each bin
for i=1:n%initialises value of each bin as zero
    h(i)=0;
end
for i=1:n%initialises loop over bins
    for j=1:length(v)%initialises loop over all values of input vector v
        if v(j)>a+(i-1)*dt&&v(j)<=a+i*dt%condition checks if each value 
            h(i)=h(i)+1; %of v lies in a given bin and increments the count
        end              %of that bin by 1.
    end
end
end

