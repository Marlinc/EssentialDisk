DISKNAME    = EssentialDisk

INCLUDEDTOOLS = plop memtest

# Define the disk version
VERSION     = 0
PATCHLEVEL  = 1
SUBLEVEL    = 0
DISKVERSION = $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(SUBLEVEL)))$(EXTRAVERSION)

BUILDPATH  = $(shell pwd)/build
SOURCEPATH = $(shell pwd)/source
TEMPPATH   = $(shell pwd)/tmp/$(DISKNAME)-$(DISKVERSION)

IMAGEFILE  = $(DISKNAME).iso


all: build
    
build-syslinux:
	mkdir -p $(BUILDPATH)/isolinux
	#cp -R $(SOURCEPATH)/isolinux/* $(BUILDPATH)/isolinux
	$(MAKE) -f $(SOURCEPATH)/isolinux/Makefile SOURCEPATH=$(SOURCEPATH) BUILDPATH=$(BUILDPATH) DISKNAME=$(DISKNAME) DISKVERSION=$(DISKVERSION) TEMPPATH=$(TEMPPATH) INCLUDEDTOOLS="$(INCLUDEDTOOLS)"

build-tempdirectory:
	mkdir -p $(TEMPPATH)
	rm -Rf $(TEMPPATH)/*
	
build-autorun:
	cp $(SOURCEPATH)/autorun $(BUILDPATH)/autorun
	echo 'No documentation was included with this disk.' > $(BUILDPATH)/index.html	

build: clean-build build-tempdirectory build-syslinux build-autorun
	mkdir -p $(BUILDPATH)
	cp -Ru $(SOURCEPATH)/raw-disk/* $(BUILDPATH)
	mkisofs -o $(IMAGEFILE) \
		-b isolinux/isolinux.bin -c isolinux/boot.cat \
		-no-emul-boot -boot-load-size 4 -boot-info-table \
		-l \
		build

test:
	qemu-system-x86_64 -m 128M -cdrom $(IMAGEFILE)

clean-all: clean-build clean-iso

clean-build:
	rm -Rf $(BUILDPATH)

clean-iso:
	rm $(IMAGEFILE)
	
