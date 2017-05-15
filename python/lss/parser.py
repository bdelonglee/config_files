#!/usr/bin/python

import argparse
import os, os.path, sys


# =================================================================
# SEQUENCE CLASS

class Sequence():
    """
    Sequence Object
    """

    def __init__(self, path):
        self.type             = ""
        self.name             = ""
        self.revision         = ""
        self.padding          = ""
        self.start_frame      = ""
        self.end_frame        = ""
        self.step             = ""
        self.missing_frames   = []
        self.size             = ""

        self.stereo           = False
        self.left_eye         = ""
        self.right_eye        = ""

        self.camera           = ""
        self.show             = ""
        self.sequence         = ""
        self.shot             = ""
        self.department       = ""

        self.software         = ""
        self.colorspace       = ""
        self.source_file      = ""
        self.resolution       = []

        self.resumable        = ""

        self.analyse()

    def analyser(self):
        pass

class Sequence_bundle():
    """
    Group Sequences with AOV
    """
    pass

# =================================================================
def get_path(path_list, recursive, max_depth):
    """
    Return a path list based on input path_list, recursive (on or off) and depth.
    if not return current directory.
    """

    # First: Check the path_list
    safe_list = []
    
    for elem in path_list:
        if not os.path.isdir(elem):
            print "--------------------------"
            print "OPTION --path"
            print elem
            print ">>> Does not exist!"
            print "--------------------------"
            sys.exit(0)
        else:
            elem = elem.rstrip(os.path.sep)

        safe_list.append(elem)
    safe_list.sort()

    # Recursive and Max Depth
    if recursive:
        full_list = []
        for elem in safe_list:
            num_sep = elem.count(os.path.sep)
            for root, dirs, files in os.walk(elem):
                num_sep_this = root.count(os.path.sep)
                if num_sep + max_depth <= num_sep_this:
                    del dirs[:]

                full_list.append(root) 

    # Return
    if not recursive:
        return safe_list
    else :
        full_list.sort()
        return full_list


# =================================================================
def check_extensions(extensions):
    """
    Sanity check for extensions list.
    strip "."
    """

    safe_list = []
    for ext in extensions:
        safeExt = ext.strip('.')
        safe_list.append(safeExt.lower())

    return safe_list


# =================================================================
def lss(recursive, max_depth, path_list, 
        extensions, search,
        fullpath, missing_frames,
        rv_play, statistics, output_file, launch_rv):
    """
    Main Core
    """

    path_list       = get_path(path_list, recursive, max_depth)
    extensions_list = check_extensions(extensions)

    if recursive:
        print 'recursive '
        print recursive
        print '--------------'
    if max_depth:
        print 'max_depth '
        print max_depth
        print '--------------'
    if path_list:
        print 'path_list '
        print path_list
        print '--------------'
    if extensions:
        print 'extensions'
        print extensions_list
        print '--------------'
    if fullpath:
        print 'fullpath'
        print fullpath
        print '--------------'
    if missing_frames:
        print 'missing_frames'
        print missing_frames
        print '--------------'
    if rv_play:
        print 'rv_play'
        print rv_play
        print '--------------'
    if search:
        print 'search'
        print search
        print '--------------'
    if statistics:
        print 'statistics'
        print statistics
        print '--------------'
    if output_file:
        print 'output_file'
        print output_file
        print '--------------'
    if launch_rv:
        print 'launch_rv'
        print launch_rv


# =================================================================
def lss_parser_options():
    """
    Command options for lss
    """

    parser = argparse.ArgumentParser(prog='lss', description='LSS: LiSt Sequences tool')

    # Parsing Options
    parser.add_argument('-r', '--recursive',
                        action  = 'store_true',
                        default = False,
                        dest    = 'recursive',
                        help    = 'Recursive search. search into subdirectories')

    parser.add_argument('-d', '--depth',
                        action  = 'store',
                        default = 2,
                        type    = int,
                        dest    = 'max_depth',
                        help    = 'Max depth level for subdirectories.\
                                    requires -r option. Ex: lss -r -d 4')

    parser.add_argument('--path', 
                        action  = 'append',
                        default = [],
                        dest    = 'path_list',
                        help    = 'Path to search for sequences. Flag can be added multiple times.\
                                    Ex:  --path /shows/dwn/vj/0060  --path /shows/got7 \
                                    --path ~/Documents')

    parser.add_argument('-e', '--extension', 
                        action  = 'append',
                        default = [],
                        dest    = 'extensions',
                        help    = 'Extensions to search for. Flag can be added multiple times.\
                                    Ex:  -e exr  -e jpg  -e tif')

    # Print Options
    parser.add_argument('-f', '--fullpath', 
                        action  = 'store_true',
                        default = False,
                        dest    = 'fullpath',
                        help    = 'Print the fullpath for found sequences.')

    parser.add_argument('-p', '--play', 
                        action  = 'store_true',
                        default = False,
                        dest    = 'rv_play',
                        help    = 'Print a Play command for RV')

    parser.add_argument('-m', '--missing-frames', 
                        action  = 'store_true',
                        default = False,
                        dest    = 'missing_frames',
                        help    = 'Print the missing frames')

    parser.add_argument('-s', '--search',
                        action  = 'append',
                        nargs   = '*',
                        default = [],
                        dest    = 'search',
                        help    = 'list of words to look for in the image name. \
                                You can search for a beauty pass v018 with: \
                                Ex: -s beauty  v018 \
                                If you want to search differents sequences: \
                                Ex: -s beauty v018 -s specular v023 \
                                will search for sequences containing \"beauty\" AND \"v018\" \
                                OR containing \"specular\" AND \"v023\"')
    
    parser.add_argument('--statistics',
                        action  = 'store_true',
                        default = False,
                        dest    = 'statistics',
                        help    = 'Print search stats. Number of files...')

    # Command Options
    parser.add_argument('-o', '--output',
                        action  = 'store',
                        default = False,
                        dest    = 'output_file',
                        help    = 'write output to file. Ex: -o ~/log.txt')

    parser.add_argument('-l', '--launchRv',
                        action  = 'store_true',
                        default = False,
                        dest    = 'launch_rv',
                        help    = 'Launch RV with the result. \
                                To be used with -e, -s options.')


    args = parser.parse_args()
    return args


# =================================================================
if __name__ == "__main__" :
    args = lss_parser_options()

    lss(args.recursive,
        args.max_depth, 
        args.path_list,
        args.extensions,
        args.fullpath,
        args.missing_frames, 
        args.rv_play, 
        args.search,
        args.statistics,
        args.output_file,
        args.launch_rv)


