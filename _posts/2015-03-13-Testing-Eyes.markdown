---
title: Naugthyball-Testing eyes
date: 2015-03-13 10:11:16
categories: Project
---
![Ultimaker2]({{ site.baseurl }}/images/NaughtyBall/eyes.png)

## Post overview

>* Basic idea
>* Implementation
>* Test
>* What's next

### Basic idea
Our naughtyball's positioning ability is based on Triangulation method, which is very similiar to our natural eyes: we are seeing an object from eyes, from two positions, and such a tiny difference can be recognized by our brains, then we will know how far the object is.  


#### What is Triangulation method?  
Based on geometry knowledge, we know that if we can know the length of one side and angles of coners both coners, we can calculate the distance between the third point to this side.  
![Triangulation]({{ site.baseurl }}/images/NaughtyBall/triangulation.png)  
_(Thanks to [image source](http://wildernessarena.com/environment/navigation/use-magnetic-compass-triangulation-to-calculate-distance-of-object))_

We will put at least two IR cameras in the ball. After two cameras return the positions which are different, we can calculate the actual distance by using Triangulation method. However, it can be problem for us to know angles directly, because we can only get positions on Cartesian coordinate system, so we need to figure out how to transfer a *(x,y)* position to *(r, θ, φ)* in Spherical coordinate system.

#### A short research  
_will be updated latter_

### Implementation
_will be updated latter_


### Test
_will be updated latter_


### What's next
_will be updated latter_


### License
* [MIT](http://opensource.org/licenses/MIT)

-------------
Our Project: NaughtyBall has reached end of winter quarter 2015, but we will continually work on it until the day it become the one that we like.

