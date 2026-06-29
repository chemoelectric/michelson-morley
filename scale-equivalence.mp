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

  v := 0.5 wide;
  c := 3 wide;

  pair corner, top, right;
  corner := (0,0);
  top := corner + (0,v);
  right := corner + (c,0);

  draw corner -- top;
  draw top -- right;
  draw corner -- right;

  label.lft(btex \( v/c \) etex,
      (0.5 corner + 0.5 top));
  label.urt(btex \( 1 \) etex,
      (0.5 top + 0.5 right));
  label.bot(btex \( \sqrt{1 - (v/c)^2} \) etex,
      (0.5 corner + 0.5 right));

  currentpicture := currentpicture scaled 2;
endfig;

end.
