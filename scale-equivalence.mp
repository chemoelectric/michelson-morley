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
  wide := 3in;

  currentpen := pencircle scaled thin;

  beta := 1/6 wide;
  one := wide;
  root_one_minus_betasq := sqrt(1 - 1/36) * wide;
  theta := angle(root_one_minus_betasq, beta);
  
  pair corner, top, right;
  corner := (0,0);
  top := corner + (0,beta);
  right := corner + (root_one_minus_betasq,0);

  draw corner -- top;
  draw top -- right;
  draw corner -- right;

  pair p, q;
  tics := 10;
  for i = 1 upto tics - 1:
    a := i / tics;
    b := 1 - a;
    p := (a * right) + (b * corner);
    q := p + (0, (xpart(right) - xpart(p)) * sind(theta));
    draw (p -- q) withpen pencircle scaled 0.5thin;
  endfor;

  label.lft(btex \( v/c \) etex,
      (0.5 corner + 0.5 top) - (2thin,0));
  label.urt(btex \( 1 \) etex,
      (0.5 top + 0.5 right) + (0,2thin));
  label.bot(btex \( \sqrt{1 - (v/c)^2} \) etex,
      (0.5 corner + 0.5 right) - (0,1thin));

  d := 1/30 wide;
  draw (corner + (0,d) -- corner + (d,d));
  draw (corner + (d,0) -- corner + (d,d));

  currentpicture := currentpicture scaled 2;
endfig;

end.
