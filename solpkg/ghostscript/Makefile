# $Id: Makefile,v 1.2 2004/09/30 12:38:10 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		ghostsc
PACKAGE_VERSION =	8.01

PACKAGE_DESCRIPTION =	Ghostscript
PACKAGE_CATEGORY =	utility

PACKAGE_SOURCE_NAME =	ghostscript-${PACKAGE_VERSION}
DIST_FILES +=		gnu-gs-fonts-std-6.0.tar.gz \
			gnu-gs-fonts-other-6.0.tar.gz

CFLAGS +=		-I/usr/sfw/include
CONFIGURE_ENV +=	LDFLAGS="-L/usr/sfw/lib"
BUILD_MAKE_ARGS +=	XLDFLAGS="-L/usr/sfw/lib -R/usr/sfw/lib"

post-fake:
	mkdir -p ${FAKE_DIRECTORY}${INSTALL_SHAREDIR}/ghostscript/fonts
	cd ${FAKE_DIRECTORY}${INSTALL_SHAREDIR}/ghostscript/fonts && \
		cp ${WORK_DIRECTORY}/fonts/* . && \
		chown 0:0 *

post-prototype:
	cp ${RECIPE_DIRECTORY}/depend ${FAKE_DIRECTORY}
	echo i depend >> ${FAKE_DIRECTORY}/Prototype

