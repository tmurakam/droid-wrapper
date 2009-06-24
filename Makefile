DESTDIR=/usr/local

all:

install:
	install -d ${DESTDIR}/bin
	/bin/cp droid-gcc ${DESTDIR}/bin/droid-gcc
	-/bin/rm ${DESTDIR}/bin/droid-ld
	/bin/ln -s droid-gcc ${DESTDIR}/bin/droid-ld
	-/bin/rm ${DESTDIR}/bin/droid-g++
	/bin/ln -s droid-gcc ${DESTDIR}/bin/droid-g++

package:
	tar cvzf droid-wrapper.tar.gz droid-gcc Makefile

