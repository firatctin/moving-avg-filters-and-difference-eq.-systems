# Digital Signal Processing Averaging Filter Experiment

## Introduction

In this project I aimed to filter a signal which has a Gaussian Noise N~(1,4) in three different funcitons. In the first stage I wrote my own function, which can be found at [here](./MATLAB%20Files/my_mov_ave_filter.m). Then I created a sinosoidal signal and tried it [here](./MATLAB%20Files/my_own_func.m). The results have shown the averaging filter is a low pass filter ( because it prevents the high frequency noise) and the more accuracy you obtain the more elements in your filter degree but there is disadvantages. The most important one is getting delay while adding elements in your filter.

## Application
### Results of Funciton Made By Me 
The results are shown below:

#### N =4 where N is the element number in filter

![N=4](./Result%20Graphs/own_func_fil_deg_4.jpg)

#### N = 8

![N=8](./Result%20Graphs/own_func_fil_deg_8.jpg)

#### N = 12

![N=4](./Result%20Graphs/own_func_fil_deg_12.jpg)

### Fılter Command Results
Then I used the filter function which is included by MATLAB. It has the same working principle with my funciton and same advantages. The resultant graphs are represented below:


#### N =4 where N is the element number in filter

![N=4](./Result%20Graphs/filter_N_4.jpg)

#### N = 8

![N=8](./Result%20Graphs/filter_N_8.jpg)

#### N = 12

![N=4](./Result%20Graphs/filter_N_12.jpg)

### Conv Results

This time I used the conv command to filter the signal. It prevents the signal delay if used by 'same' argument in it. Same argument excludes the summations which has less element than the moving filter. It has the same length with the signal.

#### N =4 where N is the element number in unit impulse response

![N=4](./Result%20Graphs/conv_N_4.jpg)
#### N = 8

![N=8](./Result%20Graphs/conv_N_8.jpg)

#### N = 12

![N=4](./Result%20Graphs/conv_N_12.jpg)



## Conclusion
Moving average filter can be a good tool to get rid of the high frequency normally distributed noises but user must be cautionly perform it. Because there is a optimization problem which concerned about the delay and the smoothining the signal when performing filter command.