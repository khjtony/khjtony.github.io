---
title: SLAM on the back (ongoing)
date: 2016-11-15 18:35:43
categories: Project
project: UAV
---

![demo_banner]({{ site.baseurl }}/images/UAV/slam_on_back/slam_banner.png)

**New blog update method:** Start from this post, I will use this blog as lab record, and update the post along with my project. 

## Post overview
>* Background


## Background
I am still in the UAV project, and we are in the new stage: Implementing Autopilot.
After final stage of Intel-Cornell cup, I kept thinking about future of UAV. UAV is useful, having lot of potential, true. But UAV *at this moment* UAV is somehow not useful, also true. Concretly, UAV is not clever enough to do many missions.
Autopilot is not defined by "Auto" "pilot", but more broaden idea -- consciousness. Collision avoidance, target following, even much more complex tasks, can be done after the UAV having consciousness of what happened.
The prolog of this consciousness is SLAM.

## Brief of SLAM
SLAM refers to "Simultaneous localization and mapping", early started many years ago, and recently been boosted by rapidly improved computer power.

The basic idea of SLAM is collecting geometry information from evnrionment, ploting point cloud in the computer, and estimate current position (relative). It is independent navigation method that requires no external devices like GPS, UWB, Beacons.

Google tango is a famous example:
<iframe width="480" height="360" src="http://www.youtube.com/embed/Qe10ExwzCqk" frameborder="0" allowfullscreen> </iframe>

Nevertheless the SLAM is intended for navigation, after Neural Network and Machine Learning had become the next hot topic, SLAM will be the best friend of Autopilot/Autodriver, because it provides rich information for envrionment reconstruction. SLAM is eye for the machine brain. 

## Plan
Lucky, SLAM and Autopilot can be developed individually -- they are not parasites to each other. Let me focus on SLAM side first. 
For faster developing and easier debugging purpose, I will deploy SLAM on my ground vehicle first.

![Ground vehicle]({{site.baseurl}}/images/UAV/slam_on_back/vehicle.png)

Before I finish the hardware design (RC router, control interface, etc), a easier way to implement SLAM in practical is the title -- SLAM on the back.
Concretely, I will stick an IMU on my Lidar and keep them in right hand, use my another hand carry the laptop, walking inside the building, making sure that everything is understood(Im sure I can).

I found that interative developing or "agile developing" is useful, though it may take more steps and more time, but usually when I am working on hardware design, it is more likely that I stuck at some point, so I will move small step forward one by one. 

## Milestone 1: Lidar SLAM on turtlebot simulator
Turtlebot simulator is already there, with the least risk bringing the most progress. 
After some research and study, here is what we need, or the road map:
1. [Turtlebot for ROS](http://wiki.ros.org/turtlebot_navigation/Tutorials/Build%20a%20map%20with%20SLAM)
2. [gmapping package for ROS](http://wiki.ros.org/gmapping)
3. [ROS indigo](http://wiki.ros.org/indigo)
4. [Ubuntu 14.04](http://releases.ubuntu.com/14.04/)
5. Gazebo 4

Pause.
Here is the problem. Turtlebot SLAM simulation have not been updated since ROS indigo, and ROS indigo is not compatible with Ubuntu 16.04. So our setup will be:

**Ubuntu14.04+ROS indigo+Gazebo4+Turtlebot SLAM demo**

![SLAM]({{site.baseurl}}/images/UAV/slam_on_back/slam.png)

There is no trival. Every step follows the tutorial.


## Milestone 2: Lidar SLAM on the back
Adding the least amount of hardware, Lidar and IMU, to the system can minimize the uncertainty mucn. At this step I will feed Lidar output and IMU output to the system, looking for ploting and locating myself in the building.

## Next step: SLAM on the vehicle

---
*Last update: Nov.16 2016*