# $Id: Makefile,v 1.1 2002/01/21 14:59:42 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME=		openssh
PACKAGE_VERSION=	3.0.2p1

PACKAGE_DESCRIPTION=	OpenSSH
PACKAGE_VENDOR=		OpenBSD
PACKAGE_CATEGORY=	utility

DIST_FILES=		${PACKAGE_NAME}-${PACKAGE_VERSION}.tar.gz

CONFIGURE_ARGS=		--prefix=${INSTALL_PREFIX} --sysconfdir=/etc \
			--with-random=/dev/random

# Additional steps for installation

post-fake:
	mkdir -p ${FAKE_DIRECTORY}/etc/init.d
	install ${PORT_DIRECTORY}/init_d_openssh \
		${FAKE_DIRECTORY}/etc/init.d/openssh
	mkdir -p ${FAKE_DIRECTORY}/etc/rc1.d
	cd ${FAKE_DIRECTORY}/etc/rc1.d && ln -s ../init.d/openssh K10openssh
	mkdir -p ${FAKE_DIRECTORY}/etc/rc2.d
	cd ${FAKE_DIRECTORY}/etc/rc2.d && ln -s ../init.d/openssh S99openssh

post-prototype:
	install -m 644 ${PORT_DIRECTORY}/depend ${FAKE_DIRECTORY}
	install ${PORT_DIRECTORY}/postinstall ${FAKE_DIRECTORY}
	install ${PORT_DIRECTORY}/preremove ${FAKE_DIRECTORY}
	echo i depend >> ${FAKE_DIRECTORY}/Prototype
	echo i postinstall >> ${FAKE_DIRECTORY}/Prototype
	echo i preremove >> ${FAKE_DIRECTORY}/Prototype

