---
title: Test DWM1000 UWB mdoule with Arduino
date: 2015-05-15 10:00:00
categories: Project
project: AR
---

## Post overview
>* Introduction
>* Testing process
>* Results
>* Links

### Introduction
In my 2016 year project plan, the most important one is mid-range positioning system. In this project, I need to locate users either by laser or by RF. DWM1000, a UWB module from Decawave company, is just what I need.

![DWM1000 module]({{ site.baseurl }}/images/AugmentReality/DWM1000.png)  
_(Thanks to [image source](http://media.digikey.com/Photos/Decawave%20Limited/DWM1000.JPG))_

Actually, this module is initially designed as a transceiver for communication. However, thanks to high frequency (~3.5GHz to ~6.5GHz), this chip (DW1000) has enough timing resolution for in-door locating purpose. According to the product sheet, this chip _"Allows the location of objects in real time location systems (TLS) to a precision of 10 cm indoors "_

In order to validate the feasibility of DW1000 chip, I used Arduino and DWM1000 module to test if it works.

### Testing process

#### Preparing adapter board
I used a milling machine to etch two adapter boards for DWM1000 modules, which made the connection easier and more reliable.
![DWM1000 adapter]({{ site.baseurl }}/images/AugmentReality/DWM1000Adapter.png)  
![DWM1000 adapter]({{ site.baseurl }}/images/AugmentReality/DWM1000AdapterFinish.png)  

#### Preparing Arduino
Fortuantely, **thotro** has create fantastic Arduino Library for DWM1000 module on github: [DWM1000-Arduino](https://github.com/thotro/arduino-dw1000)
Thanks to [**Thotro**](https://github.com/thotro) !
Positioning system uses two way ranging method, which is specified in application note [APS013](http://www.decawave.com/support), and screen shot below shows that, two way ranging methos is based on timing.
![DW1000 TWR]({{ site.baseurl }}/images/AugmentReality/DW1000TWR.png) 

#### Testing setup

![DWM1000 tag]({{ site.baseurl }}/images/AugmentReality/firstTest_left.png) 

This is tag node, whcih powered by a mobile power, and put on my bed.

![DWM1000 Anchor]({{ site.baseurl }}/images/AugmentReality/firstTest_right.png) 

This is anchor, which reads the actual distance and show it on the laptop.
There is no block or wall between two nodes, and there is no other engaged DWM1000 module in the range.

### Result
According to the screen shot, we can see that, Achor node continuously reads the range with ~(+-)0.2m error, which is greater then I expected. This out-bound error may caused by limit performance of Arduino. I dont have detailed research on it, so please feel free to email me if I am wrong.

![DWM1000 tag]({{ site.baseurl }}/images/AugmentReality/DWM1000_result.png) 

### Links
[Decawave Inc.](http://www.decawave.com)

[DWM1000-Arduino](https://github.com/thotro/arduino-dw1000)

[github: **Thotro**](https://github.com/thotro) 

[DWM1000 Tag sample code](https://github.com/thotro/arduino-dw1000/blob/master/examples/RangingTag/RangingTag.ino)


