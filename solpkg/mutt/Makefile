# $Id: Makefile,v 1.3 2002/11/30 19:13:36 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		mutt
PACKAGE_VERSION =	1.4
DIST_FILES =		${PACKAGE_SOURCE_NAME}i.tar.gz

PACKAGE_DESCRIPTION =	mutt
PACKAGE_CATEGORY =	utility

CONFIGURE_ARGS +=	--includedir=/nonexistent --enable-pop --enable-imap \
			--with-docdir=${INSTALL_PREFIX}/share/doc/mutt
FAKE_DEST_VAR =

