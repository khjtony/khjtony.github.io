---
title: Add external library into Bazel project
date: 2018-12-31 21:23:00
last_update: 20181231
categories: Programming
project: bazel
---

>* Introduction
>* Overview
>* Sample Project
>* Links

## Introduction
Bazel is a building system designed by google, and is widely used as native building system in Google's projects
including Protobuf, glog and etc. However Bazel is optimized for Java-like languages and it emphasized on "packages"
and "modules", so at first glance Bazel is strange, even "weird" to me. Adding external library support becomes a 
"pin point" in the Bazel project, especially when most of the third party software supports CMake but not Bazel.  

In this blog, I will how to add external non-bazel library into a Bazel project.

## Overview
Bazel gives more weights on the package-based design philosophy, so the dependencies are in some logical directories
not physical locations in the hard drive. "cc_library" is the function/command to make the library files into a usable
library object in the bazel world.  

If the library we wanted has bazel support (WORKSPACE file and BUILD files), we can directly add them as a library:  

* [Depending on other Bazel project](https://docs.bazel.build/versions/master/external.html)
```
local_repository(
    name = "coworkers_project",
    path = "/path/to/coworkers-project",
)
```
* Then we can use this library in the **BUILD** file:  
```
cc_binary(
    name = "main",
    srcs = ["main.cc"],
    deps = ["@coworkers_project//:libcoworkers"]
        )
```

However the real project is when we want to import a non-bazel library, for example, **[libzmq](https://github.com/zeromq/libzmq)** in my case.

### Sample Project  
I created a sample project with the following directory structure:  
![directory_tree]({{ site.baseurl }}/images/others/add_external_library_into_bazel/directory_tree.png) 

the directory *third_party/libzmq/zeromq-4.3.0* is extracted directory from libzmq release [zeromq-4.3.0.gz.tar](https://github.com/zeromq/libzmq/releases/download/v4.3.0/zeromq-4.3.0.tar.gz)

### Work Flow
We need to modify three files to add libzmq library:  
![work flow]({{ site.baseurl }}/images/others/add_external_library_into_bazel/add_external_library_into_bazel.png) 

## Codes
### ./WORKSPACE
```
new_local_repository(
    name = "libzmq",
    path = "third_party/libzmq/zeromq-4.3.0",
    build_file = "third_party/libzmq/libzmq.BUILD",
    )
```  
Using ***new\_local\_repository*** is intended here. It would be ideal to have .tar file in the ./third_party/libzmq directory, 
however then we need to use ***new\_http\_archive*** command, and this command does not support ***file://*** URL very well.  

***build_file*** is necessary and important here. ***new\_local\_repository*** only creates reference to an external library, 
and this command requires some script to help compiling and get the library files we need.  

### ./third_party/libzmq/libzmq.BUILD  
```
licenses(["notice"])

package(default_visibility = ["//visibility:public"])

include_files = [
    "include/zmq.h",
    "include/zmq_utils.h",
]

lib_files = [
    "lib/libzmq.a",
]

genrule(
    name = "libzmq-srcs",
    outs = include_files + lib_files,
    cmd = "\n".join([
        'export INSTALL_DIR=$$(pwd)/$(@D)',
        'export TMP_DIR=$$(mktemp -d -t libzmq.XXXXX)',
        'mkdir -p $$TMP_DIR',
        'cp -R $$(pwd)/../../../../../external/libzmq/* $$TMP_DIR',
        'cd $$TMP_DIR',
        'mkdir build',
        'cd build',
        'cmake ../ -DCMAKE_INSTALL_PREFIX=$$INSTALL_DIR',
        'make install',
        'rm -rf $$TMP_DIR',
    ]),
)

cc_library(
    name = "libzmq",
    srcs = lib_files,
    hdrs = include_files,
    includes=["include"],
    linkstatic = 1,
)
```
***include_files*** gives all the necessary .h files from libzmq. Notice that directories used here are relating
to the root directory of install directory. I will explain this in minute.  
***lib_files*** gives all the necessary .a/.so files from libzmq. After compiling, different library files will be 
generated inclding .dylib files in my MacOS, but we only need libzmq.a here.  
***genrule*** has customized commands that essentially executes "cmd" content in bash/sh. 
## Links
