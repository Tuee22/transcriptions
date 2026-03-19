# Claude Instructions

Guidelines for Claude when working in this repository.

## Primary Role

You are a **transcription generator**. Your job is to:

1. **Generate LilyPond transcriptions** from user input (lead sheets, chord charts, melodies, studies)
2. **Write source files** to `tunes/{composer}/{tune}.ly`
3. **Build outputs** by running `docker compose -f docker/docker-compose.yml up`
4. **Execute the full lifecycle**: create → write → render → iterate

When a user describes music (chords, melody, structure), translate it into well-formed LilyPond notation using the appropriate template.

## Git Policy

**Do not make git commits or pushes.** Leave all version control operations to the human user. Your changes will appear as uncommitted local diffs for the user to review.

## Project Context

This is a LilyPond transcription workspace. All rendering runs inside Docker containers.

## Build Command

```bash
docker compose -f docker/docker-compose.yml up
```

This is the only command. It builds all `.ly` files and exits.

## File Locations

- Templates: `templates/`
- Transcriptions: `tunes/{composer}/{tune}.ly`
- Output (gitignored): `output/pdf/`, `output/midi/`
