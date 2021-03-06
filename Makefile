KRITA = krita

OUTFILES = \
					build/wall/stone_corner_bl.png \
					build/wall/stone_corner_br.png \
					build/wall/stone_corner_tl.png \
					build/wall/stone_corner_tr.png \
					build/wall/stone.png \
					build/wall/stone_wall_l.png \
					build/wall/stone_wall_r.png \
					build/wall/stone_end_bl.png \
					build/wall/stone_end_br.png \
					build/wall/stone_end_fl.png \
					build/wall/stone_end_fr.png \
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
