default: _build-syslinux

_build-syslinux-config:
	$(MAKE) -f $(SOURCEPATH)/tools/plop/Makefile SOURCEPATH=$(SOURCEPATH) BUILDPATH=$(BUILDPATH) DISKNAME=$(DISKNAME) DISKVERSION=$(DISKVERSION) TEMPPATH=$(TEMPPATH)
	$(MAKE) -f $(SOURCEPATH)/tools/memtest/Makefile SOURCEPATH=$(SOURCEPATH) BUILDPATH=$(BUILDPATH) DISKNAME=$(DISKNAME) DISKVERSION=$(DISKVERSION) TEMPPATH=$(TEMPPATH)
	sh $(SOURCEPATH)/isolinux/mkconfig.sh > $(BUILDPATH)/isolinux/isolinux.cfg

_build-syslinux: _build-syslinux-config
