# Jazz Transcriptions

A source-controlled workspace for LilyPond jazz transcriptions. All rendering runs inside Docker for maximum portability.

## Prerequisites

- **Docker** (only requirement)
- No local LilyPond installation needed
- Works on macOS (Intel/Apple Silicon), Linux, Windows

## Quick Start

```bash
# Clone the repo
git clone https://github.com/Tuee22/transcriptions.git
cd transcriptions

# Pull the LilyPond Docker image
make docker-pull

# Render the example file
make render FILE=tunes/parker/ornithology-study.ly

# View the output
open output/pdf/ornithology-study.pdf  # macOS
# xdg-open output/pdf/ornithology-study.pdf  # Linux
```

## Rendering Workflow

All rendering happens inside Docker containers. No host dependencies required beyond Docker itself.

### Render a Single File

```bash
make render FILE=tunes/parker/ornithology-study.ly
```

Output goes to:
- `output/pdf/ornithology-study.pdf`
- `output/midi/ornithology-study.midi` (if MIDI output is enabled in the file)

### Render All Files

```bash
make render-all
```

Finds and renders all `.ly` files in the `tunes/` directory.

### Watch Mode (Auto-Render)

```bash
make watch FILE=tunes/parker/ornithology-study.ly
```

Polls the file every second and re-renders on change. Press `Ctrl+C` to stop.

### Clean Output

```bash
make clean
```

Removes all generated PDFs, MIDI files, and PNGs.

## Project Structure

```
transcriptions/
├── tunes/                    # Your transcriptions
│   ├── parker/               # Organized by composer
│   ├── monk/
│   ├── bud-powell/
│   ├── contrafacts/          # Contrafact tunes
│   └── studies/              # Technical studies
├── templates/                # Starting templates
│   ├── lead-sheet.ly         # Single staff with chords
│   └── grand-staff-study.ly  # Piano grand staff
├── output/                   # Generated files (gitignored)
│   ├── pdf/
│   ├── midi/
│   └── png/
├── scripts/                  # Helper scripts (run in Docker)
├── docs/                     # Additional documentation
├── Makefile                  # Build orchestration
└── docker-compose.yml        # Docker service definitions
```

## Creating a New Transcription

1. Copy a template:
   ```bash
   cp templates/lead-sheet.ly tunes/parker/donna-lee.ly
   ```

2. Edit the file in your preferred editor

3. Render it:
   ```bash
   make render FILE=tunes/parker/donna-lee.ly
   ```

Or use watch mode for live feedback:
```bash
make watch FILE=tunes/parker/donna-lee.ly
```

## Templates

### Lead Sheet (`templates/lead-sheet.ly`)
- Single melody staff
- Chord symbols above
- Good for heads, single-line solos

### Grand Staff Study (`templates/grand-staff-study.ly`)
- Piano grand staff (treble + bass)
- Chord symbols above
- Dynamics between staves
- Good for piano transcriptions, voicing studies

## Naming Conventions

- **Directories**: lowercase, hyphenated composer names
  - `parker/`, `bud-powell/`, `bill-evans/`
- **Files**: lowercase, hyphenated tune names
  - `donna-lee.ly`, `ornithology-head.ly`, `solo-chorus-1.ly`
- **Suffixes** (optional):
  - `-head.ly` - melody/head only
  - `-solo.ly` - solo transcription
  - `-study.ly` - technical study or excerpt
  - `-voicings.ly` - chord voicing reference

## VS Code Integration

Recommended extensions are configured in `.vscode/extensions.json`:
- **vslilypond** - Syntax highlighting and preview
- **lilypond-syntax** - Additional syntax support

### Build Tasks

Use `Cmd+Shift+B` (macOS) or `Ctrl+Shift+B` (Linux/Windows) to access:

- **Render Current File** - Render the file you're editing
- **Render All Files** - Render everything in `tunes/`
- **Watch Current File** - Auto-render on save
- **Clean Output** - Remove generated files

## Output Files

Generated files are **not tracked in git**. They're created locally in `output/`:

| Type | Location | Notes |
|------|----------|-------|
| PDF  | `output/pdf/` | Main output format |
| MIDI | `output/midi/` | If `\midi {}` block present |
| PNG  | `output/png/` | If `--png` flag used |

To track outputs in git, remove them from `.gitignore`.

## Docker Details

This project uses `jeandeaual/lilypond:latest` which supports:
- `linux/amd64` (Intel/AMD)
- `linux/arm64` (Apple Silicon, ARM servers)

The file watcher uses polling (1-second interval) rather than inotify for cross-platform compatibility with Docker on macOS.

## Troubleshooting

### Docker not found
Make sure Docker is running:
```bash
docker --version
```

### Permission denied on scripts
```bash
chmod +x scripts/*.sh
```

### File not rendering
Check for LilyPond syntax errors in the terminal output. Common issues:
- Missing `\version` declaration
- Unmatched braces
- Invalid note names

### Watch mode not detecting changes
The watcher uses 1-second polling. Save the file and wait a moment. If still not working, try stopping (`Ctrl+C`) and restarting the watch.
