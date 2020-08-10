KRITA = krita

OUTFILES = build/wall/stone.png \
					build/floor/grass.png

.DEFAULT_GOAL = all

build/%.png: %.kra
	$(KRITA) --export --export-filename $@ $<

mkdirs: build/wall build/floor
	mkdir -p build/wall
	touch build/wall/.keep
	mkdir -p build/floor
	touch build/floor/.keep

distrib: $(OUTFILES)
	find build/ -name "*.png" | tar -czvf dist/textures.tar.gz --files-from -

clean:
	rm -f $(OUTFILES)
	rm -f dist/textures.tar.gz

.PHONY: clean mkdirs

all: distrib
