# $Id: global.mk,v 1.4 2002/07/08 17:20:51 zigg Exp $

# Build phase parameters

BUILD_MAKE_ARGS =	CC="${CC}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"
BUILD_MAKE_ENV =	CC="${CC}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"

# Configure phase parameters

CONFIGURE_ENV =		CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"
CONFIGURE_ARGS =	--prefix='${FAKE_DEST_VAR}${INSTALL_PREFIX}' \
			--libdir='${FAKE_DEST_VAR}${INSTALL_LIBDIR}' \
			--libexecdir='${FAKE_DEST_VAR}${INSTALL_LIBEXECDIR}' \
			--localstatedir='${FAKE_DEST_VAR}${INSTALL_STATEDIR}' \
			--mandir='${FAKE_DEST_VAR}${INSTALL_MANDIR}' \
			--sysconfdir='${FAKE_DEST_VAR}${INSTALL_ETCDIR}'
CONFIGURE_PROGRAM =	./configure

# Distribution parameters

DIST_DIRECTORY =	${SOLPKG_HOME}/DIST
DIST_FILES =		${PACKAGE_SOURCE_NAME}.tar.gz

# Fake install phase parameters

FAKE_DEST_VAR =		$${DESTDIR}
FAKE_DIRECTORY =	${WORK_ROOT}/fake-${PACKAGE_SOURCE_NAME}
FAKE_PREFIX_FLAGS =	--prefix='$${DESTDIR}${INSTALL_PREFIX}'
FAKE_MAKE_ARGS =	DESTDIR=${FAKE_DIRECTORY}
FAKE_MAKE_ENV =		DESTDIR=${FAKE_DIRECTORY}
FAKE_MAKE_TARGET =	install

# Installation parameters

INSTALL_PREFIX =	/usr
INSTALL_ETCDIR =	/etc
INSTALL_LIBDIR =	${INSTALL_PREFIX}/lib
INSTALL_LIBEXECDIR =	${INSTALL_LIBDIR}/${PACKAGE_NAME}
INSTALL_MANDIR =	${INSTALL_SHAREDIR}/man
INSTALL_SHAREDIR =	${INSTALL_PREFIX}/share
INSTALL_STATEDIR =	/var

# Package parameters

PACKAGE_PREFIX =	SP
PACKAGE_SOLARIS_NAME = 	${PACKAGE_PREFIX}${PACKAGE_NAME}
PACKAGE_SOURCE_NAME =	${PACKAGE_NAME}-${PACKAGE_VERSION}
PACKAGE_REVISION =	1

# Directories

RECIPE_DIRECTORY:sh =	pwd
SOLPKG_HOME =		${RECIPE_DIRECTORY}/..
WORK_ROOT =		${RECIPE_DIRECTORY}
WORK_DIRECTORY =	${WORK_ROOT}/work-${PACKAGE_SOURCE_NAME}
WORK_SOURCE =		${WORK_DIRECTORY}/${PACKAGE_SOURCE_NAME}

# Programs and program configuration

MAKE_PROGRAM =		make
CC = 			gcc
CFLAGS =		-O2
CXXFLAGS = 		-O2

all:	build

clean:	clean-fake
	@echo "##"
	@echo "## Cleaning build for ${PACKAGE_SOURCE_NAME}"
	@echo "##"
	rm -f .extracted .configured .patched .built
	rm -rf ${WORK_DIRECTORY}

extract:	.extracted

.extracted:
	@echo "##"
	@echo "## Extracting ${PACKAGE_SOURCE_NAME}"
	@echo "##"
	@make pre-extract do-extract post-extract

pre-extract:

do-extract:
	mkdir ${WORK_DIRECTORY}
	cd ${WORK_DIRECTORY} && \
		for dist_file in ${DIST_FILES}; \
		do \
			gzip -dc ${DIST_DIRECTORY}/$$dist_file | tar xf - ; \
		done
	touch .extracted

post-extract:

patch:	.patched

.patched:	.extracted
	@echo "##"
	@echo "## Patching ${PACKAGE_SOURCE_NAME}"
	@echo "##"
	@make pre-patch do-patch post-patch

pre-patch:

do-patch:
	cd ${WORK_SOURCE} && \
		if [ -f ${RECIPE_DIRECTORY}/patch-* ]; \
		then \
			for patch_file in ${RECIPE_DIRECTORY}/patch-*; \
			do \
				patch -b -p0 < $$patch_file ; \
			done; \
		fi
	touch .patched

post-patch:

configure:	.configured

.configured:	.patched
	@echo "##"
	@echo "## Configuring ${PACKAGE_SOURCE_NAME}"
	@echo "##"
	@make pre-configure do-configure post-configure

pre-configure:

do-configure:
	cd ${WORK_SOURCE} && \
		${CONFIGURE_ENV} ${CONFIGURE_PROGRAM} ${CONFIGURE_ARGS}
	touch .configured

post-configure:

build:	.built

.built:	.configured
	@echo "##"
	@echo "## Building ${PACKAGE_SOURCE_NAME}"
	@echo "##"
	@make pre-build do-build post-build

pre-build:

do-build:
	cd ${WORK_SOURCE} && \
		${BUILD_MAKE_ENV} ${MAKE_PROGRAM} ${BUILD_MAKE_ARGS} \
			${BUILD_MAKE_TARGET}
	touch .built

post-build:

clean-fake:
	@echo "##"
	@echo "## Cleaning fake install for ${PACKAGE_SOURCE_NAME}"
	@echo "##"
	rm -f .faked .prototyped
	rm -rf ${FAKE_DIRECTORY}

fake:	.faked

.faked:	.built
	@echo "##"
	@echo "## Doing fake install for ${PACKAGE_SOURCE_NAME}"
	@echo "##"
	@make pre-fake do-fake post-fake

pre-fake:

do-fake:
	mkdir -p ${FAKE_DIRECTORY}/usr
	cd ${WORK_SOURCE} && \
		AM_MAKEFLAGS="${FAKE_MAKE_ENV}" ${FAKE_MAKE_ENV} \
			${MAKE_PROGRAM} ${FAKE_MAKE_ARGS} ${FAKE_MAKE_TARGET}
	touch .faked

post-fake:

prototype:	.prototyped

.prototyped:	.faked
	@echo "##"
	@echo "## Building package prototype for ${PACKAGE_SOURCE_NAME}"
	@echo "##"
	@make pre-prototype do-prototype post-prototype

pre-prototype:

do-prototype:
	for file in ${FAKE_DIRECTORY}/*; \
	do \
		if [ -f $$file ]; \
		then \
			rm -f $$file ; \
		fi; \
	done
	cd ${FAKE_DIRECTORY} && \
		find . | pkgproto | grep -v Prototype | \
		sed -e 's| etc| /etc|' | sed -e 's| usr| /usr|' | \
		sed -e 's| var| /var|' > Prototype && \
		echo i pkginfo >> Prototype

post-prototype:

package:	prototype
	@echo "##"
	@echo "## Building package for ${PACKAGE_SOURCE_NAME}"
	@echo "##"
	@make pre-package do-package post-package

pre-package:

do-package:
	echo PKG=${PACKAGE_SOLARIS_NAME} >> ${FAKE_DIRECTORY}/pkginfo
	echo NAME="${PACKAGE_DESCRIPTION}" >> ${FAKE_DIRECTORY}/pkginfo
	echo VERSION=${PACKAGE_VERSION} >> ${FAKE_DIRECTORY}/pkginfo
	echo ARCH=`uname -p` >> ${FAKE_DIRECTORY}/pkginfo
	echo CLASSES="none" >> ${FAKE_DIRECTORY}/pkginfo
	echo CATEGORY=${PACKAGE_CATEGORY} >> ${FAKE_DIRECTORY}/pkginfo
	echo VENDOR="${PACKAGE_VENDOR}" >> ${FAKE_DIRECTORY}/pkginfo
	echo EMAIL="" >> ${FAKE_DIRECTORY}/pkginfo
	echo BASEDIR="/" >> ${FAKE_DIRECTORY}/pkginfo
	cd ${FAKE_DIRECTORY} && pkgmk -r . -d . -f Prototype
	pkgtrans -s ${FAKE_DIRECTORY} \
		${WORK_ROOT}/${PACKAGE_SOLARIS_NAME}-${PACKAGE_VERSION}-`uname -s`-`uname -r`-`uname -p`.pkg \
		${PACKAGE_SOLARIS_NAME}

post-package:

include ${SOLPKG_HOME}/GLOBAL/local.mk

