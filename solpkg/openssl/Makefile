# $Id: Makefile,v 1.3 2002/06/25 18:47:49 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		openssl
PACKAGE_VERSION =	0.9.6d

PACKAGE_DESCRIPTION =	OpenSSL
PACKAGE_VENDOR =	The OpenSSL Project
PACKAGE_CATEGORY =	system

CONFIGURE_PROGRAM =	./config
CONFIGURE_ARGS =	--prefix=${INSTALL_PREFIX} \
			--openssldir=/etc/ssl threads shared

FAKE_MAKE_ARGS =	INSTALL_PREFIX=${FAKE_DIRECTORY} \
			MANDIR=${INSTALL_MANDIR}

