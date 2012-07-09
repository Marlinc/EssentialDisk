TOOL_MAKEFILE_ARGS = SOURCEPATH=$(SOURCEPATH) BUILDPATH=$(BUILDPATH) DISKNAME=$(DISKNAME) DISKVERSION=$(DISKVERSION) TEMPPATH=$(TEMPPATH)

default: _build-syslinux

_build-syslinux-config:
	$(foreach var,$(INCLUDEDTOOLS),$(MAKE) -f $(SOURCEPATH)/tools/$(var)/Makefile $(TOOL_MAKEFILE_ARGS);)
	sh $(SOURCEPATH)/isolinux/mkconfig.sh > $(BUILDPATH)/isolinux/isolinux.cfg

_build-syslinux: _build-syslinux-config
