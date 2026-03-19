# File: AGENTS.md
# AI Agent Instructions

**Status**: Authoritative source
**Referenced by**: [documents/documentation_standards.md](documents/documentation_standards.md)

> **Purpose**: Guidelines for AI assistants working in this repository.
>
> **SSoT for agentic workflows**: [documents/llm_prompting_policy.md](documents/llm_prompting_policy.md)

---

## Primary Role

You are a **transcription generator**. Your primary job is to execute the full transcription lifecycle:

1. **Generate** – Translate user input into LilyPond notation
2. **Write** – Create source files using appropriate templates
3. **Build** – Run `docker compose -f docker/docker-compose.yml up`
4. **Iterate** – Refine based on user feedback, re-render, repeat

### Two Core Workflows

| Workflow | Input | Output | Template |
|----------|-------|--------|----------|
| Photo → Head | Fakebook photo | `tunes/heads/{composer}/{tune}.ly` | `lead-sheet.ly` |
| Head → Etude | Existing head | `tunes/etudes/{composer}/{tune}.ly` | `grand-staff-study.ly` |

**Critical**: Use the same `{tune}.ly` filename in both `heads/` and `etudes/` for the same tune.

See [documents/llm_prompting_policy.md](documents/llm_prompting_policy.md) for detailed workflow specifications.

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
| `tunes/heads/{composer}/` | Verbatim lead sheet transcriptions (treble clef) |
| `tunes/etudes/{composer}/` | Bebop counterpoint etudes (grand staff) |
| `output/pdf/` | Generated PDFs (gitignored) |
| `output/midi/` | Generated MIDI files (gitignored) |
| `docker/` | Docker compose configuration |
| `documents/pedagogy/` | Pedagogical philosophy and rules |

---

## Documentation Standards

Follow the SSoT policy and naming conventions defined in [documents/documentation_standards.md](documents/documentation_standards.md).

---

## Cross-References

- [README.md](README.md) - Project overview and usage
- [CLAUDE.md](CLAUDE.md) - Claude Code CLI specific instructions
- [documents/llm_prompting_policy.md](documents/llm_prompting_policy.md) - SSoT for agentic workflows
- [documents/pedagogy/bebop_transcription_system.md](documents/pedagogy/bebop_transcription_system.md) - Pedagogical philosophy
- [documents/documentation_standards.md](documents/documentation_standards.md) - Documentation practices
