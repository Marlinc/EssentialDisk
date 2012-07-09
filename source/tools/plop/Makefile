TITLE       = Plop Boot Manager
LABEL       = plop
DESCRIPTION = The Plop Boot Manager



all: prepare-image build-syslinux-label copy-image
	
prepare-image:
	mkdir -p $(BUILDPATH)/tools/$(LABEL)

build-syslinux-label:
	echo 'label $(LABEL)'                                     >  $(TEMPPATH)/syslinux-label
	echo 'menu label $(TITLE)'                                >> $(TEMPPATH)/syslinux-label
	echo 'text help'                                          >> $(TEMPPATH)/syslinux-label
	echo $(DESCRIPTION)                                       >> $(TEMPPATH)/syslinux-label
	echo 'endtext'                                            >> $(TEMPPATH)/syslinux-label
	echo 'kernel memdisk'                                     >> $(TEMPPATH)/syslinux-label
	echo 'initrd ../tools/$(LABEL)/plpbt.iso'                 >> $(TEMPPATH)/syslinux-label
	echo 'append iso'                                         >> $(TEMPPATH)/syslinux-label
	mv $(TEMPPATH)/syslinux-label $(TEMPPATH)/$(LABEL)-tool-label

copy-image:
	cp $(SOURCEPATH)/tools/plop/plpbt.iso $(BUILDPATH)/tools/$(LABEL)/plpbt.iso
