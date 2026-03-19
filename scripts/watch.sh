#!/bin/sh
# =============================================================================
# watch.sh - Poll for file changes and auto-render
# Runs inside Docker container, no host dependencies required
# Uses polling (1 second interval) for cross-platform compatibility
# =============================================================================

set -e

WATCH_FILE="${WATCH_FILE:-}"
POLL_INTERVAL=1

if [ -z "$WATCH_FILE" ]; then
    echo "Usage: WATCH_FILE=<file.ly> watch.sh"
    echo "Example: WATCH_FILE=tunes/parker/ornithology-study.ly watch.sh"
    exit 1
fi

if [ ! -f "$WATCH_FILE" ]; then
    echo "Error: File not found: $WATCH_FILE"
    exit 1
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Watching: $WATCH_FILE"
echo "Poll interval: ${POLL_INTERVAL}s"
echo "Press Ctrl+C to stop"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Get initial modification time
get_mtime() {
    stat -c %Y "$1" 2>/dev/null || stat -f %m "$1" 2>/dev/null
}

LAST_MTIME=$(get_mtime "$WATCH_FILE")

# Initial render
echo "[$(date '+%H:%M:%S')] Initial render..."
/work/scripts/render.sh "$WATCH_FILE" || true
echo ""

# Poll for changes
while true; do
    sleep "$POLL_INTERVAL"

    CURRENT_MTIME=$(get_mtime "$WATCH_FILE")

    if [ "$CURRENT_MTIME" != "$LAST_MTIME" ]; then
        LAST_MTIME="$CURRENT_MTIME"
        echo ""
        echo "[$(date '+%H:%M:%S')] Change detected, re-rendering..."
        /work/scripts/render.sh "$WATCH_FILE" || true
        echo ""
    fi
done
