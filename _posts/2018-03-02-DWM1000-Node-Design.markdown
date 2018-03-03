---
title: DWM1000 Node Design
date: 2018-03-02 11:43:43
last_update: 20180302
categories: Project
project: AR
---

![demo_banner]({{ site.baseurl }}/images/others/DWM1000/DWM1000_GEN3.png)

## Post Overview
>* Introduction
>* Things to know
>* Schematic
>* Attachment

## Introduction
This post should have been done back to late-2015, but I am lazy. Now I post it out, and you will see some information points, and my schematic. Following the [previous test]({{ site.baseurl }}project/2015/05/15/Test-DWM1000-UWB-Module-with-Arduino.html), I found that DWM1000 is promising, so I wanted to build a more legit and compact PCB carrier to setup a working DWM1000 ranging system.  

This design was tested and verified during the [2016 Hackdavis](http://hackdavis.io/2016/).  
And, special thanks to [Jonathan Tao](http://jgtao.me/content/09-28-17/). 

## Things to know  
Here are somethings need to know in advance, both on legal side and technical side. 

### Declaration: 
1. This blog does not guarantee any functions or quality. This blog provides the design "as-it-is". 
2. I did such design out of personal interests and intend for educational purpose, so please do not use it for commercial use. 

### Technical concerns: 
1. DWM1000 VDD range is 2.8V ~ 3.6V, and digital pins are following this voltage range so we provide it a clean 3.3V power supply using LDO.  
However, special concerns should be taken to some chips that have different voltage range on VDD and digital pins, for example [VL53L0X](http://www.st.com/content/ccc/resource/technical/document/datasheet/group3/b2/1e/33/77/c6/92/47/6b/DM00279086/files/DM00279086.pdf/jcr:content/translations/en.DM00279086.pdf) sensor.
2. Atmega 328U MCU maximum(stable) clock frequency depends on the power supply. Roughly speaking, Atmega328U can work at 16MHz sysclk under 5V but not 3.3V. On 3.3V rail, according to the datasheet, Atmega 328U can reach at most 12MHz. So in our case, in order to maximize the clock frequency for better timing precision, the Atmega328U works on 5V rail and talks to DWM1000 Module via level shifters.
3. Different interfaces need different level shifters depending on the drive implementation. For example, I2C defines open-drain driving method, so pull-up resistors are neccessary, and level shifters should be labaled as I2C compatible.  
Here is application note([AN10441](https://www.nxp.com/docs/en/application-note/AN10441.pdf)) from NXP about bootstrap an I2C level shifter using simple MOSFETs.  
Most of the GPIOs, and UART interfaces are strong-drive, so many general purpose level shifters can be used here.

## Schematic 
![Schematic]({{ site.baseurl }}/images/others/DWM1000/DWM1000_GEN3_Sch.png)

## Attachment
[Schematic]({{ site.baseurl }}/images/others/DWM1000/completeNodeSCH_ver3.pdf)  
[Layout]({{ site.baseurl }}/images/others/DWM1000/completeNode_ver3.pdf)    
[Eagle project]({{ site.baseurl }}/images/others/DWM1000/NodeGen3.zip)  

--- 
*Last update: March.2.2018*