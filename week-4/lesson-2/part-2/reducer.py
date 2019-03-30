#!/usr/bin/env python
import sys

# the aim is format input files into tabbed format , which is must for hadoop!
#  cat ./input/join2* | ./mapper.py | sort | ./reducer.py 
#          tv-show,counter     
#          tv-show,channel     
# we need to format them as tabbed format for hadoop
#          channel[], tv-show[] counter
#          channel[], counter

previousTvShow = " "
lineCount = 0 

total = 0
isABC = False

for line in sys.stdin:
    line = line.strip()      
    k,v  = line.split('\t')  

    lineCount += 1  

    if k != previousTvShow:
        if lineCount > 1:
            if isABC:
                print('{0} {1}'.format(previousTvShow, total))

        isABC = False
        total = 0
        previousTvShow = k  

    if v == "ABC":
        isABC = True
    else:
        total += int(v)

#print last line
print('{0} {1}'.format(k,total)) 

 