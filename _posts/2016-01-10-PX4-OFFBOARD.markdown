---
title: PX4 OFFBOARD Flight test
date: 2016-01-10 15:22
categories: Project
project: UAV
---

![RTL-SDR]({{ site.baseurl }}/images/UAV/OFFBOARD01102016/uav_banner.png)

## Post overview
>* What is OFFBOARD mode on PX4
>* Pre-flight
>* Flight test



## What is OFFBOARD mode on PX4
PX4 is flight stack firmware for general UAVs, including quadcopter, hexcopter, fixed wings and VTOLs.

Normally users use QGroundcontrol, a ground control station software, to monitor and plan the way points for the UAV. It is enough for most the cases, but for developers, it is far less than our expectation. Current goal for this UAV is collecting data remotely from unmanned data logger in the field, so the UAV needs to hover at the destination positions, let PSoC based BLE data collector download the data. During the mission, UAV should be able to avoid collision, and find the best way to reach the data-logger. BLE has short transmission range, so if UAV follows the waypoints tiedly, it is possible that BLE signal is too weak to setup connection or the hover time is too short to completely download all the data logs.

So a way to dynamically control the UAV is important to this project. PX4 is capable been controlled by another controller, which is **OFFBOARD flight mode**, and such a controller called **companion computer**. In our setup, the companion computer is Intel Edison.

This post records our team's first time OFFBOARD mode flight test.

And, welcome to visit our github repo: [UCD-UAV](https://github.com/ucdart/UCD-UAV)



## Pre-flight
According to our teams's *Flight test routine*, we need to do "Pre-flight check", "Flight test record" and "Post-flight report".
Pre-flight consist of safety check, weather check, in-door flight test routine and preparation clear list.

#### Safety check
- After check, no losse part, and every screw has been tied. 
- UAV registration number has been sticked on the structure.
- Propellers are fastened.
- UAV self-check passed.
- No critical error shown on the QGC software
- Safety hook checked

![safety hook]({{ site.baseurl }}/images/UAV/OFFBOARD01102016/safetyhook.png)


#### Weather check
- Soft wind.
- Clear.
- No rain.
- Soil on the field is acceptable.
- Time was ~2pm afternoon.

#### In-door flight test
On Jan. 9 afternoon, an in-door flight test has been conducted both on manual mode and POSCTL mode in safety net. And Edison worked well.
![In door test]({{ site.baseurl }}/images/UAV/OFFBOARD01102016/indoortest.png)

So I can see the real time condition of UAV from my monitor.py script:
![preparation]({{ site.baseurl }}/images/UAV/OFFBOARD01102016/monitor.png)

#### Preparation clear list
- Fishing rod (Last way to stop UAV from lost control)
- RC controller
- Laptop
- Router 
- Router battery

![preparation]({{ site.baseurl }}/images/UAV/OFFBOARD01102016/preparation.png)

## Flight test
Finally the Intel Edison successfully control UAV follow the Airfield traffic pattern!
The flight test works like a charm.



<iframe width="560" height="315" src="https://youtube.com/embed/AcaxBFaYvDs" frameborder="0" allowfullscreen></iframe>


### License
* [MIT](http://opensource.org/licenses/MIT)

