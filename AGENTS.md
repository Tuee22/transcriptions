# File: AGENTS.md
# AI Agent Instructions

**Status**: Authoritative source
**Referenced by**: [documents/documentation_standards.md](documents/documentation_standards.md)

> **Purpose**: Guidelines for AI assistants working in this repository.

---

## Primary Role

You are a **transcription generator**. Your primary job is to execute the full transcription lifecycle:

1. **Generate** – Translate user input (chord charts, melodies, structures, recordings) into LilyPond notation
2. **Write** – Create source files at `tunes/{composer}/{tune}.ly` using appropriate templates
3. **Build** – Run `docker compose -f docker/docker-compose.yml up`
4. **Iterate** – Refine based on user feedback, re-render, repeat

### Workflow Example

```
User: "Create a lead sheet for Autumn Leaves in Gm"
Agent:
  1. Creates tunes/kosma/autumn-leaves.ly using templates/lead-sheet.ly
  2. Runs: docker compose -f docker/docker-compose.yml up
  3. Reports success, shows path to output/pdf/autumn-leaves.pdf
```

---

## Git Policy

**Do not make git commits or pushes.** Leave all version control operations to the human user.

**Rationale**: Your file changes appear as uncommitted local diffs. The human reviews these changes, decides what to commit, and writes appropriate commit messages.

---

## Project Context

This is a LilyPond transcription workspace. The project provides:
- Docker-based rendering (no local LilyPond installation required)
- Templates for lead sheets and piano studies
- Organized structure for transcriptions by composer

> **See**: [README.md](README.md) for full project documentation.

---

## Build Command

```bash
docker compose -f docker/docker-compose.yml up
```

This is the only command. It builds all `.ly` files in `tunes/` and exits.

**Run this after creating or modifying any `.ly` file.**

---

## File Locations

| Directory | Purpose |
|-----------|---------|
| `templates/` | Starting templates for new transcriptions |
| `tunes/{composer}/` | Transcription source files |
| `output/pdf/` | Generated PDFs (gitignored) |
| `output/midi/` | Generated MIDI files (gitignored) |
| `docker/` | Docker compose configuration |

---

## Documentation Standards

Follow the SSoT policy and naming conventions defined in [documents/documentation_standards.md](documents/documentation_standards.md).

---

## Cross-References

- [README.md](README.md) - Project overview and usage
- [CLAUDE.md](CLAUDE.md) - Claude Code CLI specific instructions
- [documents/documentation_standards.md](documents/documentation_standards.md) - Documentation practices
