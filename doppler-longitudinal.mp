filenametemplate "%j-%3c.mps";
prologues := 3;
verbatimtex
  \documentclass{article}
  \usepackage{ebgaramond}
  \usepackage{ebgaramond-maths}
  \begin{document}
  etex

  beginfig(1);

  thin := 1pt;
  wide := 1in;

  currentpen := pencircle scaled thin;

    % Draw a transmission antenna.
  picture antennasymbol;
  antennasymbol := image(
      pen antennasymbolsavedpen;
    antennasymbolsavedpen := currentpen;
    currentpen := pencircle scaled thin;
    path antennapath;
    antennapath = fullcircle scaled 5pt;
    fill antennapath;
    draw (quartercircle scaled 15thin) rotated 45;
    draw (quartercircle scaled 15thin) rotated -135;
    draw (quartercircle scaled 25thin) rotated 45;
    draw (quartercircle scaled 25thin) rotated -135;
    currentpen := antennasymbolsavedpen;
    );

  c := 3;
  v := 0.5;

  shift := v * wide;
  radiusone := c * wide;
  radiustwo := (c - v) * wide;

  pair antennaone, antennatwo;
  antennaone := (0,0);
  antennatwo := antennaone + (shift,0);

  pair pointbotone, pointbottwo;
  pointbotone := antennaone - (0,radiusone);
  pointbottwo := antennatwo - (0,radiustwo);

  draw antennasymbol shifted antennaone;
  draw antennasymbol shifted antennatwo;

  drawarrow ((0.2 wide,0) -- (-0.2 wide,0))
    shifted (antennaone + (0,-0.3 wide));
  label.bot(btex \(\beta\) etex,
      antennaone + (0,-0.3 wide));

  draw (fullcircle scaled 2 radiusone) shifted antennaone;
  draw (fullcircle scaled 2 radiustwo) shifted antennatwo;

  drawarrow (((0,0) -- pointbotone - antennaone) rotated -110)
    shifted antennaone;
  drawarrow (((0,0) -- pointbottwo - antennatwo) rotated 115)
    shifted antennatwo;

  currentpicture := currentpicture scaled 2;
endfig;

end.
