---
title: Deliver Robot MK0
date: 2016-11-23 00:50:43
last_update: 20170313
categories: Project
project: DeliverVehicle

---

![demo_banner]({{ site.baseurl }}/images/DeliverVehicle/demo_vehicle_banner.png)

>* Introduction
>* System introduction
>* Development schedule/roadmap
>* Market survey
>* Possible risks and problems
>* Next step

## Introduction
The (large population) of students bring our campus a serious problem: extremely long line on the checkout window during the lunch time. It is unacceptable for me to spend over 30 minutes in the line for a 6 dollars meal. This line is not only exist during the peak periods, but also the valley periods. According to my interviews, many students are looking for snacks and coffee afternoon or even 9pm, but they eventually give up this nice idea either due to the long waiting time or simply being far away from the food center. Here is the idea:  
**Food deliver robot**.

## System introduction  
The food deliver robot can be divided into two parts: service platform on the cloud and deliver robot itself. The service process can be explained in the following example:  
1. 9:30am: I start to worry about my lunch. I have my data-structure lecture ended at 11:50am and I will have my embedded system lecture started at 12:10pm. 20 minutes in between is absolutely not enough for a lunch, but solution is available. I put order for a sandwich meal and arrange deliver time at 11:55am near the front door of data-structure lecture room.
2. 9:31am: Carols Jr received my order, but they will not start my order until 11:20am. 
1. 11:25am: Mr. Chris put my bag in the locker on the top of deliver robot, as well as others' food.
1. 11:45am: Deliver robot was dispatched and rolling on the road. It is rolling on the pedestrian road and side road but not the automotive road.
1. 11:55am: Deliver robot arrived the lobby of my hall, but I am still in the lecture room.
1. 11:49am: I know that the robot will wait for at most 5 minutes, so I escaped delayed lecture, scanned bar-code in the order confirmation email, and get my order from the deliver robot.
1. 11:50am: Deliver robot dispatched again, and I have more than 15 minutes to enjoy my lunch.  

## Development schedule/roadmap 
<iframe frameborder="0" style="width:100%;height:714px;" src="https://www.draw.io/?lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=deliver_robot#Uhttps%3A%2F%2Fdrive.google.com%2Fuc%3Fid%3D0BwNgzpaDUeYWSHRmZW5OTWlGRlk%26export%3Ddownload"></iframe>

The development will have three milestones or three stages: MK0, MK1 and MK2.  
Green parts refer to finished goals, and white parts represent future goals.  
MK0 is validation study, and I will exam all the technical critical points either in prototype design or in the simulation. As shown in the schedule/roadmap, I will push the project from three ways: software, hardware and auto-pilot. Green node means the topic that I have done, and pink node means the topics on-going. 

## Market Survey  
Before we start the developing, this time I did a market survey on the first hand in order to use consumers' expectation to refine our design. 
*I understand that this survey may have bias and may not be convincing enough. I am more than happy to hear about your opinions, ideas, suggestions and critics*  
I asked four students for the following questions:  
1. Do you feel awkward waiting on the line during lunch time?  
1. What is reasonable waiting time in your mind?  
1. Do you often want to buy snacks and drinks but eventually give up due to the line even when it is valley period?  


## Possible risks and challenges

### Moving base  
At very beginning, when we do not have solid design on deliver vehicle design, we will use the off the shelf experimental purpose robot vehicle instead. Though the ideal options would be some ground robot platform including Husky, RP2 and turtlebot which support ROS natively, I will choose a fairly cheap platform and make it compatible with my workspace. 

### Collision avoidance enabled auto-pilot  
Let vehicle follow the GPS waypoints is simple, but in realistic situation, the road is much more complex than in the simulator. Collision avoidance is necessary for the vehicle. In out plan, we will exam several collision avoidance implementations including naive method, SLAM method and neural network autopilot method.  
In practice, the baseline is using SLAM method to passively avoid collision with moving objects like pedestrian and bikes. 

### User-friendly GUI  
This GUI consists of front-end and back-end server. Front-end GUI will be a website that allows users put order and choose deliver time & location. Back-end server will have a deliver robot scheduler and interface/protocol to the business/vendor's system, or just show order information to the sellers. 

---
*Last update: Dec.15 2016*
*Last update: Dec.14 2016*
*Last update: Nov.23 2016*  