# $Id: Makefile,v 1.3 2002/08/12 17:43:54 zigg Exp $

include ../GLOBAL/global.mk

PACKAGE_NAME =		samba
PACKAGE_VERSION = 	2.2.5

PACKAGE_DESCRIPTION =	Samba
PACKAGE_CATEGORY =	system

CONFIGURE_ARGS +=	--with-lockdir='${FAKE_DEST_VAR}${INSTALL_STATEDIR}/run' \
			--with-configdir='${FAKE_DEST_VAR}${INSTALL_ETCDIR}/samba' \
			--with-privatedir='${FAKE_DEST_VAR}${INSTALL_ETCDIR}/samba' \
			--with-swatdir='${FAKE_DEST_VAR}${INSTALL_SHAREDIR}/samba' \
			--with-logfilebase='${FAKE_DEST_VAR}${INSTALL_STATEDIR}/log' \
			--with-included-popt

WORK_SOURCE =		${WORK_DIRECTORY}/${PACKAGE_SOURCE_NAME}/source

pre-fake:
	mkdir -p ${FAKE_DIRECTORY}${INSTALL_MANDIR}

post-fake:
	mkdir -p ${FAKE_DIRECTORY}/${INSTALL_ETCDIR}/samba
	mkdir -p ${FAKE_DIRECTORY}/etc/init.d
	install ${RECIPE_DIRECTORY}/init_d_samba \
		${FAKE_DIRECTORY}/etc/init.d/samba
	mkdir -p ${FAKE_DIRECTORY}/etc/rc2.d
	cd ${FAKE_DIRECTORY}/etc/rc2.d && ln -s ../init.d/samba K28samba
	mkdir -p ${FAKE_DIRECTORY}/etc/rc3.d
	cd ${FAKE_DIRECTORY}/etc/rc3.d && ln -s ../init.d/samba S15samba

post-prototype:
	install ${RECIPE_DIRECTORY}/preremove ${FAKE_DIRECTORY}
	echo i preremove >> ${FAKE_DIRECTORY}/Prototype

