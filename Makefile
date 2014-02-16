#!/usr/bin/make -f

.PHONY: DEFAULT_TARGET
DEFAULT_TARGET: libtiff-install

include config.mk
include Makefile.zlib
include Makefile.libpng
include Makefile.libjpeg
include Makefile.freeglut
include Makefile.libtiff
