# $Id: Makefile,v 1.2 2003/09/17 14:32:35 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		fetchmail
PACKAGE_VERSION =	6.2.4

PACKAGE_DESCRIPTION =	fetchmail
PACKAGE_CATEGORY =	utility

CONFIGURE_ENV +=	CPFLAGS="-I/usr/lib/openssl/include"
CONFIGURE_ARGS +=	--disable-nls --enable-NTLM --with-ssl=/usr/lib
FAKE_DEST_VAR =

