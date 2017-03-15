---
title: Deliver Robot MK1
date: 2017-03-14 00:50:43
last_update: 20170314
categories: Project
project: DeliverVehicle

---

![demo_banner]({{ site.baseurl }}/images/DeliverVehicle/MKI_banner.jpg)

>* Introduction
>* System introduction
>* Development schedule/roadmap
>* Market survey
>* Possible risks and problems
>* Next step

## Introduction
This post talks about food deliver robot MKI test that I have done at the end of 2016.
I should update this post last year, but due to my health condition, I am just back.

## Goal  
This test validate the system integration and shows the feasibility that a self-guided vehicle with sensor fusion can discover in the room without collision, and eventually draw the map. 


## System design 
According to the road map in [Deliver robot MK0]({{ site.baseurl }}/project/2016/11/23/Deliver-Robot-MK0.html), this MKI model consists of the following subsystems:  

* 4WD vehidle body from Seeeduino  
* Odroid C2 Single-board Computer
* RPLidar Ver2 lidar 
* BNO055 IMU 
* ROS and its packages: RVIZ, GMapping, and so on.

## Subsystem

### 4WD Vehicle body 
![demo_banner]({{ site.baseurl }}/images/DeliverVehicle/4wd.jpg){:width="65%"}  
This is a 4WD vehicle body from seeeduino. I dont have budget to buy fancy frame like Husky UGV from clearpath, so I used this vehicle as placement. It worked good, but the only downside is that I need to write firmware for it.  
Inside the sheel, it is an atmega328P MCU, which is actually an arduino, so writing firmware could be very easy.
The firmware should have the following features:  

* Report current speed  
* Listen to the speed command. The command API is much like a vector: **Direction**, **Speed** 
* Drive the vehicle with PID control  
* Actually I should use ArduinoJson to form a better way to communicate, but at that time I did not see it.
* [Code](https://github.com/khjtony/deliver_robot/blob/mk0/src/vehicle_driver/encoder_test/motorDriverDemo/motorDriverDemo.ino)


### RPLidar and BNO055 
RPLidar V2 is the second version of original RPLidar. It rotates faster and had better precision.  
BNO055 came from Bosch, and it is featured by an internal Cortex-M0 core that calculates quaternion and orientation for you, which saved me a lot of time. If you do not need very high precision and update rate, or you are limited by computing power, you can check out this [product](https://learn.adafruit.com/adafruit-bno055-absolute-orientation-sensor/overview). 
![demo_banner]({{ site.baseurl }}/images/DeliverVehicle/another_deliver_alpha.jpg){:width="65%"}

### Software Setup  

*Waiting for update*

![demo_banner]({{ site.baseurl }}/images/DeliverVehicle/deliver_alpha_demo.jpg){:width="65%"}
 
*Waiting for update*

---
*Last update: March.15.2017*