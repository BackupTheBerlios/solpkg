# $Id: Makefile,v 1.7 2002/08/12 17:43:54 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		openssh
PACKAGE_VERSION =	3.4p1

PACKAGE_DESCRIPTION =	OpenSSH
PACKAGE_CATEGORY =	utility

INSTALL_LIBEXECDIR =	${INSTALL_LIBDIR}/ssh
CONFIGURE_ARGS +=	--with-random=/dev/random --without-skey
FAKE_DEST_VAR =

post-fake:
	mkdir -p ${FAKE_DIRECTORY}/etc/init.d
	install ${RECIPE_DIRECTORY}/init_d_openssh \
		${FAKE_DIRECTORY}/etc/init.d/openssh
	mkdir -p ${FAKE_DIRECTORY}/etc/rcS.d
	cd ${FAKE_DIRECTORY}/etc/rcS.d && ln -s ../init.d/openssh K03openssh
	mkdir -p ${FAKE_DIRECTORY}/etc/rc0.d
	cd ${FAKE_DIRECTORY}/etc/rc0.d && ln -s ../init.d/openssh K03openssh
	mkdir -p ${FAKE_DIRECTORY}/etc/rc1.d
	cd ${FAKE_DIRECTORY}/etc/rc1.d && ln -s ../init.d/openssh K03openssh
	mkdir -p ${FAKE_DIRECTORY}/etc/rc2.d
	cd ${FAKE_DIRECTORY}/etc/rc2.d && ln -s ../init.d/openssh K03openssh
	mkdir -p ${FAKE_DIRECTORY}/etc/rc3.d
	cd ${FAKE_DIRECTORY}/etc/rc3.d && ln -s ../init.d/openssh S89openssh

post-prototype:
	install -m 644 ${RECIPE_DIRECTORY}/depend ${FAKE_DIRECTORY}
	install ${RECIPE_DIRECTORY}/postinstall ${FAKE_DIRECTORY}
	install ${RECIPE_DIRECTORY}/preremove ${FAKE_DIRECTORY}
	echo i depend >> ${FAKE_DIRECTORY}/Prototype
	echo i postinstall >> ${FAKE_DIRECTORY}/Prototype
	echo i preremove >> ${FAKE_DIRECTORY}/Prototype

