# $Id: Makefile,v 1.2 2002/02/07 20:38:24 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		openssh
PACKAGE_VERSION =	3.0.2p1

PACKAGE_DESCRIPTION =	OpenSSH
PACKAGE_VENDOR =	OpenBSD
PACKAGE_CATEGORY =	utility

CONFIGURE_ARGS +=	--with-random=/dev/random
FAKE_DEST_VAR =

post-fake:
	mkdir -p ${FAKE_DIRECTORY}/etc/init.d
	install ${RECIPE_DIRECTORY}/init_d_openssh \
		${FAKE_DIRECTORY}/etc/init.d/openssh
	mkdir -p ${FAKE_DIRECTORY}/etc/rc1.d
	cd ${FAKE_DIRECTORY}/etc/rc1.d && ln -s ../init.d/openssh K10openssh
	mkdir -p ${FAKE_DIRECTORY}/etc/rc2.d
	cd ${FAKE_DIRECTORY}/etc/rc2.d && ln -s ../init.d/openssh S99openssh

post-prototype:
	install -m 644 ${RECIPE_DIRECTORY}/depend ${FAKE_DIRECTORY}
	install ${RECIPE_DIRECTORY}/postinstall ${FAKE_DIRECTORY}
	install ${RECIPE_DIRECTORY}/preremove ${FAKE_DIRECTORY}
	echo i depend >> ${FAKE_DIRECTORY}/Prototype
	echo i postinstall >> ${FAKE_DIRECTORY}/Prototype
	echo i preremove >> ${FAKE_DIRECTORY}/Prototype

