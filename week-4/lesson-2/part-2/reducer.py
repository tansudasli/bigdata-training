#!/usr/bin/env python
import sys

# the aim is format input files into tabbed format , which is must for hadoop!
# after <cat join1_File*.txt | ./mapper.py> , below lines combined into 1 
#          tv-show,counter     
#          tv-show,channel     
# we need to format them as tabbed format for hadoop

line_cnt           = 0  #count input lines

for line in sys.stdin:
    line       = line.strip()       #strip out carriage return
    key_value  = line.split('\t')   #split line, into key and value, returns a list
    line_cnt   = line_cnt+1     

    #note: for simple debugging use print statements, ie:  
    curr_word  = key_value[0]         #key is first item in list, indexed by 0
    value_in   = key_value[1]         #value is 2nd item

 