# $Id: Makefile,v 1.11 2003/10/01 14:44:29 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		openssh
PACKAGE_VERSION =	3.7.1p2

PACKAGE_DESCRIPTION =	OpenSSH
PACKAGE_CATEGORY =	utility

INSTALL_ETCDIR =	/etc/ssh
INSTALL_LIBEXECDIR =	${INSTALL_LIBDIR}/ssh
CONFIGURE_ARGS +=	--with-random=/dev/random --without-skey
CONFIGURE_ENV +=	CPPFLAGS="-I${INSTALL_LIBDIR}/openssl/include"
FAKE_DEST_VAR =

pre-fake:
	mkdir -p ${FAKE_DIRECTORY}/etc/init.d
	cp ${RECIPE_DIRECTORY}/init_d_openssh \
		${FAKE_DIRECTORY}/etc/init.d/openssh
	chmod 755 ${FAKE_DIRECTORY}/etc/init.d/openssh
	-chgrp sys ${FAKE_DIRECTORY}/etc/init.d/openssh
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

post-fake:
	mkdir -p ${FAKE_DIRECTORY}${INSTALL_SHAREDIR}/examples/openssh
	mv ${FAKE_DIRECTORY}/etc/ssh/ssh*_config \
		${FAKE_DIRECTORY}${INSTALL_SHAREDIR}/examples/openssh/
	-chgrp sys ${FAKE_DIRECTORY}/etc/ssh

post-prototype:
	cp ${RECIPE_DIRECTORY}/depend \
		${RECIPE_DIRECTORY}/postinstall \
		${RECIPE_DIRECTORY}/preremove ${FAKE_DIRECTORY}
	echo i depend >> ${FAKE_DIRECTORY}/Prototype
	echo i postinstall >> ${FAKE_DIRECTORY}/Prototype
	echo i preremove >> ${FAKE_DIRECTORY}/Prototype

