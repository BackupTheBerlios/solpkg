# $Id: Makefile,v 1.3 2002/07/08 17:24:35 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		xsshask
PACKAGE_VERSION =	1.2.4.1

PACKAGE_DESCRIPTION =	x11-ssh-askpass
PACKAGE_VENDOR =	Jim Knoble
PACKAGE_CATEGORY =	utility

PACKAGE_SOURCE_NAME =	x11-ssh-askpass-${PACKAGE_VERSION}

BUILD_MAKE_ARGS +=	CCOPTIONS=""

INSTALL_LIBEXECDIR =	${INSTALL_LIBDIR}/ssh

post-configure:
	cd ${WORK_SOURCE} && xmkmf && make includes

