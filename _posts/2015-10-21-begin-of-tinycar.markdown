---
title: TinyCar Type0 sketch
date: 2015-10-10 22:13:16
categories: Project
project: TinyCar
---

![Track]({{ site.baseurl }}/images/TinyCar/TinyCar_SW_01.png)

## Post overview

>* TinyCar Solidworks sketch
>* TinyCar Sensor bar
>* TinyCar Propulsion
>* TinyCar IMU


## TinyCar0 Solidworks sketch
Because we dont have enough knowledge of chassis design, so we only came up with dimension values and put things together first, make the car rolling. This is Type0. After that, we can start on building Type 1, which maybe the "release" verion of TinyCar.

The sketch above shows the following parts:

- Battery
- Motors
- Downforce fans
- Motor drivers
- Pole stand
- STM32F4 controller
- Sensor bar

The competition last at most 5 mins, so we chose a 850mAh 2s1p battery pack, which can hold the energy for 5 mins at 10.2A current. Quite enough. The battery should be put as rear side as possible, because the center of mass issue. TinyCar uses differential steering, so the distance between two wheels on each side is short, making it hard to keep balance, so the battery is a kind of weight as another role.

In order to keep the approximate power-to-weight ratio of CurtisX04 car, we choose more powerful 14mm diameter motors from MAXON. This motor can output at maximum 10 Watt power and eat ~1.5A current each.


## TinyCar Sensor bar
Another team member J.G.Tao is working on Sensors. Basically, we use infarad diode to detect the trace. Most infarad sensors will be on the sensor bar infront of the car, and in order to minimize the impact of ADC reading delay to the main algorithm thread, and also for seperating the jobs for members, we also put an ATMEGA328P chip on the sensor bar to read the value, calculate the position of the trace, and send back to the STM32F4 MCU by either I2C or SPI.

![Track]({{ site.baseurl }}/images/TinyCar/sensor_00.png)

They are VSMB10940 and VSMB10940F pair, with good angle of view and good response delay.

Each pair can cover 1cm wide range on the ground, and trace is 1 inch, so we plan to put 8 pairs underneath of the bar.

According to the test, this pair is good.

![Track]({{ site.baseurl }}/images/TinyCar/sensor_test_00.png)

*Design details will be posted on another post.


## TinyCar Propulsion

## TinyCar IMU




### License
* [MIT](http://opensource.org/licenses/MIT)

