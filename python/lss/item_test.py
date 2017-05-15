#!/usr/bin/python

import sys
import os, os.path
import logging

__version__ = "0.1"

# Logging handlers
log = logging.getLogger("lss")


class Item(object):

    def __init__(self, item):
        self._path       = os.path.abspath(str(item)) 
        self.exists()
        self._dirname,  \
        self._filename  = os.path.split(self._path)
        self.tail       = ""
        self.revision   = ""
        self.rev_int    = ""
        self.digit      = ""
        self.dig_int    = ""
        self.padding    = ""
        self.extension  = ""
        # self._size      = None
        self.resumable  = ""
        self.stereo     = ""
        self.eye        = ""
        self.mtime      = ""
        self.ctime      = ""
        self.colorspace = ""
        self.resolution = ""
        self._stat      = None

    def __str__(self):
        return str(self.filename)

    def __repr__(self):
        return str(self)

    def exists(self):
        """Return True/False if the file exists
        """
        exists = os.path.isfile(self._path)
        if exists:
            self._isfile = True
        else: 
            print (self._path + " is not a file.")
            # print ({} + " is not a file.").refomat(self._path)
            sys.exit(0)

    @property
    def path(self):
        """Return absolutepath of item
        """
        return self._path

    @property
    def dirname(self):
        """Item directory name
        """
        return self._dirname

    @property
    def filename(self):
        """Item name
        """
        return self._filename

    @property
    def stat(self):
        """Return os.stat object for this file
        """
        if self._stat is None:
            self._stat = os.stat(self.path)
        return self._stat

    @property
    def size(self):
        """Return size of the Item
        """
        return self.stat.st_size

    @property
    def isfile(self):
        """Return True/False based on exists func in init
        """
        return self._isfile

if __name__ == "__main__":
    print "Go"
    item = Item(sys.argv[1])
    print item.size
    print item.dirname
    print item.filename
    print item.isfile
