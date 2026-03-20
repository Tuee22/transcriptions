\version "2.24.0"

% =============================================================================
% LEAD SHEET TEMPLATE
% For transcriptions with melody and chord symbols
% Real Book style with LilyJazz fonts
% =============================================================================

% Include jazz styling (fonts, layout, chord notation)
\include "includes/jazz-style.ily"

\header {
  title = "Tune Title"
  composer = "Composer Name"
  arranger = "Transcribed by: Your Name"
  % copyright = "For educational use only"
}

% -----------------------------------------------------------------------------
% PAPER AND LAYOUT OVERRIDES
% (Base settings come from jazz-style.ily)
% -----------------------------------------------------------------------------

\paper {
  #(set-paper-size "letter")
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
