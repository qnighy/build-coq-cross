#!/usr/bin/make -f

COQ_VERSION := 8.4pl3

COQ_SRC := src/coq-$(COQ_VERSION).tar.gz
COQ_CONFIGURE_STAMP := build/coq-$(COQ_VERSION)/.configure_stamp
COQ_BUILD_STAMP := build/coq-$(COQ_VERSION)/.build_stamp
COQ_INSTALL_STAMP := stamps/coq.stamp

.PHONY: coq-src coq-configure coq coq-install coq-force-install

coq-src: $(COQ_SRC)
$(COQ_SRC):
	mkdir -p src
	cd src && \
	  wget -nc http://coq.inria.fr/distrib/V$(COQ_VERSION)/files/coq-$(COQ_VERSION).tar.gz

coq-configure: $(COQ_CONFIGURE_STAMP)
$(COQ_CONFIGURE_STAMP): $(COQ_SRC)
	$(MAKE) mingw-ocaml-install
	$(MAKE) mingw-camlp5-install
	$(MAKE) lablgtk2-install
	mkdir -p build
	cd build && \
	  tar xvf ../$(COQ_SRC)
	cd build/coq-$(COQ_VERSION) && \
	  PATH="$(PREFIX)/bin:$$PATH" \
	    ./configure -local -coqide no
	touch $@

coq: $(COQ_BUILD_STAMP)
$(COQ_BUILD_STAMP): $(COQ_CONFIGURE_STAMP)
	cd build/coq-$(COQ_VERSION) && \
	  PATH="$(PREFIX)/bin:$$PATH" \
	    make world
	touch $@

