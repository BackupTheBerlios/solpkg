# $Id: Makefile,v 1.6 2004/08/13 17:48:28 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		gcc
PACKAGE_VERSION =	3.3.4

PACKAGE_DESCRIPTION =	GNU Compiler Collection
PACKAGE_CATEGORY =	system

DIST_FILES =		${PACKAGE_NAME}-${PACKAGE_VERSION}.tar.gz

# Java support will conflict with Sun Java tools
CONFIGURE_ARGS +=	--enable-languages=c,c++,f77,objc
CONFIGURE_ENV =
# Separate build is required, or the build will die
CONFIGURE_TARGET =	do-configure-separate

BUILD_MAKE_ARGS =	CFLAGS='-O' LIBCFLAGS='-g -O2' \
			LIBCXXFLAGS='-g -O2 -fno-implicit-templates'
BUILD_MAKE_ENV =
BUILD_MAKE_TARGET =	bootstrap
# gmake is required, or the build will die in the testsuite
MAKE_PROGRAM =		gmake

FAKE_DEST_VAR =

