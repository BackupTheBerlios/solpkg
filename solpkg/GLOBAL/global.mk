# $Id: global.mk,v 1.1 2001/12/14 19:50:02 zigg Exp $

CC=			gcc
CFLAGS=			-O2
CXXFLAGS=		-O2
CONFIGURE_ENV=		CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"
CONFIGURE_ARGS=		${FAKE_PREFIX_FLAG} --sysconfdir=/etc \
			--localstatedir=/var
CONFIGURE_PROGRAM=	./configure
DIST_DIRECTORY=		${PORT_DIRECTORY}/../DIST
FAKE_DIRECTORY=		${WORK_ROOT}/fake-${PACKAGE_FULLNAME}
FAKE_PREFIX_FLAG=	--prefix='$${DESTDIR}${INSTALL_PREFIX}'
INSTALL_PREFIX=		/usr
MAKE_BUILD_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"
MAKE_BUILD_ENV=		CC="${CC}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"
MAKE_FAKE_ARGS=		DESTDIR=${FAKE_DIRECTORY}
MAKE_FAKE_ENV=		DESTDIR=${FAKE_DIRECTORY}
MAKE_FAKE_TARGET=	install
MAKE_PROGRAM=		make
PACKAGE_FULLNAME=	${PACKAGE_NAME}-${PACKAGE_VERSION}
PORT_DIRECTORY:sh=	pwd
WORK_ROOT=		${PORT_DIRECTORY}
WORK_DIRECTORY=		${WORK_ROOT}/work-${PACKAGE_FULLNAME}
WORK_SOURCE=		${WORK_DIRECTORY}/${PACKAGE_FULLNAME}

all:	build

clean:	clean-fake
	@echo "##"
	@echo "## Cleaning build for ${PACKAGE_FULLNAME}"
	@echo "##"
	rm -f .extracted .configured .patched .built
	rm -rf ${WORK_DIRECTORY}

extract:	.extracted

.extracted:
	@echo "##"
	@echo "## Extracting ${PACKAGE_FULLNAME}"
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
	@echo "## Patching ${PACKAGE_FULLNAME}"
	@echo "##"
	@make pre-patch do-patch post-patch

pre-patch:

do-patch:
	cd ${WORK_SOURCE} && \
		if [ -f ${PORT_DIRECTORY}/patch-* ]; \
		then \
			for patch_file in ${PORT_DIRECTORY}/patch-*; \
			do \
				patch -b -p0 < $$patch_file ; \
			done; \
		fi
	touch .patched

post-patch:

configure:	.configured

.configured:	.patched
	@echo "##"
	@echo "## Configuring ${PACKAGE_FULLNAME}"
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
	@echo "## Building ${PACKAGE_FULLNAME}"
	@echo "##"
	@make pre-build do-build post-build

pre-build:

do-build:
	cd ${WORK_SOURCE} && \
		${MAKE_BUILD_ENV} ${MAKE_PROGRAM} ${MAKE_BUILD_ARGS} \
			${MAKE_BUILD_TARGET}
	touch .built

post-build:

clean-fake:
	@echo "##"
	@echo "## Cleaning fake install for ${PACKAGE_FULLNAME}"
	@echo "##"
	rm -f .faked .prototyped
	rm -rf ${FAKE_DIRECTORY}

fake:	.faked

.faked:	.built
	@echo "##"
	@echo "## Doing fake install for ${PACKAGE_FULLNAME}"
	@echo "##"
	@make pre-fake do-fake post-fake

pre-fake:

do-fake:
	mkdir -p ${FAKE_DIRECTORY}/usr
	cd ${WORK_SOURCE} && \
		AM_MAKEFLAGS="${MAKE_FAKE_ENV}" ${MAKE_FAKE_ENV} \
			${MAKE_PROGRAM} ${MAKE_FAKE_ARGS} ${MAKE_FAKE_TARGET}
	touch .faked

post-fake:

prototype:	.prototyped

.prototyped:	.faked
	@echo "##"
	@echo "## Building package prototype for ${PACKAGE_FULLNAME}"
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
	@echo "## Building package for ${PACKAGE_FULLNAME}"
	@echo "##"
	@make pre-package do-package post-package

pre-package:

do-package:
	echo PKG=${PACKAGE_NAME} >> ${FAKE_DIRECTORY}/pkginfo
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
		${WORK_ROOT}/${PACKAGE_FULLNAME}-`uname -s`-`uname -r`-`uname -p`.pkg \
		${PACKAGE_NAME}
	gzip ${WORK_ROOT}/${PACKAGE_FULLNAME}-`uname -s`-`uname -r`-`uname -p`.pkg

post-package:

include ../GLOBAL/local.mk

