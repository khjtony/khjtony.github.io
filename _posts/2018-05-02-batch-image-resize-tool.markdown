---
title: Batch Image Resize Tool
date: 2018-05-02 22:51:10
last_update: 20180502
categories: Project
project: MISC
---

## Post Overview
>* Introduction
>* How it works
>* Code

## Introduction
Loading images on my website is very slow. I found that.   
Partially because the website is hosted behind multiple layers
of networks, but the main reason is that I am lazy to manually resize every image every time. This website used to be 
hosted on the github.io, so bandwidth is more than enough, but now it is not the truth.  
So today I wrote a simple script
to resize all images down to the size that width equals to 1280. At this moment, image formats are reserved. If necessary 
I may convert all jps images to jpg.

## Tools used  
1. Python
2. Opencv 

## How it works: 
1. Read all images files using [**os.walk()**](https://docs.python.org/3/library/os.html) function.
2. Using OpenCV to open the image
3. If image size is larger than 1280xheight, resize the image and replace it with original image file.
4. Sync server.

## Code: 
```python
import os
import sys
sys.path.insert(0, '/usr/local/lib/python3.5/dist-packages/')       # walkaround of python3 support in ROS
import cv2


file_path = '../public'     # set workspace directory to public 
file_exts = ['jpg', 'JPG', 'png']

def walk_file(path, extend_list):       # find all files that satisfy extension list
    file_list = []
    for root, dirs, files in os.walk(path):
        for name in files:
            if name.split('.')[-1] in extend_list:
                file_list.append(os.path.join(root, name))
    return file_list

if __name__ == "__main__":
    file_list = walk_file(file_path, file_exts)
    for file in file_list:
        img = cv2.imread(file)
        if (img.shape[1] > 1280):       # if width > 1280, resize
            factor = 1280.0 / img.shape[1]
            resize_img = cv2.resize(img, None, fx=factor, fy=factor)
            cv2.imwrite(file, resize_img)
            print("image: " + file + " has been written, size factor: " + str(factor) + " new width:" + str(resize_img.shape[1]))
```
 
 

--- 
*Last update: May.2.2018*
