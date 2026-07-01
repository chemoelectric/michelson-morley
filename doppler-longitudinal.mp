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
  wide := 0.5in;

  currentpen := pencircle scaled thin;

  picture receding_antenna;
  receding_antenna := image (
    c := 1;
    for i := 1 upto 3:
      r := i;
      draw (fullcircle xscaled (c * r * 2wide) yscaled (c * 2wide));
    endfor;
    path cntrpath;
    cntrpath = (fullcircle scaled 3thin);
    fill cntrpath;
    drawarrow (0.3wide,0) -- (3.5wide,0);
    );

  picture approaching_antenna;
  approaching_antenna := image (
    c := 0.5;
    for i = 1 upto 3:
      r := i;
      draw (fullcircle xscaled (c * r * 2wide) yscaled (c * 3 * 2wide));
    endfor;
    path cntrpath;
    cntrpath = (fullcircle scaled 3thin);
    fill cntrpath;
    drawarrow (-2wide,0) -- (-0.3wide,0);
    );

  draw receding_antenna shifted (0,0);
  draw approaching_antenna shifted (0,-3wide);

  currentpicture := currentpicture scaled 2;
endfig;

end.
