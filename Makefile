VERSION = 1.0.5

DESTDIR = /usr/local

all:

install:
	install -d ${DESTDIR}/bin
	install droid-gcc ${DESTDIR}/bin/droid-gcc
	for cmd in ar as c++ g++ ld nm objcopy objdump ranlib strip; do \
		if [ -f "${DESTDIR}/bin/droid-$$cmd" ]; then \
			/bin/rm ${DESTDIR}/bin/droid-$$cmd; \
		fi; \
		/bin/ln -s droid-gcc "${DESTDIR}/bin/droid-$$cmd"; \
	done

package:
	@-/bin/rm -rf droid-wrapper-${VERSION}
	mkdir droid-wrapper-${VERSION}
	cp droid-gcc Makefile \
	  README README.ja INSTALL AUTHORS COPYING ChangeLog \
	  droid-wrapper-${VERSION}/
	tar cvzf droid-wrapper-${VERSION}.tar.gz droid-wrapper-${VERSION}


