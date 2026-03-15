
SDL3_SRC := https://github.com/libsdl-org/SDL/releases/download/release-3.4.2/SDL3-3.4.2.tar.gz
SDL3_DEPS := gui/libXext gui/libX11

SDL3_BINS := checkkeys testgeometry testdraw2\
			 testscale testrendercopyex testsprite2\
			 testbounds testmessage

$(eval $(call DOWNLOAD_SOURCE,gui/SDL3,$(SDL3_SRC)))
$(eval $(call SPECIFY_DEPS,gui/SDL3,$(SDL3_DEPS)))

o/gui/SDL3/setup: o/gui/SDL3/patched
	cd $(BASELOC)/o/gui/SDL3/SDL3* && aclocal --force $(ERRLOG) &&\
		autoconf --force $(ERRLOG)
	touch $@

o/gui/SDL3/configured.x86_64: o/gui/SDL3/setup
o/gui/SDL3/configured.aarch64: o/gui/SDL3/setup

o/gui/SDL3/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/gui/SDL3/config-wrapper
o/gui/SDL3/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/gui/SDL3/config-wrapper

o/gui/SDL3/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/gui/SDL3/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

o/gui/SDL3/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/gui/SDL3/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/gui/SDL3/built.fat: BINS = $(SDL3_BINS)
