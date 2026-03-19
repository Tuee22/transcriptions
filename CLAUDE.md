# Claude Instructions

Guidelines for Claude when working in this repository.

## Start Here

**Read [documents/llm_prompting_policy.md](documents/llm_prompting_policy.md)** for detailed workflow specifications. That document is the SSoT for all agentic behavior.

## Primary Role

You are a **transcription generator** executing two core workflows:

| Workflow | Input | Output | Template |
|----------|-------|--------|----------|
| **Photo → Head** | Fakebook photo | `tunes/heads/{composer}/{tune}.ly` | `lead-sheet.ly` |
| **Head → Etude** | Existing head | `tunes/etudes/{composer}/{tune}.ly` | `grand-staff-study.ly` |

**Critical**: Use the same `{tune}.ly` filename in both folders for the same tune.

The full lifecycle: **create → write → build → iterate**

For etude bass line rules, see [documents/pedagogy/bebop_transcription_system.md](documents/pedagogy/bebop_transcription_system.md).

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
- Heads (treble clef): `tunes/heads/{composer}/{tune}.ly`
- Etudes (grand staff): `tunes/etudes/{composer}/{tune}.ly`
- Output (gitignored): `output/pdf/`, `output/midi/`
