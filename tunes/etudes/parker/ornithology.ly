\version "2.24.0"

\include "../../../templates/includes/jazz-style.ily"

\header {
  title = "Ornithology"
  composer = "Charlie Parker / Bennie Harris"
  opus = "Bebop Etude"
  arranger = "Etude by: Codex"
}

\paper {
  #(set-paper-size "letter")
}

\layout {
  \context {
    \PianoStaff
    \accepts ChordNames
  }
}

chordChanges = \chordmode {
  \set chordChanges = ##t
  s8

  g1:maj7 | g1:maj7 | g2:m7 c2:7 | f1:maj7 |
  f2:m7 bes2:7 | ees1:7 | a2:m7.5- d2:7 | g1:m7 |
  d1:7 | b2:m7 e2:7 | a2:m7 d2:7 | g1 |
  c2:m7 f2:7 | b2:m7 bes2:m7 | a2:m7 aes2:7 | g1 |
  a2:m7 d2:7 |
}

rightHand = {
  \key g \major
  \time 4/4
  \tempo "Up" 4 = 200
  \partial 8 d'8

  g'8 a'8 b'8 c''8 b'8 g'8 a'8 b'8 |
  c''8 a'8 r4 r4 r8 d'8 |
  g'8 a'8 bes'8 c''8 e''8 g'8 bes'8 c''8~ |
  c''4. c''8 a'8 c''4 f'8 |

  bes'8 aes'8 a'8 c''8 c''8 a'8 fis'8 g'8 |
  a'8 g'8 e'4 r8 r8 bes'8~ bes'8 |
  bes'4 g'8 ees'8 a8 g8 e8 d8 |
  g8 a8 c'8 ees'8 e'8 ees'8 bes8 c'8 |

  d'4 r4 r8 a'8 b'8 c''8~ |
  c''8 r4 r8 a'8~ a'8 g'8 f'8 |
  gis'8 a'8 b'8 d''8~ d''4 c''8 a'8 |
  a'8 r4 r8 a'8~ a'8 g'8 fis'8 |

  fis'8 a'8 c''8 ees''8~ ees''4 d''8 b'8 |
  g'8 a'8 e'8 d'8 r2 |
  b'8 d''8 fis''8 d''8 bes'8 ges'8 ees'8 des'8 |
  a'8 c''8 e''8 c''8 aes'8 c''8 ees''8 des''8 |
  b'8 r8 r4 r2 |

  \bar "|."
}

leftHand = {
  \key g \major
  \time 4/4
  \partial 8 r8

  g,4 b,4 d4 fis4 |
  g4 fis4 e4 d4 |
  g,4 bes,4 c4 e4 |
  f4 a4 c'4 ees'4 |

  f4 aes4 bes4 d'4 |
  ees'4 d'4 des'4 c'4 |
  a4 c'4 ees'4 fis'4 |
  g4 bes4 d'4 fis'4 |

  d4 fis4 a4 c'4 |
  b,4 d4 e4 gis4 |
  a,4 c4 d4 fis4 |
  g,4 b,4 d4 f4 |

  c4 ees4 f4 a4 |
  b,4 d4 bes,4 des4 |
  a,4 c4 aes,4 c4 |
  g,4 b,4 d4 fis4 |
  a,4 c4 d4 fis4 |

  \bar "|."
}

dynamics = {
  \partial 8 s8
  s1*17
}

\bookOutputSuffix "etude"

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
  \layout { }
  \midi { \tempo 4 = 200 }
}
