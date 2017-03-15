---
title: SAR Radar Back-end PCB MK 2 (ongoing)
date: 2016-12-04 10:14:10
last_update: 20161204
categories: Project
project: UAV
---
#### This blog has not been fully finished, and I will update it by time.  
![demo_banner]({{ site.baseurl }}/images/UAV/sar_radar_backend/filter_banner.png)
  
>* Background
>* MK2 System outline
>* Flowchart
>* Radar VCO source matrix
>* Radar output matrix
>* Filter validation
>* PSoC analog design validation

## Background
Please refer to the [MK1 system design]({{ site.baseurl }}/project/2016/11/22/SAR-Radar-Backend.html) for more background information and system requirements. 

## MK2 System outline  
 
As long as this system focuses more on the experiment purpose and it will be the first generation, easy to debug and comparing different designs are more important. So both the radar input VCO signal and output signals are connected with analog MUX that we can test with different signal source and filter/amplifier design.  

## Flowchart   

## Radar VCO source matrix  
In our early time design, VCO signal will be provided from Teensy3.1 DAC. In MK2 design, we will have three selectable VCO signal source:  
1. Teensy3.1 DAC  
2. PSoC DAC  
3. External function generator. 
After analog MUX, VCO signal will be guided to the PSOC for VCO signal sampling. All of the VCO signal source will be within the 0~3V range, and a 10 db amplifier will be attached after the analog MUX and eventually feed a 0~10V range VCO signal to the radar.  

## Radar output matrix  
Radar output design is a tricky part. K-MC1 radar has four available outputs:  
1. AC I  
1. AC Q  
1. DC I  
1. DC Q  
We may not need DC parts output, but it will be nice to have. Since PSoC only has two individual SAR ADCs, and one of them is already used to sampling the VCO signal, only one ADC channel is available at one time. so it is a 4:1 MUX.  
Also, we found that radar output signal strength is directly related to the reflective RF signal, and raw output signal from radar can be lower to the -100dbm, it is better to have programmable gain amplifier. In MK2 design, we have three output signal processing paths as you can see in the flowchart. 

## Filter validation  

## PSoC analog design validation

## Schematic Design and layout
**Date on the board should be Feb.7 2017**  
![backend_MKII_Finished]({{ site.baseurl }}/images/UAV/sar_radar_backend/backend_MKII_Finished.jpg)

---
*Last update: March.15 2017*  
