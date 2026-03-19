#!/bin/sh
# =============================================================================
# render-all.sh - Render all LilyPond files in tunes/
# Runs inside Docker container via docker-compose
# =============================================================================

set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Rendering all .ly files in tunes/"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

COUNT=0
FAILED=0

# Find all .ly files in tunes/ directory
for file in $(find tunes -name "*.ly" -type f 2>/dev/null); do
    echo ""
    echo "[$((COUNT + 1))] $file"

    if /work/scripts/render.sh "$file"; then
        COUNT=$((COUNT + 1))
    else
        echo "FAILED: $file"
        FAILED=$((FAILED + 1))
    fi
done

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Rendered: $COUNT files"
if [ "$FAILED" -gt 0 ]; then
    echo "Failed: $FAILED files"
fi
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
