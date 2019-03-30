#!/usr/bin/env python
import sys

# the aim is format input files into tabbed format , which is must for hadoop!
# cat ./input/join2* | ./mapper.py 
#          tv-show,counter     
#          tv-show,channel     
# we need to format them as tabbed format for hadoop

for line in sys.stdin:
    line       = line.strip()   
    key,value  = line.split(",")   #split line, into key and value, returns a list
   
    if (value == "ABC") or (value.isdigit()):
        print( '%s\t%s' % (key, value) )  
