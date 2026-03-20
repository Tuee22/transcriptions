\version "2.24.0"

% =============================================================================
% JAZZ STYLE INCLUDE
% Real Book-style chord notation
% =============================================================================

% Include jazz chord exceptions (installed in Docker image)
% Note: lilyjazz.ily is incompatible with LilyPond 2.25+, using jazzchords.ily only
\include "jazzchords.ily"

% -----------------------------------------------------------------------------
% JAZZ PAPER SETTINGS
% -----------------------------------------------------------------------------

% Set staff size at top level (required by LilyPond 2.25+)
#(set-global-staff-size 20)

\paper {
  % LilyJazz fonts (LilyPond 2.25+ syntax)
  property-defaults.fonts.music = "lilyjazz"
  property-defaults.fonts.serif = "LilyJAZZ Text"
  property-defaults.fonts.sans = "LilyJAZZ Text"

  % Use slightly larger margins for jazz lead sheets
  top-margin = 12\mm
  bottom-margin = 12\mm
  left-margin = 12\mm
  right-margin = 12\mm

  % No indent on first system (common in Real Book)
  indent = 0

  % Don't stretch to fill last page
  ragged-last-bottom = ##t
  ragged-bottom = ##f
}

% -----------------------------------------------------------------------------
% JAZZ LAYOUT SETTINGS
% -----------------------------------------------------------------------------

\layout {
  % Score-level settings
  \context {
    \Score
    % Tighter spacing for jazz charts
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
    % Remove bar numbers (Real Book style)
    \omit BarNumber
  }

  % Chord name settings
  \context {
    \ChordNames
    % Only show chord when it changes
    chordChanges = ##t
    % Use jazz chord exceptions for notation (△, ø, etc.)
    chordNameExceptions = #(append
      (sequential-music-to-chord-exceptions JazzChordsList #t)
      ignatzekExceptions)
  }

  % Staff settings
  \context {
    \Staff
    % Thinner bar lines (jazz style)
    \override BarLine.hair-thickness = #1.5
  }
}

% -----------------------------------------------------------------------------
% HEADER FORMATTING
% -----------------------------------------------------------------------------

\header {
  % Remove default tagline
  tagline = ##f
}
