# File: documents/documentation_standards.md
# Documentation Standards

**Status**: Authoritative source
**Referenced by**: AGENTS.md

> **Purpose**: SSoT for documentation practices in this repository.

---

## 1. SSoT Policy

- Every concept has exactly one canonical document; all others link to it.
- Mark authoritative docs with `**Status**: Authoritative source` and include `Supersedes`/`Referenced by` when relevant.
- Variant/overlay docs must list deltas only and link back to the base SSoT.
- Do not duplicate examples, procedures, or long explanations—link instead.
- Brief reminders (1-3 sentences) are acceptable only with a link to the SSoT.

---

## 2. Folder Structure

```
transcriptions/
├── documents/           # Documentation standards and guides
├── templates/           # LilyPond template files
├── tunes/{composer}/    # Transcriptions organized by composer
├── docker/              # Docker compose configuration
└── output/              # Generated files (gitignored)
```

---

## 3. Naming Conventions

**Primary rule**: Use snake_case for documentation files.

**Exceptions**: `AGENTS.md`, `CLAUDE.md`, and `README.md` (at any directory depth) may use uppercase.

**Additional rules**:
- Descriptive, unabbreviated names (`documentation_standards.md` over `docs.md`)
- No version numbers in filenames
- Keep grouping stems in snake_case names (e.g., `cli_commands.md`)

---

## 4. Required Header Metadata

Every authoritative document should include:

```markdown
# File: documents/example.md
# Document Title

**Status**: [Authoritative source | Reference only | Deprecated]
**Supersedes**: old-file.md (if applicable)
**Referenced by**: related-file.md (when known)

> **Purpose**: 1-2 sentence role of the doc.
```

Do **not** include recency stamps (update markers, dated changelogs); git history is the single source of truth for recency.

---

## 5. Cross-Referencing Rules

- Use relative links with section anchors when possible
- Bidirectional links recommended when two docs depend on each other
- Do not leave dead links; validate links after moves/renames

---

## 6. Mermaid Diagram Standards

**Compatibility-first** (GitHub, VSCode, Mermaid Live).

**Orientation**: TB by default; LR only for ≤3 sequential steps.

**Allowed**:
- `flowchart TB|LR`
- Nodes: `[ ] ( ) { }`
- Solid arrows: `-->`
- Arrow labels (inline or via intermediate nodes, but not mixed)

**Forbidden**:
- Dotted lines, subgraphs, thick arrows
- Special characters (`: () {}` and hyphens) in labels
- Comments inside diagrams
- Mixed arrow styles in one diagram

**Testing checklist**: Validate in GitHub preview, VSCode Mermaid extension, and Mermaid Live before committing.

---

## Cross-References

- [README.md](../README.md) - Project overview and usage
- [CLAUDE.md](../CLAUDE.md) - Claude Code CLI instructions
- [AGENTS.md](../AGENTS.md) - General AI agent guidelines
