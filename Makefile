KRITA = krita

INFILES = build/wall_texture.png \
					build/grass_texture.png

build/%.png: %.kra
	$(KRITA) --export --export-filename $@ $<

all: $(INFILES)

