---
title: Agriculture UAV demo
date: 2016-04-15 15:12:00
categories: Project
project: UAV
---

![demo_banner]({{ site.baseurl }}/images/UAV/2016demo/demo_banner.png)

## Post overview
>* Background
>* Setup
>* Demo flight


## Background
As a student in the university known as its great algriculture department, I understand how painful it is to manually collect data from the data loggers in the field. There could be hundreds of the data loggers in the large field four-hour driving away, so we port our UAV to do this specific job: flying across the field and hovering over the data loggers, downloading the data and uploading them to the cloud. 

## Setup

### UAV setup
#### UAV platform

Our main UAV was crashed and have not been fixed, so we used 3DR Iris+ to do the demo.

#### Companion computer
We chose Inel edison as companion computer, plus the customized interface board--[Intel Edison Shield]({{ site.baseurl }}/project/2016/02/15/IntelEdisonShield.html). 

![Companion Computer setup]({{site.baseurl}}/images/UAV/2016demo/companion_computer.png)

#### Ground data logger
Anther group of students designed this data logger based on PSoC 4 and BLE (Bluetooth Low Energy). This data logger will read humidity, temperature, luminance and moisture. It also has a SD card, so it will log data into SD card first, and upload logs when UAV is trying to collect data.

 ![Ground data logger]({{site.baseurl}}/images/UAV/2016demo/datalogger.png)

#### Payload: Data collector
In our system, UAV platform is only vehicle, and data collecting task will be done by mission payload -- Data collector.

We did not have enough time to design extra mount points and racks to make job be gorgeous, but tape for quick and dirty.

![Together]({{site.baseurl}}/images/UAV/2016demo/UAV_payload.png)

### Task plan
#### Task plan
This demo shows following steps in order:
1. Taking off 
2. Flying to first data collecting position (10,0) and howering for 5 seconds
3. Flying to second data collecting position (10,10), howering and ask payload data collector to collect data.
4. Flying to third data collecting position (0,10) and howering for 5 seconds. 
5. Flying back to home position and landing.

**We only have one data logger prepared, so we only collect data on the second point.**


#### Task script
Our system uses Task script to describe the flight tasks.

```
TASK_LOCAL_GOTO 10 0 5 20
TASK_GRAB_DATA 5 10
TASK_LOCAL_GOTO 10 10 5 20
TASK_GRAB_DATA 5 10
TASK_LOCAL_GOTO 0 5 5 20
TASK_GRAB_DATA 5 10
TASK_LOCAL_GOTO 0 0 5 20
```

#### Map
Basically our UAV will follow a triangle trajectory as the following map:

![map]({{site.baseurl}}/images/UAV/2016demo/demo_trajectory.png)

## Demo flight
<iframe width="480" height="360" src="http://www.youtube.com/embed/je_YXCvn2sQ" frameborder="0" allowfullscreen> </iframe>




