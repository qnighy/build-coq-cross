#!/usr/bin/make -f

.PHONY: DEFAULT_TARGET
DEFAULT_TARGET: bzip2-install

include config.mk
include Makefile.zlib
include Makefile.libpng
include Makefile.libjpeg
include Makefile.freeglut
include Makefile.libtiff
include Makefile.bzip2
