%we are creating a desired sinozoidal signal
sample = linspace(0,0.2,100);
sin_s = 10*sin(2*pi*10*sample);
%we are adding a gaussian noise to our singal N ~ (1,4)
noise = 2*randn(size(sample));
noisy_s = sin_s + noise;

%arranging the nominator argument of the filter
N = 12;
h = zeros(1,N);
for i=1:N
    h(i) = 1/N;
end

%filtering the signal
filtered_sig=filter(h,1,noisy_s);
plot(noisy_s);
hold
plot(filtered_sig);



legend({'Noisy Signal','Filtered Signal'},'Location','southwest')
