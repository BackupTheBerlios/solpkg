# $Id: Makefile,v 1.5 2002/10/24 01:29:15 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		openssl
PACKAGE_VERSION =	0.9.6g

PACKAGE_DESCRIPTION =	OpenSSL
PACKAGE_CATEGORY =	system

CONFIGURE_PROGRAM =	./config
CONFIGURE_ARGS =	--prefix=${INSTALL_PREFIX} \
			--openssldir=/etc/ssl threads shared

FAKE_MAKE_ARGS =	INSTALL_PREFIX=${FAKE_DIRECTORY} \
			MANDIR=${INSTALL_MANDIR}

