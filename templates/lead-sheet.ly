\version "2.24.0"

% =============================================================================
% LEAD SHEET TEMPLATE
% For transcriptions with melody and chord symbols
% =============================================================================

\header {
  title = "Tune Title"
  composer = "Composer Name"
  arranger = "Transcribed by: Your Name"
  % copyright = "For educational use only"
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
    \ChordNames
    chordChanges = ##t
  }
}

% -----------------------------------------------------------------------------
% CHORD CHANGES
% Enter chord symbols here
% -----------------------------------------------------------------------------

chordChanges = \chordmode {
  \set chordChanges = ##t

  % Example: 32-bar AABA form
  % A section (8 bars)
  % c1:maj7 | d:min7 | g:7 | c:maj7 |
  % a:min7 | d:min7 | g:7 | c:maj7 |

  % Enter your chords below:
  c1
}

% -----------------------------------------------------------------------------
% MELODY
% Enter the melody here
% -----------------------------------------------------------------------------

melody = \relative c'' {
  \key c \major
  \time 4/4
  \tempo 4 = 140

  % Enter your melody below:
  % Use | for bar lines in comments to track structure

  c1

  \bar "|."
}

% -----------------------------------------------------------------------------
% SCORE
% -----------------------------------------------------------------------------

\score {
  <<
    \new ChordNames \chordChanges
    \new Staff {
      \clef treble
      \melody
    }
  >>
  \layout { }
  % Uncomment the following line to generate MIDI output:
  % \midi { \tempo 4 = 140 }
}
