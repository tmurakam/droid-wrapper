VERSION = 1.0.0

DESTDIR = /usr/local

all:

install:
	install -d ${DESTDIR}/bin
	install droid-gcc ${DESTDIR}/bin/droid-gcc
	-/bin/rm ${DESTDIR}/bin/droid-ld
	/bin/ln -s droid-gcc ${DESTDIR}/bin/droid-ld
	-/bin/rm ${DESTDIR}/bin/droid-g++
	/bin/ln -s droid-gcc ${DESTDIR}/bin/droid-g++

package:
	@-/bin/rm -rf droid-wrapper-${VERSION}
	mkdir droid-wrapper-${VERSION}
	cp droid-gcc Makefile \
	  README README.ja INSTALL AUTHORS COPYING ChangeLog \
	  droid-wrapper-${VERSION}/
	tar cvzf droid-wrapper-${VERSION}.tar.gz droid-wrapper-${VERSION}


