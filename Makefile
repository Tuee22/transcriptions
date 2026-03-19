# =============================================================================
# LilyPond Transcriptions - Makefile
# All rendering runs inside Docker (no host dependencies)
# =============================================================================

.PHONY: help render render-all watch clean docker-pull

# Default target
help:
	@echo "LilyPond Transcriptions"
	@echo "======================"
	@echo ""
	@echo "Usage:"
	@echo "  make render FILE=<path>   Render a single .ly file"
	@echo "  make render-all           Render all .ly files in tunes/"
	@echo "  make watch FILE=<path>    Watch a file and auto-render on change"
	@echo "  make clean                Remove all generated output files"
	@echo "  make docker-pull          Pull latest LilyPond Docker image"
	@echo ""
	@echo "Examples:"
	@echo "  make render FILE=tunes/parker/ornithology-study.ly"
	@echo "  make watch FILE=tunes/parker/ornithology-study.ly"
	@echo "  make render-all"
	@echo ""

# Render a single file
render:
ifndef FILE
	$(error FILE is required. Usage: make render FILE=tunes/parker/ornithology-study.ly)
endif
	docker compose run --rm render /work/scripts/render.sh $(FILE)

# Render all .ly files in tunes/
render-all:
	docker compose run --rm render /work/scripts/render-all.sh

# Watch a file for changes and auto-render
watch:
ifndef FILE
	$(error FILE is required. Usage: make watch FILE=tunes/parker/ornithology-study.ly)
endif
	WATCH_FILE=$(FILE) docker compose run --rm watch

# Clean all generated outputs
clean:
	rm -f output/pdf/*.pdf
	rm -f output/midi/*.midi output/midi/*.mid
	rm -f output/png/*.png
	@echo "Cleaned output directories"

# Pull latest Docker images
docker-pull:
	docker pull jeandeaual/lilypond:latest
	@echo "Docker images updated"
