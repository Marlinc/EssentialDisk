TITLE       = Memory Test
LABEL       = memtest
DESCRIPTION = Run a complete test of all your memory \
 note that this will continue to run indefinately until \
 you stop it by pressing escape. The longer it runs, the \
 more thorough the test.



all: prepare-image build-syslinux-label copy-image
	
prepare-image:
	mkdir -p $(BUILDPATH)/tools/$(LABEL)

build-syslinux-label:
	echo 'label $(LABEL)'                                     >  $(TEMPPATH)/syslinux-label
	echo 'menu label $(TITLE)'                                >> $(TEMPPATH)/syslinux-label
	echo 'text help'                                          >> $(TEMPPATH)/syslinux-label
	echo $(DESCRIPTION)                                       >> $(TEMPPATH)/syslinux-label
	echo 'endtext'                                            >> $(TEMPPATH)/syslinux-label
	echo 'kernel ../tools/$(LABEL)/memtest'                    >> $(TEMPPATH)/syslinux-label
	echo 'append -'                                           >> $(TEMPPATH)/syslinux-label
	mv $(TEMPPATH)/syslinux-label $(TEMPPATH)/$(LABEL)-tool-label

copy-image:
	cp $(SOURCEPATH)/tools/memtest/memtest $(BUILDPATH)/tools/$(LABEL)/memtest
