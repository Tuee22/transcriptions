\version "2.24.0"

% =============================================================================
% GRAND STAFF STUDY TEMPLATE
% For piano transcriptions and technical studies
% Real Book style with LilyJazz fonts
% =============================================================================

% Include jazz styling (fonts, layout, chord notation)
\include "includes/jazz-style.ily"

\header {
  title = "Study Title"
  composer = "Composer Name"
  opus = "From: Album/Recording"
  arranger = "Transcribed by: Your Name"
}

% -----------------------------------------------------------------------------
% PAPER AND LAYOUT OVERRIDES
% (Base settings come from jazz-style.ily)
% -----------------------------------------------------------------------------

\paper {
  #(set-paper-size "letter")
}

\layout {
  \context {
    \PianoStaff
    \accepts ChordNames
  }
}

% -----------------------------------------------------------------------------
% CHORD CHANGES (optional, for harmonic reference)
% -----------------------------------------------------------------------------

chordChanges = \chordmode {
  \set chordChanges = ##t

  % Enter chord symbols if desired:
  c1
}

% -----------------------------------------------------------------------------
% RIGHT HAND
% -----------------------------------------------------------------------------

rightHand = \relative c'' {
  \key c \major
  \time 4/4
  \tempo "Moderato" 4 = 140

  % Enter right hand part below:
  % Typical voicings, melody lines, fills

  c1

  \bar "|."
}

% -----------------------------------------------------------------------------
% LEFT HAND
% -----------------------------------------------------------------------------

leftHand = \relative c {
  \key c \major
  \time 4/4

  % Enter left hand part below:
  % Bass lines, rootless voicings, comping patterns

  c1

  \bar "|."
}

% -----------------------------------------------------------------------------
% DYNAMICS (optional - placed between staves)
% -----------------------------------------------------------------------------

dynamics = {
  % s = spacer rest, use for positioning dynamics
  % Example: s1\mp s1 s1\< s1\f
  s1
}

% -----------------------------------------------------------------------------
% SCORE
% -----------------------------------------------------------------------------

\score {
  <<
    \new ChordNames \chordChanges
    \new PianoStaff <<
      \new Staff = "right" {
        \clef treble
        \rightHand
      }
      \new Dynamics \dynamics
      \new Staff = "left" {
        \clef bass
        \leftHand
      }
    >>
  >>
}
