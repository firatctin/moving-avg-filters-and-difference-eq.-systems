# Digital Signal Processing Averaging Filter Experiment and Difference Equation Evaluations

## Introduction

In this project I aimed to filter a signal which has a Gaussian Noise N~(1,4) in three different funcitons. In the first stage I wrote my own function, which can be found at [here](./MATLAB%20Files/my_mov_ave_filter.m). Then I created a sinosoidal signal and tried it [here](./MATLAB%20Files/my_own_func.m). The results have shown the averaging filter is a low pass filter ( because it prevents the high frequency noise) and the more accuracy you obtain the more elements in your filter degree but there is disadvantages. The most important one is getting delay while adding elements in your filter. And then, we are going to look for some difference equation input output relationship discrete time system analysis.

## Application
### Results of Funciton Made By Me 

Function file can be accessed by [here](./MATLAB%20Files/my_mov_ave_filter.m)
Application file can be accessed by [here](./MATLAB%20Files/my_own_func.m)

The results are shown below:

#### N =4 where N is the element number in filter

![N=4](./Result%20Graphs/own_func_fil_deg_4.jpg)

#### N = 8

![N=8](./Result%20Graphs/own_func_fil_deg_8.jpg)

#### N = 12

![N=12](./Result%20Graphs/own_func_fil_deg_12.jpg)

### Filter Command Results

Then I used the filter function which is included by MATLAB. It has the same working principle with my funciton and same advantages. The resultant graphs are represented below:

Application file can be accessed by [here](./MATLAB%20Files/filter_function_application.m)


#### N =4 where N is the element number in filter

![N=4](./Result%20Graphs/filter_N_4.jpg)

#### N = 8

![N=8](./Result%20Graphs/filter_N_8.jpg)

#### N = 12

![N=12](./Result%20Graphs/filter_N_12.jpg)

### Conv Results

This time I used the conv command to filter the signal. It prevents the signal delay if used by 'same' argument in it. Same argument excludes the summations which has less element than the moving filter. It has the same length with the signal.

Application file can be accessed by [here](./MATLAB%20Files/filtering_with_conv.m)


#### N =4 where N is the element number in unit impulse response

![N=4](./Result%20Graphs/conv_N_4.jpg)

#### N = 8

![N=8](./Result%20Graphs/conv_N_8.jpg)

#### N = 12

![N=12](./Result%20Graphs/conv_N_12.jpg)



### Difference Equation Analysis

You can reach the source code of this entire section from [here](./MATLAB%20Files/differenceeq.m)

#### Analytical Analysis of the Unit Impulse Response of Systems

Firstly we are going to determine the unit impulse responses for this systems, it is a great start to express the LTI systems. Our systems defined as:


![Systems1](./Result%20Graphs/diffeq1.png)


![Systems1](./Result%20Graphs/diffeq2.png)


Firstly we do it with analytical solution as you can observe below:

![AnalyticalSolutions](./Other%20Graphical%20Content/analytical_sol.png)

#### Matlab Analysis of the Unit Impulse Response of Systems

Then we are going to find their unit impulse responses via Matlab. The results would be like that:

![uir1](./Result%20Graphs/difference_eq_1_initial_fixed.jpg)


The unit impulse response which we found is slightly different from matlab evaluation because of the initial conditions. Because of the y[n-1] term there is no way to start the system from the sample 0 so i delay our signal 1 sample.


![uir2](./Result%20Graphs/difference_eq_2.jpg)

Code Block:


![1](./Code%20Blocks/1.png)


![2](./Code%20Blocks/2.png)

It is clear we've done the evaluations true.

#### Unit Step Signal Response of the Systems

Then we are going to create a unit step signal and use it as an input to our systems. Firstly we can start the unit step function decleration in matlab. We can use the condition n>= 0 and the stem function to obtain a discrete time unit step signal.

![3](./Code%20Blocks/3.png)

Here is the resultant plot:

![unitstep](./Result%20Graphs/unit_s.jpg)



And then we are going to use the convolution to determine the response of the system to this input. As we know from the LTI system analysis in an LTI system convolution of the input signal and the unit impulse response of the system would provide us the response of the system to this specified input signal.


![conv_formula](./Other%20Graphical%20Content/conv_formula.png)


The graph we end up with is:


![convcommandblock](./Code%20Blocks/conv_codeblock.png)

![conv_results1](./Result%20Graphs/conv1.jpg)


![conv_results1](./Result%20Graphs/conv2.jpg)

As you can see thhe zero value jump has been smoothened. That kind of jumps has the very high frequency because there is a change occurs in a 1 sample time. So it is a high frequency change. We can accept this system as a low pass filter because of that. We will include more information in this documentation about this at the further sessions of the text.


To compare the filtration result we will perform a filter command on this signal. It must carry the arguments a which is a vector contains the coefficient of the output terms(y), and b which is a vector that contains the coefficients of the input terms(x). By doing this we can define the system by just using a filter function.


![4](./Code%20Blocks/4.png)


Filtered signal is like:


![filteredsig](./Result%20Graphs/filtered_diffeq.jpg)

While using this block we dont get the unnecessary summation terms at the end of the convolution graphs. Because it acts like a "same" argument taken convolution operation. Same argument provides a result which has the same length to our input signal.

#### Determining the Type of The Filter

As we can observe this system acts like a filter and we did the proper explanation. But to get a more scientific accurate detection we can look for the frequency response of the system. We know that the filters can be seperated 4 different general types and they are:

1. Low Pass
2. High Pass
3. Band Pass
4. Band Stop

And we can detect what filter type is suitable for our system by looking this graphs:


![referenced_graph](./Other%20Graphical%20Content/Frequency-response-of-different-type-of-filters.png) (Figure 1)


Let us plot the frequency response for the first system:


![freq_res](./Code%20Blocks/5.png)

![Freq_res_plot](./Result%20Graphs/freq_resp.jpg)


And we can easily see the type that is suitable for our case is the low pass filter. We can interpret this plot by saying "the filter  pass the low frequency signals but prevent the high frequency part."

## Conclusion
Moving average filter can be a good tool to get rid of the high frequency normally distributed noises but user must be cautionly perform it. Because there is a optimization problem which concerned about the delay and the smoothining the signal when performing filter command.

We obtain so much information about filters and how they performed in the signals. Any difference equation related system can be applied with the filter function and they can be easily expressed if they are LTI.

## References

(Figure 1) Development of an improved scheme of Digital Beam Forming(DBF) in elevation for spaceborne Synthetic Aperture Radar(SAR) and single-pass SAR Tomography analysis, Ahmedul Haque, June 2016, ResearchGate, https://www.researchgate.net/figure/Frequency-response-of-different-type-of-filters_fig10_303856968