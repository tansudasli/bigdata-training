#!/usr/bin/env python   
#the above just indicates to use python to intepret this file

# ---------------------------------------------------------------
#This mapper code will input a line of text and output <word, 1>
# python3 wordcount_mapper.py "line" or
# cat ./input/test* | ./mapper.py
# a     1
# a     1
# far   1
# ago   1
# ---------------------------------------------------------------

import sys            

for line in sys.stdin:  

    line = line.strip()  
    keys = line.split() 
     
    for key in keys: 
        value = 1        
        print('{0}\t{1}'.format(key, value) ) 

#hadoop wait tabbed data
