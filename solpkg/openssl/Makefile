# $Id: Makefile,v 1.4 2002/08/12 17:43:54 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		openssl
PACKAGE_VERSION =	0.9.6e

PACKAGE_DESCRIPTION =	OpenSSL
PACKAGE_CATEGORY =	system

CONFIGURE_PROGRAM =	./config
CONFIGURE_ARGS =	--prefix=${INSTALL_PREFIX} \
			--openssldir=/etc/ssl threads shared

FAKE_MAKE_ARGS =	INSTALL_PREFIX=${FAKE_DIRECTORY} \
			MANDIR=${INSTALL_MANDIR}

