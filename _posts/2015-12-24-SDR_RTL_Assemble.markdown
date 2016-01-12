---
title: Cheap RTL-SDR hands on
date: 2015-12-24 20:30:49
categories: Project
project: IAC_Heron
---

![RTL-SDR]({{ site.baseurl }}/images/IAC_Heron/SDR/SDR_banner.png)

## Post overview
>* What is RTL-SDR
>* Assemble
>* Test
>* What I can do


## What is SDR
SDR refers to *Software Defined Radio*, and it is a versatile way to receive wide band RF signal. Usually the SDR products are just receivers and can not transmit.

RTL-SDR referes to RTL2832U chip based SDR, which is a budget-friendly SDR solution for entry level people, like me. Also, RTL-SDR has many "edition", and the most famous one may be the kit designed by BA5SBA, who extend the reseive band from VHF to HF~VHF, then you dont need upconverter to receive HF band signal.

## Assemble
It took me 3 hours to assemble the kit. Not because how hard it is, but soldering tiny wires really takes a lot of time.

Here is a link I found that is helpful:
[BA5SBA RTL-SDR](http://rtlsdrblog.rtlsdrblog.netdna-cdn.com/wp-content/uploads/2015/07/rtl-sdr-diy-kits-installation-instructions.pdf)

If you have problem in step 9, here is hint:
The purpose of two fly wires is connecting the side capacitor with the power/VCC, so two wires are soldered on the pins of regulators on the both sides.


## Test
![900MHz and 100MHz antennas]({{ site.baseurl }}/images/IAC_Heron/SDR/antennas.png)

I have a 900MHz(From my XBee Pro 900MHz) and a ~100MHz(came with RTL-SDR) antenna that can be used with RTL-SDR.

(Test has been done, but this page is pending for update)

## What I can do
One of the most amazing application is receiving NOAA satellite images. 

**[Receiving NOAA Weather satellite Images](http://www.rtl-sdr.com/rtl-sdr-tutorial-receiving-noaa-weather-satellite-images/)**

Four of the NOAA satellites broadcast Automatic Picture Transmission in analog signal on 137MHz band, which is just within the best receive band of SDR, and I can receive such picture where ever I go on my car, with a circularly polarized antenna.



### License
* [MIT](http://opensource.org/licenses/MIT)

