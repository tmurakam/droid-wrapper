Abstract
========

 You need specify *many* options to compile native program for Android.

 Also, it is very hard to port software which uses the autotools
(autoconf, automake, libtool etc) because different options are needed
for linking shared library and program binary.

 To solve these problems, I developed this wrapper script for gcc and
ld. With this wrapper, all needed options are automatically specified.


Install
=======

    $ sudo make install

droid-gcc, droid-g++, and droid-ld commands will be installed.


How to use
==========

Specify following environment variables:

 *  DROID_ROOT : Android source tree directory
 *  DROID_TARGET : Compile target (generic, dream-open etc)
 *  DROID_HOST : Specify build host.
    Use "windows" for Windows, "darwin-x86" for Mac OS X.
    Nothing needed for Linux.
 *  DROID_WRAPPER_DEBUG : Set this for debug the script.

Then use droid-gcc, droid-ld.

    Ex)
    $ droid-gcc -O2 -c foo.c
    $ droid-ld -o foo foo.o

To compile the software with configure:

    $ CC=droid-gcc LD=droid-ld ./configure --host=arm-none-linux-gnueabi


Difference with agcc
====================

This wrapper is similar to http://plausible.org/andy/agcc,
but different in following points:

 *  With this script, all command line arguments will be passed to the
    compiler and linker. This is important for the software uses configure.
 *  This script supports g++ and ld, not only gcc.

----
Takuya Murakami <tmurakam at tmurakam.org>
