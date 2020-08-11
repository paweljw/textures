KRITA = krita

OUTFILES = build/wall/stone.png \
					build/floor/grass.png \
					build/floor/path_bottom_alt.png \
					build/floor/path_corner_bottom_left.png \
					build/floor/path_corner_bottom_right.png \
					build/floor/path_corner_top_left.png \
					build/floor/path_corner_top_right.png \
					build/floor/path_hor_bottom.png \
					build/floor/path_hor_bottom.png \
					build/floor/path_hor_left.png \
					build/floor/path_hor_right.png \
					build/floor/path_hor_top.png \
					build/floor/path.png \
					build/floor/path_left_alt.png \
					build/floor/path_right_alt.png \
					build/floor/path_top_alt.png \

.DEFAULT_GOAL = all

build/%.png: %.kra
	$(KRITA) --export --export-filename $@ $<

mkdirs: build/wall build/floor
	mkdir -p build/wall
	touch build/wall/.keep
	mkdir -p build/floor
	touch build/floor/.keep

distrib: $(OUTFILES)
	find build/ -name "*.png" | tar -czvf dist/textures-`cat VERSION`.tar.gz --files-from -

clean:
	rm -f $(OUTFILES)
	rm -f dist/textures-*.tar.gz

.PHONY: clean mkdirs

all: distrib
