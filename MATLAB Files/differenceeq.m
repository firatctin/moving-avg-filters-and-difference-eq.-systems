%this file is concerned about the application of impz func
%we will find 2 difference LTI systems' impulse response

%the first one is:
%y[n] = 0.4y[n-1] + 0.6x[n]

%for impz functioon a = [1,-0.4], b=[0.6]
a = [1,-0.4];
b = 0.6;
impulse_res1 = impz(b,a,20);
%in our calculations we calculated the impulse response as
%h[n] = 0.6 * (0.4)^n*u[n]
%but there is a crucial point about the initial conditions
%because of there is no negative sample elements can be observed in a
%system we should delay the signal by one.
%let's plot them and compare


t = linspace(0,20,20);

impulse_res_cal1 = 0.6 * power(0.4,t-1).*(t>=1);


f1 = figure;
subplot(2,1,1);
stem(impulse_res1);
title('Impulse Response Calculated by Matlab');
subplot(2,1,2);
stem(t,impulse_res_cal1);
title('Impulse Response Calculated Analytically');

%the resultant graph shown in the readme file


%the second one is:

%y[n] = 0.5*y[n-1] + 2*x[n] - 0.2*x[n-1]
t_1 = 0:20;
a = [1,-0.5];
b = [2, -0.2];
impulse_res2 = impz(b,a,20);

%in our calculation we calculated the impulse response as:
%h[n] = 2*((0.5)^n*u[n] - 0.1*(0.5)^(n-1)*u[n-1])
impulse_res_cal2 = 2*(power(0.5,t)- (0.1*power(0.5,(t-1)).*(t>=1)));
f2 = figure;
subplot(2,1,1);
stem(impulse_res2);
title('Impulse Response Calculated by Matlab');
subplot(2,1,2);
stem(impulse_res_cal2);
title('Impulse Response Calculated Analytically');

%now we are going to detect the system responses for a unit step signal
%creating the unit step signal:

n = -100:100;

unit_s = (n >= 0);


%Now compute the system responses for this input 

%for the first systems:
conv_result1 = conv(unit_s,impulse_res1);
conv_n = -100 + (0:length(conv_result1)-1);
conv_n = conv_n(1:length(conv_result1));  
response1 = conv(impulse_res1,unit_s);

figure;
stem(conv_n,response1);
title('conv(y[n] = 0.4y[n-1] + 0.6x[n], u[n])');

%for the second system:
conv_result2 = conv(unit_s,impulse_res2);
conv_n2 = -100 + (0:length(conv_result2)-1);
conv_n2 = conv_n(1:length(conv_result2));  
response2 = conv(impulse_res2,unit_s);

figure;
stem(conv_n2,response2);
title('conv(y[n] = 0.5*y[n-1] + 2*x[n] - 0.2,x[n-1]* u[n])');

%let's apply the filter command to our first system
b = 0.6;
a = [1, -0.4];


filtered1 = filter(b,a,unit_s);
figure;
stem(n,filtered1);
title('Filter Performed Unit Step');

%let us calculate freq response of the system

[H,f] = freqz(b,a,256);
figure;
plot(f/pi, H);
title('Frequency Response of y[n] = 0.4y[n-1] + 0.6x[n]');



