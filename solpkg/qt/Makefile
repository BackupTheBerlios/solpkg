# $Id: Makefile,v 1.2 2004/08/13 17:53:59 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		qt
PACKAGE_VERSION =	3.3.2

PACKAGE_SOURCE_NAME =	qt-x11-free-${PACKAGE_VERSION}

PACKAGE_DESCRIPTION =	QT
PACKAGE_CATEGORY =	system

CONFIGURE_ARGS =	-prefix '${INSTALL_PREFIX}' \
			-datadir '${INSTALL_LIBDIR}/qt' \
			-docdir '${INSTALL_SHAREDIR}/doc/qt' \
			-headerdir '${INSTALL_INCLUDEDIR}' \
			-plugindir '${INSTALL_LIBDIR}/qt/plugins' \
			-thread -platform solaris-g++ ${EXTRA_CONFIGURE_ARGS}

# To compile PostgreSQL support, uncomment the following line or supply it
# on the make command line
#EXTRA_CONFIGURE_ARGS =	-I/usr/lib/postgres/include \
#			-I/usr/lib/postgres/include/server -plugin-sql-psql

FAKE_MAKE_ARGS =	INSTALL_ROOT=${FAKE_DIRECTORY}
FAKE_MAKE_ENV =	

