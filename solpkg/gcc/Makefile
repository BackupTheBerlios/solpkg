# $Id: Makefile,v 1.4 2003/02/05 19:05:34 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		gcc
PACKAGE_VERSION =	2.95.3

PACKAGE_DESCRIPTION =	GNU Compiler Collection
PACKAGE_CATEGORY =	utility

DIST_FILES =		${PACKAGE_NAME}-${PACKAGE_VERSION}.tar.gz

CONFIGURE_ARGS +=	--enable-shared --enable-static --enable-threads
CONFIGURE_ENV =

BUILD_MAKE_ARGS =	CFLAGS='-O' LIBCFLAGS='-g -O2' \
			LIBCXXFLAGS='-g -O2 -fno-implicit-templates'
BUILD_MAKE_ENV =
BUILD_MAKE_TARGET =	bootstrap-lean

