---
title: Hello Jetson! And possible problem
date: 2016-01-30 15:14:10
last_update: 20160130
categories: Project
project: Others
---

![Jetson]({{ site.baseurl }}/images/AugmentReality/jetson/jetson_banner.png)

## Post overview
>* What is Jetson
>* OpenBox
>* Possible problem
>* Test


## What is Jetson
Jetson is embedded system family developed by Nvidia, specially for computer vision and supercomputer application on a credit-card size board.

[Jetson TX1](http://www.nvidia.com/object/jetson-tx1-module.html) is the lastest member in Jetson family released in November 2015, and it has amazing 1 TFLOP/s 256-core Maxwell-architexture GPU and 64-bit ARM A57 CPU. 

I personally use this board for augmental reality project and UAV project.


## Open Box
Been out of stock for about 10 days, this baord finally came to me the last week.
![Before open]({{ site.baseurl }}/images/AugmentReality/jetson/jetson_banner.png)

The package uses high quality tray, making sure that Jetson baord is well protected.

![openbox]({{ site.baseurl }}/images/AugmentReality/jetson/openbox.png)

You can see, Jetson TX1 Development board, a Mean Well power (19V Output) and several USB cords, a pair of antenna are lying in the box.

Connect Full-size HDMI cable, power cable, USB hub and antennas, then press the power button, waiting for booting up.

## Possible problem
I used this board for computer vision purpose, so I need OpenCV and CUDA from [Nvidia Download page](https://developer.nvidia.com/embedded/downloads). During installation, there are few hints that maybe helpful:

* I recommand install CUDA Toolkit and OpenCV from Nvidia. User can always install OpenCV from its official site, but Nvidia's OpenCV is optimized for CUDA, or GPU, which has better performance. 
* Before installating, please enbale "universe" repository by executing "sudo apt-add-repository universe"
* You may be confused about "L4T" version and "Ubuntu" version on the Nvidia Download Page. L4T refers to "Linux for Tegra", which is based on ARM architecture platform, including TX1 and TK1. "Ubuntu" version is for general Ubuntu system on i686/X86-64 architecture. You can always make sure the downloaded files by double check "armhf" or "x86" keywords in file name.

![Remember to add universe repository]({{ site.baseurl }}/images/AugmentReality/jetson/install_problem.png)

## Test
Followed [tutorials](https://developer.nvidia.com/embedded/learn/tutorials) on the Nvidia site, I put my hands on TX1 very quickly.

![Hello Opencv]({{ site.baseurl }}/images/AugmentReality/jetson/helloopencv.png)

And do the Sobel operation on a video clip:
![Sobel Test]({{ site.baseurl }}/images/AugmentReality/jetson/sobelTest.png)


However, when I connected Microsoft Lifecam Studio to TX1 and tried to do the video capture, problem occured.
Sosftware always reminds me that 


```Shell
VIDIOC_REQBUFS: Device or resource busy 
VIDIOC_G_FMT: Bad file descriptor 
Unable to stop the stream.: Device or resource busy*
```
I could successfully  open the camera in booth software, but I cannot require the camera in OpenCV. I though I was missing package.
Unfortuantely till now I have not found solution.




### License
* [MIT](http://opensource.org/licenses/MIT)

