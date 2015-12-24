---
title: Begin of TinyCar
date: 2015-10-21 18:00:16
categories: Project
project: TinyCar
---

![Track]({{ site.baseurl }}/images/TinyCar/natcar.png)

## Post overview

>* Things gone and comming
>* What exactly the competition is?
>* Inspiration from a competition in Japan
>* First idea
>* Project management

## Things gone and comming
![Rank]({{ site.baseurl }}/images/TinyCar/rank_2015.png)
During NATCAR competition 2015, with two of my partners, I participated in the competition. This competition was held in our campus, but due to the limited time and bad design, we got 14th in the competition. What a bad memory! We are bet by teams from almost all other univerisities. So, this year, though I have finished my senior design class, I want to do it again. Our goal? 1st place, ofcourse. We want to break the record and keep it at least two years (Maybe one year).
![Old car]({{ site.baseurl }}/images/TinyCar/old_car.png)
This is the car we used last semster. Actually this is car for the Freescale Cup competition, and we are required to use the common car frame, motors, freescale MCUs and cameras. We did not optimize out car for NATCAR a lot, so this is the main reason we dead.


## What exactly the competition is?
This is a model car racing competition held by several universities in UC and other higher education systems, including UCD, UCB, UCI, UCLA and so on. Basically it is line tracking car racing, and the rule only resitrict the amount of motors, the battery format and car configuration. So it is reletively opened competition. The most important point in the rule that gives me motivation to participate again is, this competition allows machine learning and map memorying.

![Track]({{ site.baseurl }}/images/TinyCar/natcar_track.png)


## Inspiration from a similiar competition in Japan
At least in my head, there are many crazy geek engineer come from Japan. I strongly recommand
[elm-chan](http://elm-chan.org/)
He is a amazing guy.
Similarly, we got idea from a Japan racing car competition called *All Japan Micromouse Contest* , and the champion with his car [Cartisx04](http://anikinonikki.cocolog-nifty.com/blog/2014/11/cartisx04.html)
This car is extremely lightweight, and it is also super active due to its special steering design in fully differential steering. We decided to make our design based on his idea:

- Lightweight
- Differential steering (because this strategy can keep the steering radius as small as possible)
- Sensor arrays on the front of the car (Major problem within camera-based sensor is that it has very low data rate, so we will use analog sensor)
- Machine learning
- High power density motor

## First thoughts
> Is our Tinycar heavier than Cartisx04?

YES. Because the rule says, each car needs a 6"x3" flag in order to trigger the timer.

> How big the Tinycar should be?

Hmm. Good question. We asked [Formula Racing Car]({{site.baseurl}}/fsae.html) Team guys for vehicle dynamic materials for referencing,and I personally checked a lot of Matlab racing car modules, but have no clear result at this point, becuase Tinycar's wheels configuration is weird. So we decided to break the progress in parallel:

1. First we finish the design of each subsystem
2. Then we calculate the total weight and mass distribution
3. Then we build Type 0 car, which is experimental car by thumb of rule, get first hand data
4. At the same time, we learn Vehicle Dynamics from either textbooks and other resources.
5. Finally, when we have enough or not enough knowledge in heads and rich experimental data, we turn to account the vehicle dynamics design in Type 1 or the realease version of the car.

> How fast it can run?

At least doubled the speed of last year's champion. According to the [2015 Race Results](http://www.ece.ucdavis.edu/natcar/2015-race-results/), champion has the speed of 10.62ft/sec. So our car should have at least 21.24ft/sec at average speed. So the maximum speed, which is usable maximum speed with reliable torque, is considered as 10m/sec (25.4ft/sec). So the max usable motor rpm should be greater then 10m/(0.05m\*PI)*60s=3822 rpm.

> Controller?

As long as we need to implement high control system frequency, because we dont have slow 50Hz analog servomotor and slow camera sensor, we want to set the whole system in update rate over 200Hz. High frequency means low latency and higher IMU precision. So we chose STM32F4 series MCU, with can reach at most 168MHz clock frequency. 

> Motor?

Motor from MAXON company from Swiss is exellent choice. This company produce high quality compact sized DC and AC motors. For example, Cartisx04 uesd 10mm diameter brushed DC motor, and its car has power-weight ratio of 61mW/g. We decide to choose a bigger model, DCX 14L series, which has 14mm diameter and 10W maximum continuous power output with fairely high rpm. Then without sacrifice any performance, our car can reach the boundary weight at 2*10W/61mW=300g. Also, we will add encoder for the motor, then we can precisely control the speed of motor, which is very important, because differential speed of the motor is the only way to steer.  

## Project management
Our team consist of three people, and our Project files are on the Google Drive. We will use github.com for coding collaboration. Since all the team members are familiar with each other and are enthusiasim in this project, there is no routine meeting nor assigned working team. We publish each person's jobs on Google docs and discuss online. This project started at October 2015, and will be ended on the day of NATCAR competition 2016, which should be in May. 2016.

We asked department for sponsor but failed, so we decided to sponsor ourselve. Total budget is around $1300.

Also, I will update this project page from time to time.



### License
* [MIT](http://opensource.org/licenses/MIT)

