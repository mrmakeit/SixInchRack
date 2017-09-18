# explicit wildcard expansion suppresses errors when no files are found
.PHONY: clean images
include $(wildcard *.deps)
SRCS = $(wildcard *.scad)
OBJS = $(patsubst %.scad,%.stl,$(SRCS))
IMGS = $(patsubst %.scad,%.png,$(SRCS))

%.stl: %.scad
	openscad -m make -o models/$@ -d $@.deps $<
%.png: %.scad
	openscad -m make -o thumbnails/$@ -d $@.deps $<
images: trap.png rack_end.png top_handle.png side_panels.png
clean:
	rm -f *.png *.stl *.deps
