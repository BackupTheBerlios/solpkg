# $Id: Makefile,v 1.1 2002/01/21 13:45:42 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME=		gcc
PACKAGE_VERSION=	2.95.3

PACKAGE_DESCRIPTION=	GNU Compiler Collection
PACKAGE_VENDOR=		Free Software Foundation
PACKAGE_CATEGORY=	utility

DIST_FILES=		${PACKAGE_NAME}-${PACKAGE_VERSION}.tar.gz

CONFIGURE_ARGS+=	--enable-shared --enable-static --enable-threads
CONFIGURE_ENV=

MAKE_BUILD_ARGS=	CFLAGS='-O' LIBCFLAGS='-g -O2' \
			LIBCXXFLAGS='-g -O2 -fno-implicit-templates'
MAKE_BUILD_ENV=
MAKE_BUILD_TARGET=	bootstrap-lean

