#!/usr/bin/env python

import argparse





def lssParser():

    parser = argparse.ArgumentParser(description='List sequence files and print usefull commands. Check options.')

    parser.add_argument('-r','--rv', help='print RV Play command', default=False, required=False, action="store_true")

    
    print parser.parse_args()





if __name__ == '__main__':
    lssParser()