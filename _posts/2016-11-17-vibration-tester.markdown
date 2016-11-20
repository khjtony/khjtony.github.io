---
title: Vibration Tester(ongoing)
date: 2016-11-17 16:40:43
categories: Project
project: UAV
---

![demo_banner]({{ site.baseurl }}/images/UAV/vibration_tester/vibration_banner.png)

>* Introduction
>* Modularize design
>* Choose accelerometer
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
4. EMI proof. UAV is known as having noisy electromagnetic environment, though we have not measure the EMI at this moment, I need to take consider of it. 

## Modularize design/UNILINK
Also, in order to speed up my PCB design iteration, I start to modularize my design and designed an architecture to standardized powering and low-level interfacing which I gave the name **UNILINK**.  

### Modularize design  
It is not a new topic, but at the time that I can foresee a lot of digital system to design in our UAV, I can put most using sub-system on its own board, rather than just keeping schematic and re-layout every time. For example, I have designed three power modules:  
1. wide range 12V output module: Using switching regulator that accepts 12V to 40V voltage input, and provides 12V output.  
2. wide range 5V output with CAN: Similar with "wide range 12V output module", but this module also have CAN bus over power line, that we can broadcast low-level and essential messages to the bus. (Heartbeats, temperature, emergency trigger)
3. 3.3V LDO output    

![POL 5V schematic]({{ site.baseurl }}/images/UAV/vibration_tester/pol_5v_sch.png)  
*schematic of wide range 5V with power_over_can*  
![POL 5V pcb]({{ site.baseurl }}/images/UAV/vibration_tester/pol_5v_pcb.png)  
*layout of wide range 5V with power_over_can(Bottom layer hidden)*   

### UNILINK  
At the time when I think about modularized module, I also plan to split the system communication interface to ISO-like style. From the bottom layer to higher layout, I will implement different interface, making sure that different modules can talk to each other and the system has clear design outline.  
For example, CAN bus will provide essential status information including heartbeats, module ID, emergency triggering signal, force on/off signal. Higher than that, because I will put a PSoC MCU on each sub-system, all the module will sit on some high speed serial port bus that is fast enough to transmit messages in XBEE's API syntax or wrapped by rosserial package grammar. Xbee and bluetooth will be available at this layer. For even higher speed connection, Ethernet will be used. Very possible in the near future that when I have done the TCP/IP compatible CAN bus on Ethernet(Profinet, Modbus TCP, EtherCAT, etc), all the connections can be transmit via high speed link.  

**Known issue: PSoC 3/5LP do not have TCP/IP implementation, creating such module from scratch from UDB and FPGA is tons of work, and porting library from other micro-controllers as mentioned in [this](http://www.cypress.com/forum/psoc-3-architecture/adding-ethernet-psoc35-design) thread is possible, but potentially will cost a lot of CPU time.**  

So right now, I only implement the baseline CAN-over-power interface in the power module design.  

## Choose accelerometer  
There is always trade off when picking up IC/sensor. In this design, the trade off consists of price, bandwidth, precision and axis.  

| Name    | BW   | Comm    | Axis    | Noise    | g-range          | Price  |
|---------|------|---------|---------|----------|------------------|-------:|
| ADXL001 | 22K  | Analog  | x       | 4mg/rtHZ | 250g, 500g, 700g | $13.29 |
| ADXL350 | 1.6K | digital | x, y, z | 1 LSB    | 1g, 2g, 4g, 8g   | $4.57  |

  

ADXL001 analog accelerometer has incredible high bandwidth to 22KHz, but the downside is that it has relatively low precision and it only have one x-axis. Also, this analog accelerometer has very high g-range(lowest to 250g), which means is has low resolution, comparing to the ADXL350. In order to simplify the first version design and confirming the feasibility, I picked ADXL350.  

## Design (Will be updated shortly)

### Top design  
![Vibration tester version 1 schematic]({{ site.baseurl }}/images/UAV/vibration_tester/vibration_sch.png) 

### PSoC 4200M Design  
![PSoC 4200M schematic]({{ site.baseurl }}/images/UAV/vibration_tester/psoc4200m_sch.png)  

### 3v3 LDO Design  
![3v3 LDO schematic]({{ site.baseurl }}/images/UAV/vibration_tester/3v3_sch.png)   

## Layout
![Vibration tester version 2 schematic]({{ site.baseurl }}/images/UAV/vibration_tester/vibration_pcb.png)  


---
*Last update: Nov.20 2016*  
*Last update: Nov.19 2016*