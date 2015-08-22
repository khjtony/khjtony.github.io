---
title: Test DWM1000 UWB mdoule with Arduino
date: 2015-05-15 10:00:00
categories: Project
---

## Post overview
>* Introduction
>* Testing process
>* Results
>* Links

### Introduction
In my 2016 year project plan, the most important one is mid-range positioning system. In this project, I need to locate users either by laser or by RF. DWM1000, a UWB module from Decawave company, is just what I need.

![DWM1000 module]({{ site.baseurl }}/images/Heimdall/DWM1000.png)  
_(Thanks to [image source](http://media.digikey.com/Photos/Decawave%20Limited/DWM1000.JPG))_

Actually, this module is initially designed as a transceiver for communication. However, thanks to high frequency (~3.5GHz to ~6.5GHz), this chip (DW1000) has enough timing resolution for in-door locating purpose. According to the product sheet, this chip _"Allows the location of objects in real time location systems (TLS) to a precision of 10 cm indoors "_