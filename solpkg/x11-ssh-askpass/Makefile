# $Id: Makefile,v 1.5 2002/11/30 19:16:45 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		xsshask
PACKAGE_VERSION =	1.2.4.1

PACKAGE_DESCRIPTION =	x11-ssh-askpass
PACKAGE_CATEGORY =	utility

PACKAGE_SOURCE_NAME =	x11-ssh-askpass-${PACKAGE_VERSION}

BUILD_MAKE_ARGS +=	CCOPTIONS=""

INSTALL_LIBEXECDIR =	${INSTALL_LIBDIR}/ssh

pre-fake:
	mkdir -p ${FAKE_DIRECTORY}/usr/openwin/lib/X11
	cd ${FAKE_DIRECTORY}/usr/openwin/lib/X11 && \
		mkdir ../app-defaults && \
		ln -s ../app-defaults

post-configure:
	cd ${WORK_SOURCE} && xmkmf && make includes

