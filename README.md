# Transcriptions

LilyPond transcription workspace. All rendering runs inside Docker.

## Prerequisites

- **Docker** (only requirement)

## Usage

```bash
docker compose -f docker/docker-compose.yml up
```

That's it. This single command:
1. Builds all `.ly` files in `tunes/`
2. Outputs PDFs to `output/pdf/`
3. Outputs MIDI to `output/midi/` (if enabled in the score)
4. Exits when done

Run it again after adding or editing any transcription.

## Project Structure

```
transcriptions/
├── tunes/{composer}/{tune}.ly   # Your transcriptions
├── templates/                    # Starting templates
├── output/pdf/                   # Generated PDFs (gitignored)
├── output/midi/                  # Generated MIDI (gitignored)
└── docker/docker-compose.yml
```

## Creating Transcriptions

1. Copy a template:
   ```bash
   cp templates/lead-sheet.ly tunes/parker/donna-lee.ly
   ```

2. Edit the `.ly` file

3. Build:
   ```bash
   docker compose -f docker/docker-compose.yml up
   ```

## Templates

- **lead-sheet.ly** - Melody + chord symbols
- **grand-staff-study.ly** - Piano grand staff with chords

## Enabling MIDI

Add `\midi {}` to your score:

```lilypond
\score {
  <<
    \new ChordNames \chordChanges
    \new Staff { \melody }
  >>
  \layout { }
  \midi { \tempo 4 = 140 }
}
```
