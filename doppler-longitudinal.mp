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
  wide := 0.7in;

  currentpen := pencircle scaled thin;

  v_over_c := 0.3;
  for t = 1 upto 3:
    draw (fullcircle scaled (2t * wide))
      shifted (v_over_c * t * wide, 0);
  endfor;

  xc := 2 v_over_c;
  xl := xc - 2;
  xr := xc + 2;
  yc := 3 v_over_c;
  yl := yc - 3;
  yr := yc + 3;
  drawdblarrow (xl * wide, 0) -- (yl * wide, 0);
  drawdblarrow (xr * wide, 0) -- (yr * wide, 0);

  draw (v_over_c * wide, -10thin) -- (v_over_c * wide, 35thin);
  draw (2 v_over_c * wide, 2.1 wide) -- (2 v_over_c * wide, 15thin);
  drawarrow ((v_over_c * wide) - 20thin, 25thin) --
    (v_over_c * wide, 25thin);
  drawarrow ((2 v_over_c * wide) + 20thin, 25thin) --
    (2 v_over_c * wide, 25thin);
  drawdblarrow (v_over_c * wide,0) -- ((1 + v_over_c) * wide, 0);

  label.lft (btex \(d\) etex, ((v_over_c * wide) - 20thin, 25thin));
  label.bot (btex \(r\) etex,
      0.5 (v_over_c * wide,0) + 0.5 ((1 + v_over_c) * wide, 0));
  label.bot (btex \(p\) etex,
      0.5 (xl * wide, 0) + 0.5 (yl * wide, 0));
  label.bot (btex \(q\) etex,
      0.5 (xr * wide, 0) + 0.5 (yr * wide, 0));

  currentpicture := currentpicture scaled 2;
endfig;

end.
