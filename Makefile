#!/usr/bin/make -f

.PHONY: DEFAULT_TARGET
DEFAULT_TARGET: gettext-install

include config.mk
include Makefile.zlib
include Makefile.libpng
include Makefile.libjpeg
include Makefile.freeglut
include Makefile.libtiff
include Makefile.bzip2
include Makefile.freetype
include Makefile.pixman
include Makefile.cairo
include Makefile.libiconv
include Makefile.gettext
