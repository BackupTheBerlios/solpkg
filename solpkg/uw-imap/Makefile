# $Id: Makefile,v 1.1 2002/07/26 13:10:19 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		uwimap
PACKAGE_VERSION =	2002.RC2

PACKAGE_SOURCE_NAME =	imap-${PACKAGE_VERSION}
DIST_FILES =		${PACKAGE_SOURCE_NAME}.tar.Z

PACKAGE_DESCRIPTION =	IMAP
PACKAGE_VENDOR =	University of Washington
PACKAGE_CATEGORY =	application

CONFIGURE_TARGET =	null
BUILD_MAKE_TARGET =	gso
FAKE_TARGET =		override-fake

# XXX this recipe currently ignores CFLAGS, gotta fix that

override-fake:
	mkdir -p -m 755 ${FAKE_DIRECTORY}/usr/sbin
	cp ${WORK_SOURCE}/ipopd/ipop2d ${FAKE_DIRECTORY}/usr/sbin/in.ipop2d
	cp ${WORK_SOURCE}/ipopd/ipop3d ${FAKE_DIRECTORY}/usr/sbin/in.ipop3d
	cp ${WORK_SOURCE}/imapd/imapd ${FAKE_DIRECTORY}/usr/sbin/in.imapd
			
