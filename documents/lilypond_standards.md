# File: documents/lilypond_standards.md
# LilyPond Standards

**Status**: Authoritative source
**Referenced by**: [CLAUDE.md](../CLAUDE.md), [llm_prompting_policy.md](llm_prompting_policy.md)

> **Purpose**: SSoT for reading sheet music and writing LilyPond notation, enabling accurate transcription from fakebook images.

---

## 1. Reading the Treble Clef Staff

### Staff Lines and Spaces

The treble clef (G clef) defines G4 on the second line from the bottom.

**Lines** (bottom to top):
| Line | Note | Mnemonic |
|------|------|----------|
| 1st (bottom) | E4 | Every |
| 2nd | G4 | Good |
| 3rd (middle) | B4 | Boy |
| 4th | D5 | Does |
| 5th (top) | F5 | Fine |

**Spaces** (bottom to top):
| Space | Note | Mnemonic |
|-------|------|----------|
| 1st (bottom) | F4 | F |
| 2nd | A4 | A |
| 3rd | C5 | C |
| 4th (top) | E5 | E |

### Ledger Lines

Notes above or below the staff use ledger lines:
- One ledger line above staff: A5
- Two ledger lines above: C6
- One ledger line below staff: C4 (middle C)
- Two ledger lines below: A3

### Visual Reference

```
     ──F5──  (top line)
       E5    (top space)
     ──D5──
       C5
     ──B5──  (middle line)
       A4
     ──G4──  (2nd line - G clef wraps here)
       F4
     ──E4──  (bottom line)
```

---

## 2. Key Signatures

Key signatures indicate which notes are consistently sharped or flatted.

### Sharp Keys (Circle of Fifths)

| Key | Sharps | Notes Affected |
|-----|--------|----------------|
| C major | 0 | (none) |
| G major | 1 | F# |
| D major | 2 | F#, C# |
| A major | 3 | F#, C#, G# |
| E major | 4 | F#, C#, G#, D# |
| B major | 5 | F#, C#, G#, D#, A# |

### Flat Keys (Circle of Fourths)

| Key | Flats | Notes Affected |
|-----|-------|----------------|
| C major | 0 | (none) |
| F major | 1 | Bb |
| Bb major | 2 | Bb, Eb |
| Eb major | 3 | Bb, Eb, Ab |
| Ab major | 4 | Bb, Eb, Ab, Db |
| Db major | 5 | Bb, Eb, Ab, Db, Gb |

### Accidentals

- **Sharp (#)**: raises pitch by one half-step
- **Flat (b)**: lowers pitch by one half-step
- **Natural**: cancels a sharp or flat (from key signature or earlier in measure)

Accidentals apply for the remainder of the measure unless cancelled.

---

## 3. LilyPond Pitch Notation

### Absolute vs Relative Mode

LilyPond supports two pitch modes:

**Absolute mode**: Each note specifies its exact octave
```lilypond
{ c' d' e' f' g' a' b' c'' }  % C4 to C5
```

**Relative mode** (recommended): Each note is relative to the previous
```lilypond
\relative c' { c d e f g a b c }  % Same as above
```

### Octave Reference Table

| Scientific | LilyPond | Staff Position |
|------------|----------|----------------|
| C2 | c, | Bass clef, 2 ledger lines below |
| C3 | c | Bass clef, middle |
| C4 | c' | Middle C (1 ledger line below treble) |
| C5 | c'' | Treble clef, 3rd space |
| C6 | c''' | 2 ledger lines above treble |

### Relative Mode Rules

In `\relative`, LilyPond finds the nearest pitch to the previous note:

1. **Default**: Choose the pitch within a fourth of the previous note
2. **Octave up**: Add `'` (apostrophe) to force up an octave
3. **Octave down**: Add `,` (comma) to force down an octave

**Critical rule**: If the interval exceeds a perfect fourth, LilyPond chooses the nearer octave.

### Example: Tracing Relative Pitches

```lilypond
\relative c'' {
  g,8 |        % G4 (down from C5 reference, comma forces lower)
  a b c d |    % A4 B4 C5 D5 (all ascending by step)
  e4 r8 |      % E5 (quarter), rest
  a, |         % A4 (comma needed: E5 to A5 is P4 up, but we want A4)
}
```

### Common Octave Mistakes

| Intent | Wrong | Correct | Why |
|--------|-------|---------|-----|
| A4 after E5 | `a` | `a,` | Default `a` after `e` = A5 (P4 up) |
| G4 after C5 | `g` | `g,` | Default `g` after `c` = G4 (P4 down) - actually OK! |
| C5 after G4 | `c` | `c` or `c'` | Default `c` after `g` = C5 (P4 up) - OK |

---

## 4. Rhythm Notation

### Duration Values

| Note | LilyPond | Beats (4/4) | Symbol |
|------|----------|-------------|--------|
| Whole | 1 | 4 | o |
| Half | 2 | 2 | d |
| Quarter | 4 | 1 | q |
| Eighth | 8 | 0.5 | e |
| Sixteenth | 16 | 0.25 | s |

### Dotted Notes

A dot adds 50% of the note's value:
- Dotted half (`d.` or `2.`) = 3 beats
- Dotted quarter (`q.` or `4.`) = 1.5 beats
- Dotted eighth (`8.`) = 0.75 beats

### Duration Persistence

In LilyPond, duration persists until changed:
```lilypond
c8 d e f |  % All eighths: c8 d8 e8 f8
g4 a |      % Both quarters: g4 a4
b2 |        % Half note
```

### Beat Counting Verification

Always verify each bar sums to the time signature:
- **4/4**: 4 beats = 8 eighths = 16 sixteenths
- **3/4**: 3 beats = 6 eighths
- **Cut time (2/2)**: 2 half-note beats

**Bar check**: Use `|` to mark bar lines. LilyPond warns if beats don't match.

---

## 5. Jazz Chord Notation

### Real Book Chord Symbols

| Symbol | Meaning | LilyPond | Example |
|--------|---------|----------|---------|
| maj7 or triangle | Major 7th | `:maj7` | `c:maj7` |
| m7 or -7 | Minor 7th | `:m7` | `c:m7` |
| 7 | Dominant 7th | `:7` | `c:7` |
| m7b5 or o/ | Half-diminished | `:m7.5-` | `c:m7.5-` |
| dim7 or o | Diminished 7th | `:dim7` | `c:dim7` |
| sus4 | Suspended 4th | `:sus4` | `c:sus4` |
| add9 | Added 9th | `:add9` | `c:add9` |
| 9 | Dominant 9th | `:9` | `c:9` |

### Chord Mode Syntax

```lilypond
chordChanges = \chordmode {
  \set chordChanges = ##t  % Only show when chord changes

  % One chord per bar (whole note duration)
  g1:maj7 | g:m7 | c:7 | f:maj7 |

  % Two chords per bar (half note duration)
  d2:m7 g:7 | c1:maj7 |

  % Chord alterations
  a:m7.5- | d:7.9- |  % half-dim, dominant with b9
}
```

### Chord Extensions and Alterations

| Alteration | LilyPond | Meaning |
|------------|----------|---------|
| b5 | `.5-` | Flatted fifth |
| #5 | `.5+` | Sharped fifth |
| b9 | `.9-` | Flatted ninth |
| #9 | `.9+` | Sharped ninth |
| #11 | `.11+` | Sharped eleventh |
| b13 | `.13-` | Flatted thirteenth |

---

## 6. Common Transcription Errors

### Octave Registration

**Problem**: Notes render in wrong octave
**Symptoms**: Melody sounds/looks an octave too high or low
**Solution**:
1. Check `\relative` starting point
2. Trace through each note's octave
3. Add `'` or `,` as needed for large intervals

### Beat Alignment

**Problem**: LilyPond bar check warnings
**Symptoms**: "Bar check failed at: X/Y"
**Solution**:
1. Count beats in the problematic bar
2. Ensure total = time signature
3. Check that rests have explicit durations after note duration changes

### Missing Accidentals

**Problem**: Wrong pitches due to key signature assumptions
**Solution**:
1. Key signature handles diatonic notes automatically
2. Only mark **alterations** from the key (chromatic notes)
3. Use `is` for sharp, `es` for flat: `fis` = F#, `bes` = Bb

### Duration Inheritance

**Problem**: Notes have wrong durations
**Solution**:
1. Remember duration persists until changed
2. After a long note (half, whole), explicitly set the next duration
3. Example: after `c2`, write `d8` not just `d` for an eighth

---

## 7. Transcription Workflow

### Step 1: Identify Key and Time

1. Count sharps/flats in key signature
2. Note time signature (usually 4/4 for jazz)
3. Set in LilyPond:
```lilypond
\key g \major  % 1 sharp = G major
\time 4/4
```

### Step 2: Map Staff Position to Pitch

For each note:
1. Is it on a line or space?
2. Which line/space? (Count from bottom)
3. Any accidentals?
4. Check against key signature

### Step 2b: Verify Intervals (Critical!)

**Before writing each interval, verify it by counting staff positions:**

| Interval | Staff Positions Skipped | Visual Pattern |
|----------|------------------------|----------------|
| 2nd (step) | 0 | Adjacent line/space |
| 3rd | 1 | Line to next line, or space to next space |
| 4th | 2 | Line skipping one line |
| 5th | 3 | Line skipping two lines |
| 6th | 4 | Line skipping three lines |
| Octave | 7 | Line to same line position |

**Example verification**:
- G (2nd line) to A (2nd space) = 2nd (adjacent positions)
- G (2nd line) to D (4th line) = 5th (skipping 2nd space, 3rd line, 3rd space)
- G (2nd line) to B (3rd line) = 3rd (skipping 2nd space)

**Common error**: Confusing 2nds for 5ths. Always count the staff positions, don't guess.

### Step 3: Determine Rhythm

1. Note head filled or open? (quarter+ vs half/whole)
2. Stem present? (not whole note)
3. Flags or beams? (eighths, sixteenths)
4. Dots? (adds 50%)

### Step 4: Write LilyPond

1. Start with `\relative c''` for treble clef melodies
2. Write pitches with durations
3. Add bar checks `|`
4. Run LilyPond to verify

### Step 5: Verify Output (Bar-by-Bar)

**Critical validation process**:

1. **Build after every 2-4 bars** - don't transcribe the whole tune before checking
2. **Side-by-side comparison** - open source image and PDF together
3. **Check each bar visually**:
   - Do note positions match the source?
   - Are stems going the same direction?
   - Are beaming groups identical?
4. **Fix any bar check warnings immediately** - these indicate beat count errors
5. **Verify interval shapes** - ascending/descending patterns should look the same

**If notes look wrong**:
1. Re-read the staff position (count lines/spaces from bottom)
2. Check if you confused a 2nd for a 5th (or vice versa)
3. Verify the `\relative` reference point
4. Check for missing accidentals

**Never proceed to the next section until current bars match exactly.**

---

## 8. Jazz Style Configuration

### Including Jazz Fonts

```lilypond
\version "2.24.0"
\include "includes/jazz-style.ily"
```

### Real Book Layout

```lilypond
\paper {
  #(set-paper-size "letter")
  indent = 0
  ragged-last-bottom = ##t
}
```

---

## Cross-References

- [llm_prompting_policy.md](llm_prompting_policy.md) - Agentic transcription workflow
- [pedagogy/bebop_transcription_system.md](pedagogy/bebop_transcription_system.md) - Etude creation rules
- [templates/lead-sheet.ly](../templates/lead-sheet.ly) - Lead sheet template
- [templates/grand-staff-study.ly](../templates/grand-staff-study.ly) - Grand staff template
