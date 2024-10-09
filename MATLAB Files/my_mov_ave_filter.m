function y = my_mov_ave_filter(x,fil_deg)
N=length(x);
y=zeros(size(N));
for i=1:N
    if (i<fil_deg)
        summation = sum(x(1:i))/fil_deg;
        y(i) = summation;
    else
        summation = (1/fil_deg)*(sum(x(i-(fil_deg-1):i)));
        y(i) = summation;
    end
end
end
 