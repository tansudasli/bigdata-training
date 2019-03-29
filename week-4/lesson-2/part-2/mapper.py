#!/usr/bin/env python
import sys

# the aim is format input files into tabbed format , which is must for hadoop!
# after <cat join1_File*.txt | ./mapper.py> , below lines combined into 1 
#          tv-show,counter     
#          tv-show,channel     
# we need to format them as tabbed format for hadoop

for line in sys.stdin:
    line       = line.strip()   
    key_value  = line.split(",")   #split line, into key and value, returns a list


    print( '%s\t%s' % (key_value[0], key_value[1]) )  #print a string tab and string

#Note that Hadoop expects a tab to separate key value
#but this program assumes the input file has a ',' separating key value