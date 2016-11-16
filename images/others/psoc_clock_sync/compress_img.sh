#!/bin/bash
size_ratio=$1
quality=$2
file=$3
mogrify -format png -resize $size_ratio% -quality $quality $file


