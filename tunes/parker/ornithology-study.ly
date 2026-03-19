\version "2.24.0"

% =============================================================================
% ORNITHOLOGY STUDY
% Based on the Charlie Parker composition
% This is a study/practice template - not a full transcription
% =============================================================================

\header {
  title = "Ornithology Study"
  composer = "Charlie Parker"
  opus = "Based on 'How High the Moon' changes"
  arranger = "Transcribed by: [Your Name]"
  tagline = ##f
}

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
% Standard 32-bar AABA form
% -----------------------------------------------------------------------------

chordChanges = \chordmode {
  \set chordChanges = ##t

  % A section (8 bars)
  g1:maj7 | g1:maj7 | g1:min7 | c1:7 |
  f1:maj7 | f1:maj7 | f1:min7 | bes1:7 |

  % A section repeat (8 bars)
  ees1:maj7 | ees1:maj7 | a1:min7.5- | d1:7 |
  g1:maj7 | g1:maj7 | a1:min7 | d1:7 |

  % B section (8 bars) - bridge
  g1:min7 | g1:min7 | c1:7 | c1:7 |
  f1:maj7 | f1:maj7 | f1:min7 | bes1:7 |

  % A section final (8 bars)
  ees1:maj7 | ees1:maj7 | a1:min7.5- | d1:7 |
  g1:maj7 | a2:min7 d2:7 | g1:maj7 | a2:min7 d2:7 |
}

% -----------------------------------------------------------------------------
% MELODY
% Placeholder - add head or solo transcription here
% -----------------------------------------------------------------------------

melody = \relative c'' {
  \key g \major
  \time 4/4
  \tempo 4 = 200

  % ==========
  % A SECTION
  % ==========

  % Bar 1-4: Opening phrase
  r1 | r1 | r1 | r1 |

  % Bar 5-8
  r1 | r1 | r1 | r1 |

  % ==========
  % A SECTION (repeat)
  % ==========

  % Bar 9-12
  r1 | r1 | r1 | r1 |

  % Bar 13-16
  r1 | r1 | r1 | r1 |

  % ==========
  % B SECTION (bridge)
  % ==========

  % Bar 17-20
  r1 | r1 | r1 | r1 |

  % Bar 21-24
  r1 | r1 | r1 | r1 |

  % ==========
  % A SECTION (final)
  % ==========

  % Bar 25-28
  r1 | r1 | r1 | r1 |

  % Bar 29-32: Turnaround
  r1 | r1 | r1 | r1 |

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
}
