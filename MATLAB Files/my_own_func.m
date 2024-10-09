%we are creating a desired sinozoidal signal
sample = linspace(0,0.2,100);
sin_s = 10*sin(2*pi*10*sample);
%we are adding a gaussian noise to our singal N ~ (1,4)
noise = 2*randn(size(sample));
noisy_s = sin_s + noise;


filtered_sig = my_mov_ave_filter(noisy_s,12);

plot(filtered_sig);
hold
plot(noisy_s,'r')

