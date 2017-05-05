import argparse


# # parser.add_argument('-f', action="store_true", default=False)
# # parser.add_argument('-b', action="store", dest="b")
# parser.add_argument('-c', action="store", dest="c", type=int)
# parser.add_argument('--noarg', action="store_true", default=False)
# parser.add_argument('--witharg', action="store", dest="witharg")
# parser.add_argument('--witharg2', action="store", dest="witharg2", type=int)

# # # Non-optionnal args
# # parser.add_argument('count', action="store", type=int)
# # parser.add_argument('units', action="store")

# # Examples 
# parser.add_argument('-s', action='store', dest='simple_value',
#                     help='Store a simple value')

# # parser.add_argument('-c', action='store_const', dest='constant_value',
# #                     const='value-to-store',
# #                     help='Store a constant value')

# parser.add_argument('-t', action='store_true', default=False,
#                     dest='boolean_switch',
#                     help='Set a switch to true')
# parser.add_argument('-f', action='store_false', default=False,
#                     dest='boolean_switch',
#                     help='Set a switch to false')

# # parser.add_argument('-a', action='append', dest='collection',
# #                     default=[],
# #                     help='Add repeated values to a list',
# #                     )

# parser.add_argument('-A', action='append_const', dest='const_collection',
#                     const='value-1-to-append',
#                     default=[],
#                     help='Add different values to list')
# parser.add_argument('-B', action='append_const', dest='const_collection',
#                     const='value-2-to-append',
#                     help='Add different values to list')

# parser.add_argument('--version', action='version', version='%(prog)s 1.0')

# # Exclusive Options
# group = parser.add_mutually_exclusive_group()
# group.add_argument('-a', action='store_true')
# group.add_argument('-b', action='store_true')


# print args.c

# --------------------------------------------------------------------------------


def lss(extensions, fullpath, recursive, rvPlay, missing_frames, path_list):
    """
    Main Core
    """
    if extensions:
        print extensions
    if fullpath:
        print fullpath
    if recursive:
        print recursive
    if rvPlay:
        print rvPlay
    if missing_frames:
        print missing_frames
    if path_list:
        for elem in path_list:
            print elem



def lss_parser_options():
    """
    Command options for lss
    """

    parser = argparse.ArgumentParser(description='LSS: LiSt Sequences tool')

    # Parsing Options
    parser.add_argument('-r', '--recursive',
                        action  = 'store_true',
                        default = False,
                        dest    = 'recursive',
                        help    = 'recursive search. search into subdirectories')

    parser.add_argument('-d', '--depth',
                        action  = 'store',
                        default = 2,
                        type    = int,
                        dest    = 'max_depth',
                        help    = 'max depth level for subdirectories.\
                                    requires -r option.')

    parser.add_argument('--path', 
                        action  = 'append',
                        nargs   = '*',
                        default = [],
                        dest    = 'path_list',
                        help    = 'list of paths to search for sequences. \
                                    Ex:  --path /shows/dwn/vj/0060  /shows/got7 \
                                    ~/Documents')

    parser.add_argument('-e', '--extension', 
                        action  = 'append',
                        nargs   = '*',
                        default = [],
                        dest    = 'extensions',
                        help    = 'List of extensions to search for. \
                                    Ex:  -e exr  jpg  tif')

    # Print Options
    parser.add_argument('-f', '--fullpath', 
                        action  = 'store_true',
                        default = False,
                        dest    = 'fullpath',
                        help    = 'pint the fullpath')

    parser.add_argument('-p', '--play', 
                        action  = 'store_true',
                        default = False,
                        dest    = 'rvPlay',
                        help    = 'print a Play command for RV')

    parser.add_argument('-m', '--missing-frames', 
                        action  = 'store_true',
                        default = False,
                        dest    = 'missingFrames',
                        help    = 'print the missing frames')

    parser.add_argument('-s', '--search',
                        action  = 'store',
                        nargs   = '*',
                        default = False,
                        dest    = 'search',
                        help    = 'list of words to look for in the image name. \
                                Ex: -s beauty  indirect_specular')
    
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

if __name__ == "__main__" :
    args = lss_parser_options()

    lss(args.extensions, args.fullpath, args.recursive, args.rvPlay, args.missingFrames, args.path_list)


