#!/bin/usr/python

import os, os.path
import sys







if __name__ == "__main__":
    print "abs"
    print os.path.abspath(os.getcwd())
    
    path = os.path.abspath(os.getcwd())

    if "/shows/" in path :
        mode = "shows"
    elif "/ads/" in path :
        mode = "ads"
    else :
        print "No Shows Context"
        sys.exit(0)

    print "ROOT, BRANCH --------------"
    root, branch = path.split(os.path.sep + mode + os.path.sep)
    print root, branch


    branchList = branch.split(os.path.sep)

    context_lenght = len(branchList)
    print "LEN >>> " + str(context_lenght)
    mode = ""
    if context_lenght == 1  :
        print "You're in a project context"
        mode = "project"
        project = branchList[0]
        sys.exit(0)

    elif context_lenght == 2:
        if "_asset" in branchList[1] :
            print "You're in Asset context but no Asset choosed"
            project = branchList[0]
            print project
        else :
            print "You're in a sequence context"
            mode = "sequence"
            sequence = branchList[1]
            project = branchList[0]
            print project
            print sequence

    elif context_lenght >= 3:
        print "You're in a subentity context"
        if "_asset" in branchList[1] :
            print "Asset Context ----------"
            asset    = branchList[2]
            sequence = branchList[1]
            project  = branchList[0]

        elif not "/_" in branchList[1]:
            print "Shot Context --------"
            shot     = branchList[2]
            sequence = branchList[1]
            project  = branchList[0]
