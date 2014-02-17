#!/usr/bin/make -f

CAIRO_VERSION := 1.12.16

CAIRO_SRC := src/cairo-$(CAIRO_VERSION).tar.xz
CAIRO_CONFIGURE_STAMP := build/cairo-$(CAIRO_VERSION)/.configure_stamp
CAIRO_BUILD_STAMP := build/cairo-$(CAIRO_VERSION)/.build_stamp
CAIRO_INSTALL_STAMP := stamps/cairo.stamp

.PHONY: cairo-src cairo-configure cairo cairo-install cairo-force-install

cairo-src: $(CAIRO_SRC)
$(CAIRO_SRC):
	mkdir -p src
	cd src && \
	  wget -nc http://cairographics.org/releases/cairo-$(CAIRO_VERSION).tar.xz

cairo-configure: $(CAIRO_CONFIGURE_STAMP)
$(CAIRO_CONFIGURE_STAMP): $(CAIRO_SRC)
	$(MAKE) freetype-install
	$(MAKE) pixman-install
	mkdir -p build
	cd build && \
	  tar xvf ../$(CAIRO_SRC)
	cd build/cairo-$(CAIRO_VERSION) && \
	  CPPFLAGS="-I$(PREFIX)/include" \
	  LDFLAGS="-L$(PREFIX)/lib" \
	  PKG_CONFIG_LIBDIR="$(PREFIX)/lib/pkgconfig" \
	    ./configure --host=$(ARCH) --prefix="$(PREFIX)"
	touch $@

cairo: $(CAIRO_BUILD_STAMP)
$(CAIRO_BUILD_STAMP): $(CAIRO_CONFIGURE_STAMP)
	cd build/cairo-$(CAIRO_VERSION) && \
	  $(MAKE) all
	touch $@

cairo-install: $(CAIRO_INSTALL_STAMP)
$(CAIRO_INSTALL_STAMP):
	$(MAKE) cairo-force-install
	touch $@

cairo-force-install: $(CAIRO_BUILD_STAMP)
	$(MAKE) freetype-install
	$(MAKE) pixman-install
	mkdir -p stamps
	cd build/cairo-$(CAIRO_VERSION) && \
	  $(SUDO) $(MAKE) install
