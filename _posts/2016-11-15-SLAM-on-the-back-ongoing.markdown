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

1. [Turtlebot for ROS](http://wiki.ros.org/turtlebot_navigation/  
Tutorials/Build%20a%20map%20with%20SLAM)   
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



I will create such demo based on ROS gmapping package, and according to the [gmapping tutorial page](http://wiki.ros.org/slam_gmapping/Tutorials/MappingFromLoggedData), we can use the following command to start gmapping_slam script.  
```
rosrun gmapping slam_gmapping scan:=base_scan
``` 

Then I execute rviz to visualize the data:  
```
rosrun rviz rviz
``` 

After having rviz executed, I added map to the monitor list
![SLAM]({{site.baseurl}}/images/UAV/slam_on_back/rviz_blank.png)

### Topics that we need for gmapping_slam
Nothing appeared, but I am already satisfied by no error poped up. No information feeded in , no mapping generated out. So let me read ROS Gmapping documents to see what it requires.
[gmapping document page](http://wiki.ros.org/gmapping)
I found that it only subscribe two topics:  
```
Subscribed Topics

tf (tf/tfMessage) 
	Transforms necessary to relate frames for laser, base, and odometry (see below) 
scan (sensor_msgs/LaserScan) 
	Laser scans to create the map from 
``` 

Then check topic definition of tf and scan:
#### topic: [tf](https://mirror.umd.edu/roswiki/doc/diamondback/api/geometry_msgs/html/msg/TransformStamped.html)  
``` 
Header header
    uint32 seq
    time stamp
    string frame_id
string child_frame_id
Transform transform
    geometry_msgs/Vector3 translation
        float64 x
        float64 y
        float64 z
    geometry_msgs/Quaternion rotation
        float64 x
        float64 y
        float64 z
        float64 w
```

#### topic [sensor_msgs/LaserScan](http://docs.ros.org/api/sensor_msgs/html/msg/LaserScan.html)
```
# Single scan from a planar laser range-finder
#
# If you have another ranging device with different behavior (e.g. a sonar
# array), please find or create a different message, since applications
# will make fairly laser-specific assumptions about this data

Header header            # timestamp in the header is the acquisition time of 
                         # the first ray in the scan.
                         #
                         # in frame frame_id, angles are measured around 
                         # the positive Z axis (counterclockwise, if Z is up)
                         # with zero angle being forward along the x axis
                         
float32 angle_min        # start angle of the scan [rad]
float32 angle_max        # end angle of the scan [rad]
float32 angle_increment  # angular distance between measurements [rad]

float32 time_increment   # time between measurements [seconds] - if your scanner
                         # is moving, this will be used in interpolating position
                         # of 3d points
float32 scan_time        # time between scans [seconds]

float32 range_min        # minimum range value [m]
float32 range_max        # maximum range value [m]

float32[] ranges         # range data [m] (Note: values < range_min or > range_max should be discarded)
float32[] intensities    # intensity data [device-specific units].  If your
                         # device does not provide intensities, please leave
                         # the array empty.
```

The Lidar I used, RPLidar V2, provides nice API/SDK, so I can just us its API to publish scan information. Actually, API/SDK provides a demo software:

![SLAM]({{site.baseurl}}/images/UAV/slam_on_back/rp2_rviz.png)

**NOTICE** if rplidar sdk/api reminds "cannot bind usb port" error, that is because your current user does not have permission to use ttyUSBx port. Usually you can use sudo, but since ROS is installed for user, you can execute the following command to add user to dialout usergroup:  
```
sudo adduser $USER dialout
```  

The problem is tf topic. In case that we will mount Lidar on the back (or in hand), how do we know my current position? I do have several 9-axis sensors, so I need to estimate my position by using some technology.

*BTW, I strongly recommand BNO055, 9-axis motion sensor from Bosch, which has a cortex-M0 inside, and just output filtered and converted data ready to use.*

By some googling, I can use [robot_localization](http://docs.ros.org/kinetic/api/robot_localization/html/) package from ROS.
It seems like this package is not straight forward, but I will look into it. Nevertheless, I can write my own estimator. 

### Prepare location estimator
[ROSCON 2015](https://vimeo.com/142624091)

This is quick start video about robot_localization on ROSCON conference. It provides important feature and configuration samples.
Though I am still not sure about different frames (base_link, odom, map), I can feed necessary data into base_link frame to see if this node can give me estimated location/position.

#### REP 103 & REP 105
REP referes to Ros Enhancement Proposal, it contains group of suggestions and cenventions that making different developers have "the same tone".  
[REP 103](http://www.ros.org/reps/rep-0103.html) proposes **Standard Units of Measure and Coordinate Conventions**  
[REP 105](http://www.ros.org/reps/rep-0105.html) proposes **Coordinate Frames for Mobile Platforms**  



## Next step: SLAM on the vehicle

---
*Last update: Nov.17 2016*

*Last update: Nov.16 2016*
