filenametemplate "%j-%3c.mps";
prologues := 3;
verbatimtex
  \documentclass{article}
  \usepackage{ebgaramond-maths}
  \begin{document}
  etex

  beginfig(1);

  finalradius = 1.8in;
  finalshift = -0.8in;

  % Draw the same wavefront at two different times.
  currentpen := pencircle scaled 1pt;
  draw (halfcircle scaled 2 finalradius) rotated 180;
  draw (halfcircle scaled 2 (finalradius + 0.17in)) rotated 180;

  pair antenna, initial, start, final;
  antenna = (0,0);
  start = (0,-finalradius);
  final = (finalshift,-finalradius);

  currentpen := pencircle scaled 1pt;

  % Draw a transmission antenna.
  path antennapath;
  currentpen := pencircle scaled 1pt;
  antennapath = (fullcircle scaled 5pt) shifted antenna;
  fill antennapath;
  currentpen := pencircle scaled 1pt;
  draw (quartercircle scaled 15pt) shifted antenna rotated -45;
  draw (quartercircle scaled 15pt) shifted antenna rotated 135;
  draw (quartercircle scaled 25pt) shifted antenna rotated -45;
  draw (quartercircle scaled 25pt) shifted antenna rotated 135;

  currentpen := pencircle scaled 1pt;

  % Draw the moving object at its start position.
  path startpath;
  startpath = (fullcircle scaled 5pt) shifted start;
  fill startpath;

  % Draw the moving object at its final position.
  path finalpath;
  finalpath = (fullcircle scaled 5pt) shifted final;
  fill finalpath;

  % Draw a right triangle.
  currentpen := pencircle scaled 1pt;
  draw origin -- start;
  draw origin -- final;
  draw start -- final;

  label.lft(btex $c$ etex,
      (0.5 origin + 0.5 final) + (-4pt, 0));
  label.bot(btex $v$ etex,
      (0.7 start + 0.3 final) + (0, 0));
  label.rt(btex $d\lambda/dt=\sqrt{c^2-v^2}$ etex,
      (0.5 origin + 0.5 start) + (2pt, 0));

  currentpicture := currentpicture scaled 2;
endfig;

end.
