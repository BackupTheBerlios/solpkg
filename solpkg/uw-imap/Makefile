# $Id: Makefile,v 1.7 2004/08/13 17:55:22 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =          uwimap
PACKAGE_VERSION =       2004

PACKAGE_SOURCE_NAME =   imap-${PACKAGE_VERSION}
DIST_FILES =            ${PACKAGE_SOURCE_NAME}.tar.Z

PACKAGE_DESCRIPTION =   University of Washington IMAP
PACKAGE_CATEGORY =      application

CONFIGURE_TARGET =      null
BUILD_MAKE_TARGET =     gso
FAKE_TARGET =           override-fake

# XXX this recipe currently ignores CFLAGS, gotta fix that

post-extract:
	chmod -R u+w ${WORK_SOURCE}

override-fake:
	mkdir -p -m 755 ${FAKE_DIRECTORY}${INSTALL_PREFIX}/sbin
	-chown root:bin ${FAKE_DIRECTORY}${INSTALL_PREFIX} \
		${FAKE_DIRECTORY}${INSTALL_PREFIX}/sbin
	cp ${WORK_SOURCE}/ipopd/ipop2d \
		${FAKE_DIRECTORY}${INSTALL_PREFIX}/sbin/in.ipop2d
	cp ${WORK_SOURCE}/ipopd/ipop3d \
		${FAKE_DIRECTORY}${INSTALL_PREFIX}/sbin/in.ipop3d
	cp ${WORK_SOURCE}/imapd/imapd \
		${FAKE_DIRECTORY}${INSTALL_PREFIX}/sbin/in.imapd
	-chown root:bin ${FAKE_DIRECTORY}${INSTALL_PREFIX}/sbin/in.ipop2d
	-chown root:bin ${FAKE_DIRECTORY}${INSTALL_PREFIX}/sbin/in.ipop3d
	-chown root:bin ${FAKE_DIRECTORY}${INSTALL_PREFIX}/sbin/in.imapd
	@make fake-fixup-ownership

post-prototype:
	cp ${RECIPE_DIRECTORY}/depend ${FAKE_DIRECTORY}
	echo i depend >> ${FAKE_DIRECTORY}/Prototype

