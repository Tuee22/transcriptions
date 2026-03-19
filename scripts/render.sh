#!/bin/sh
# =============================================================================
# render.sh - Render a single LilyPond file
# Runs inside Docker container via docker-compose
# =============================================================================

set -e

if [ -z "$1" ]; then
    echo "Usage: render.sh <file.ly>"
    echo "Example: render.sh tunes/parker/ornithology-study.ly"
    exit 1
fi

INPUT_FILE="$1"

if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: File not found: $INPUT_FILE"
    exit 1
fi

# Extract filename without extension and path
BASENAME=$(basename "$INPUT_FILE" .ly)

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Rendering: $INPUT_FILE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Run LilyPond with output to designated directories
lilypond \
    --output="output/pdf/$BASENAME" \
    --pdf \
    "$INPUT_FILE"

# Move MIDI if generated (LilyPond puts it next to output)
if [ -f "output/pdf/$BASENAME.midi" ]; then
    mv "output/pdf/$BASENAME.midi" "output/midi/$BASENAME.midi"
fi
if [ -f "output/pdf/$BASENAME.mid" ]; then
    mv "output/pdf/$BASENAME.mid" "output/midi/$BASENAME.mid"
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Done: output/pdf/$BASENAME.pdf"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
