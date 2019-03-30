#!/usr/bin/env python

import sys

# ---------------------------------------------------------------
# This reducer code will input a line of text and 
#    output <word, total-count>
# cat ./input/test* | ./wordcount_mapper.py | sort | ./wordcount_reducer.py
# ---------------------------------------------------------------

last_key = None 
running_total = 0

# Loop thru file
for input_line in sys.stdin:
    input_line = input_line.strip()

    # Get Next Word  
    this_key, value = input_line.split("\t", 1)  
    value = int(value)           

    # Key Check part
    #    if this current key is same as the last one Consolidate
    #    otherwise  Emit
    if last_key == this_key:   
        running_total += value   # add value to running total
    else:
        if last_key: 
            print( "{0}\t{1}".format(last_key, running_total) )

        running_total = value  
        last_key = this_key

#print last line
if last_key == this_key:
    print( "{0}\t{1}".format(last_key, running_total)) 