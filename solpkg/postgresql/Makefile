# $Id: Makefile,v 1.1 2003/09/17 14:39:18 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		pgsql
PACKAGE_VERSION =	7.2.4

PACKAGE_SOURCE_NAME =	postgresql-${PACKAGE_VERSION}

PACKAGE_DESCRIPTION =	PostgreSQL
PACKAGE_CATEGORY =	application

INSTALL_DOCDIR =	${INSTALL_SHAREDIR}/doc

CONFIGURE_ARGS =	--prefix='${FAKE_DEST_VAR}${INSTALL_PREFIX}' \
			--includedir='${FAKE_DEST_VAR}${INSTALL_INCLUDEDIR}' \
			--libdir='${FAKE_DEST_VAR}${INSTALL_LIBDIR}' \
			--libexecdir='${FAKE_DEST_VAR}${INSTALL_LIBEXECDIR}' \
			--localstatedir='${FAKE_DEST_VAR}${INSTALL_STATEDIR}' \
			--mandir='${FAKE_DEST_VAR}${INSTALL_MANDIR}' \
			--sysconfdir='${FAKE_DEST_VAR}${INSTALL_ETCDIR}' \
			--docdir='${FAKE_DEST_VAR}${INSTALL_DOCDIR}' \
			--with-CXX

MAKE_PROGRAM =		gmake

INSTALL_INCLUDEDIR =	${INSTALL_LIBDIR}/postgres/include

FAKE_DEST_VAR =
FAKE_MAKE_TARGET +=	install-all-headers

