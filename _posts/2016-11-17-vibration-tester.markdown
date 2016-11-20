---
title: Vibration Tester (ongoing)
date: 2016-11-17 16:40:43
categories: Project
project: UAV
---

![demo_banner]({{ site.baseurl }}/images/UAV/vibration_tester/vibration_banner.png)

>* Introduction
>* Modularize design
>* Pick up accelerometer
>* Design
>* Layout
>* Next step

## Introduction
In our research group short term plan, we plan to mount some sensors including SAR Radar on the UAV for some special missions, so we need a fairly stable UAV platform. We can simple buy vibration absorbers and assemble a lightweight stable frame, but we dont know the vibration characteristics on frequency domain, and especially for Radar application, it is crucial to measure the vibration amplitude, frequency, power, even phase for signal compensation.  
In case that out lab has limited budget and those commercial grade vibration meters are very expensive, I decided to build myself.  
### Criteria  
1. High bandwidth (As high as possible, because motors on the drone are working at high rpm)  
2. Lightweight. Heavy measure unit will change the platform characteristic.  
3. Easy digital interface. This tester may be left on the drone as permeate sensor, so it should have good digital interface for companion computer.
4. Robust 

--
*Last update: Nov.19 2016*