# File: documents/llm_prompting_policy.md
# LLM Prompting Policy

**Status**: Authoritative source
**Referenced by**: [AGENTS.md](../AGENTS.md), [CLAUDE.md](../CLAUDE.md)

> **Purpose**: SSoT for agentic roles, responsibilities, and workflows in this repository.

---

## Primary Function

LLM agents in this repository serve as **transcription generators** executing an agentic workflow to produce bebop learning materials. There are two distinct workflows:

1. **Photo → Head**: Convert fakebook photos to verbatim lead sheets
2. **Head → Etude**: Generate bebop counterpoint etudes from existing heads

---

## Workflow 1: Photo → Head

**Input**: User-provided photo of a fakebook page or lead sheet

**Output**: `tunes/heads/{composer}/{tune}.ly`

**Process**:
1. User uploads a photo of a lead sheet or fakebook page
2. Agent extracts melody and chord symbols verbatim
3. Agent writes treble-clef-only LilyPond file to `tunes/heads/{composer}/{tune}.ly`
4. Agent runs build: `docker compose -f docker/docker-compose.yml up`
5. Agent presents output for user review

**Requirements**:
- Treble clef only (no bass)
- Verbatim transcription of source material
- Preserve exact rhythms, articulations, and chord symbols
- Use `templates/lead-sheet.ly` as template

---

## Workflow 2: Head → Etude

**Input**: Existing head file at `tunes/heads/{composer}/{tune}.ly`

**Output**: `tunes/etudes/{composer}/{tune}.ly`

**Process**:
1. Agent reads the head file
2. Agent generates counterpoint bass line following [bebop_transcription_system.md](pedagogy/bebop_transcription_system.md)
3. Agent writes grand staff LilyPond file to `tunes/etudes/{composer}/{tune}.ly`
4. Agent runs build: `docker compose -f docker/docker-compose.yml up`
5. Agent presents output for user review

**Requirements**:
- Grand staff format (treble + bass)
- Melody from head (verbatim)
- Half-time bass on beats 1 and 3
- Walking bass option (beats 1, 2, 3, 4)
- Use `templates/grand-staff-study.ly` as template
- Follow counterpoint rules in [bebop_transcription_system.md](pedagogy/bebop_transcription_system.md)

---

## File Naming Rules

**Critical**: The same `{tune}.ly` filename must be used across both folders for the same tune.

| Folder | Path | Content |
|--------|------|---------|
| heads | `tunes/heads/{composer}/{tune}.ly` | Treble clef, chord symbols |
| etudes | `tunes/etudes/{composer}/{tune}.ly` | Grand staff with counterpoint |

**Examples**:
- `tunes/heads/parker/ornithology.ly` → `tunes/etudes/parker/ornithology.ly`
- `tunes/heads/monk/round-midnight.ly` → `tunes/etudes/monk/round-midnight.ly`

**Note**: Any files in `tunes/{composer}/` (without `heads/` or `etudes/` prefix) are legacy and should be migrated to the correct subfolder.

---

## Build Workflow

After creating or modifying any `.ly` file:

```bash
docker compose -f docker/docker-compose.yml up
```

This builds all files in `tunes/` (including subdirectories) and outputs to `output/pdf/` and `output/midi/`.

---

## Quality Standards

### For Heads
- Exact reproduction of source material
- No interpretation or embellishment
- Correct key signature and time signature
- Accurate chord symbols

### For Etudes
- Bass line follows pedagogical rules in [bebop_transcription_system.md](pedagogy/bebop_transcription_system.md)
- Half-time anchors on beats 1 and 3
- Stepwise motion prioritized
- Chromatic approach tones where idiomatic
- Contrary motion with melody preferred

---

## Agent Behavior

### Do
- Execute the full lifecycle: create → write → build → iterate
- Use appropriate templates
- Follow file naming conventions exactly
- Report build success/failure

### Do Not
- Make git commits or pushes
- Deviate from source material in heads
- Invent melodic content
- Skip the build step

---

## Cross-References

- [documents/pedagogy/bebop_transcription_system.md](pedagogy/bebop_transcription_system.md) — Pedagogical philosophy and transcription rules
- [AGENTS.md](../AGENTS.md) — General AI agent instructions
- [CLAUDE.md](../CLAUDE.md) — Claude Code CLI instructions
- [templates/lead-sheet.ly](../templates/lead-sheet.ly) — Template for heads
- [templates/grand-staff-study.ly](../templates/grand-staff-study.ly) — Template for etudes
