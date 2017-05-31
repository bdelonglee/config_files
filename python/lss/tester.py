#!/usr/bin/python
import os
import re
import os.path

a = [0, 50, 100, 150, 200, 250, 300, 350, 400, 500]
# a = [0, 50, 100, 150, 200, 250, 300, 350, 400, 450, 500]

lenght = len(a)

i = 0

steps = list()
stepsDict = dict()

while i < lenght :
    
    j = i+1
    if j>lenght -1:
        break
    curStep = a[j]-a[i]
    steps.append(curStep)
    if stepsDict.has_key(curStep):
        stepsDict[curStep] = stepsDict[curStep]+1
    else :
        stepsDict[curStep] = 1
    i = i+1

stepL = list(set(steps))
print stepL
stepLlenght = len(stepL)

if stepLlenght == 1 :
    print "Step is >>> : "+str(stepL[0])
else :
    res = list(sorted(stepsDict, key=stepsDict.__getitem__, reverse=True))
    stepper = stepsDict[res[0]]
    percent = float(stepper)/lenght
    if percent > 0.7:
        print "Step is >>> "+str(res[0])
    print stepsDict


start = a[0]
missing = list()

for x in xrange(0, 500, 50):
    if not x in a :
        missing.append(x)

print "Missings are >>> "+str(missing)


print "------------------------------------"



####################################################################
####################################################################
####################################################################
#orig = "rs_0020_lig_leisureland_bty_indirect_diffuse_v002_cgs.1145.exr"
## test, ext = os.path.splitext(orig)
#test = "rs_0020_lig_leisureland_bty_indirect_diffuse_cgs.exr"

##rs_0020_lig_leisureland_bty_indirect_diffuse_v002_cgs.####.exr

## digits_re = re.compile(r'\d+')

## PADDING
## need to be striped()
#padding0_re = re.compile('\.\d+\.|\_\d+\.')
#padding1_re = re.compile('\.[0-9]{1,6}\.|\_[0-9]{1,6}\.')
## get last item of list
#paddingL_re = re.compile(r'\d+')

## REVISION
## need to be striped()
#revision_re  = re.compile('\Dv[0-9]{1,3}\D', re.I)

#pad0 = padding0_re.findall(test)
#pad1 = padding1_re.findall(test)
#padL = paddingL_re.findall(test)

#rev  = revision_re.findall(test)

## parts     = digits_re.split(test)


#def _natural_key(x):
#    """ Splits a string into characters and digits.  This helps in sorting file
#    names in a 'natural' way.
#    """
#    return [int(c) if c.isdigit() else c.lower() for c in re.split("(\d+)", x)]

#def _ext_key(x):
#    name, ext = os.path.splitext(x)
#    return [ext] + _natural_key(name)

#print "-----------"
## print "test >> "+test
## print "ext  >> "+ext
#print 

#print "DIGITS"
#print pad0
#print pad1
#print padL
#print rev
#print rev[0][1:-1]
#print
#print "PARTS"
## print parts

#print
## print test.split(digits[-1])
#print 
#a = _ext_key(test)
#print a
## print _natural_key(a)
#print "-----------"


####################################################################
####################################################################
####################################################################
