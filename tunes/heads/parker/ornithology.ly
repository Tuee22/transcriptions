\version "2.24.0"

\include "../../../templates/includes/jazz-style.ily"

\header {
  title = "Ornithology"
  composer = "Charlie Parker / Bennie Harris"
  arranger = "Transcribed by: Codex"
}

\paper {
  #(set-paper-size "letter")
}

chordChanges = \chordmode {
  \set chordChanges = ##t
  s8

  \repeat volta 2 {
    g1:maj7 | g1:maj7 | g1:m7 | c1:7 | f1:maj7 |
    f1:maj7 | f1:m7 | bes1:7 | ees1:7 | a2:m7.5- d2:7 |
  }
  \alternative {
    {
      g2:m7 d2:7 | b2:m7 e2:7 | a1:m7 | d1:7 |
    }
    {
      g1 | c2:m7 f2:7 | b2:m7 bes2:m7 | a2:m7 aes2:7 | g1 |
    }
  }
}

melody = {
  \key g \major
  \time 4/4
  \tempo 4 = 200
  \partial 8 d'8

  \repeat volta 2 {
    g'8 a'8 b'8 c''8 d''8 b'8 c''8 d''8 |
    b'8 g'8 r4 r4 r8 d'8 |
    g'8 a'8 bes'8 c''8 d''8 e''8 b'4~ |
    b'8 g'8 a'8 bes'8~ bes'4. c''8 |

    c''8 a'4 f'8 bes'8 aes'8 a'8 c''8 |
    r2 r8 r8 bes'8 c''8~ |
    c''4 a'8 f'8 g'8 a'8 g'8 d'8 |
    f'4 ees'8 c'8 r4 r8 bes'8~ |
    bes'4 g'8 bes'8 c''8 d''8 c''8 a'8 |
    a'4 g'8 e'8 r4 r8 d'8 |
  }
  \alternative {
    {
      g'8 f'8 d'8 bes8 e'8 d'8 ees'8 d'8 |
      d''4 r4 r8 a'8 b'8 c''8~ |
      c''8 r4 r8 a'8~ a'8 g'8 f'8 |
      fis'8 a'8 c''8 ees''8~ ees''4 d''8 b'8 |
    }
    {
      g'8 a'8 e'8 d'8 r2 |
      r2 r8 bes'8 c''8 d''8 |
      b'8 d''8 fis''8 d''8 bes'8 ges'8 ees'8 des'8 |
      a'8 c''8 e''8 c''8 aes'8 c''8 ees''8 des''8 |
      b'8 r8 r4 r2 |
    }
  }

  \bar "|."
}

\bookOutputSuffix "head"

\score {
  <<
    \new ChordNames \chordChanges
    \new Staff {
      \clef treble
      \melody
    }
  >>
  \layout { }
}
