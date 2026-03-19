\version "2.24.0"

% =============================================================================
% GRAND STAFF STUDY TEMPLATE
% For piano transcriptions and technical studies
% =============================================================================

\header {
  title = "Study Title"
  composer = "Composer Name"
  opus = "From: Album/Recording"
  arranger = "Transcribed by: Your Name"
  tagline = ##f
}

% -----------------------------------------------------------------------------
% PAPER AND LAYOUT
% -----------------------------------------------------------------------------

\paper {
  #(set-paper-size "letter")
  top-margin = 15\mm
  bottom-margin = 15\mm
  left-margin = 15\mm
  right-margin = 15\mm
  indent = 0
  ragged-last-bottom = ##t
}

\layout {
  \context {
    \Score
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
  }
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
  \tempo "Medium Swing" 4 = 140

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
