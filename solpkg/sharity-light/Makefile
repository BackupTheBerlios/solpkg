# $Id: Makefile,v 1.1 2003/10/21 14:11:18 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		shlight
PACKAGE_VERSION =	1.2
PACKAGE_SOURCE_NAME =	Sharity-Light.${PACKAGE_VERSION}

PACKAGE_DESCRIPTION =	Sharity Light
PACKAGE_CATEGORY =	system

CONFIGURE_TARGET =	override-configure

BUILD_MAKE_ENV =
BUILD_MAKE_ARGS =	THE_CC="${CC}"

FAKE_TARGET =		override-fake

override-configure:

override-fake:
	mkdir -p -m 755 ${FAKE_DIRECTORY}${INSTALL_PREFIX}/sbin
	-chgrp bin ${FAKE_DIRECTORY}${INSTALL_PREFIX} \
		${FAKE_DIRECTORY}${INSTALL_PREFIX}/sbin
	cp ${WORK_SOURCE}/shlight \
		${FAKE_DIRECTORY}${INSTALL_PREFIX}/sbin/shlight
	cp ${WORK_SOURCE}/unshlight.sh \
		${FAKE_DIRECTORY}${INSTALL_PREFIX}/sbin/unshlight
	-chown root:bin ${FAKE_DIRECTORY}${INSTALL_PREFIX}/sbin/shlight
	-chown root:bin ${FAKE_DIRECTORY}${INSTALL_PREFIX}/sbin/unshlight
	@make fake-fixup-ownership

