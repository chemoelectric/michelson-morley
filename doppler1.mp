filenametemplate "%j-%3c.mps";
prologues := 3;
verbatimtex
  \documentclass{article}
  \usepackage{ebgaramond}
  \usepackage{ebgaramond-maths}
  \begin{document}
  etex

  beginfig(1);

  color gray;
  gray := (0.05 white);

  thin := 1pt;
  wide := 3in;

  picture pnt;
  pnt := image(path pntpath;
    pntpath = (fullcircle scaled 3thin);
    fill pntpath;
    );

  picture antenna;
  antenna := image(draw pnt;
    for i = 1 upto 2:
      draw (subpath (2.5, 3.5) of (fullcircle scaled (i * 10thin)))
        withpen (pencircle scaled thin)
        withcolor gray;
      draw (subpath (2.5, 3.5) of (fullcircle scaled (i * 10thin)))
        rotated 180
        withpen (pencircle scaled thin)
        withcolor gray;
    endfor;
    );

  v := 0.6;
  gammasq := (1 - v) * (1 + v);
  gamma := sqrt(gammasq);

  pair center, focus;
  center := (0, 0);
  focus := (-v, 0);

  draw (fullcircle xscaled (2wide) yscaled (gamma * 2wide))
    shifted (center * wide);
  draw antenna shifted (center * wide);
  draw antenna shifted (focus * wide);

  draw (center * wide) -- (focus * wide)
    withcolor gray;
  label.bot (btex \(v\) etex,
      0.5 (center * wide) + 0.5 (focus * wide));

  draw (-v * wide, 10thin) --
    (-v * wide, -10thin + (-1.35gammasq) * wide)
    withcolor gray;
  draw (wide, 50thin) -- (wide, -10thin + (-1.35gammasq) * wide)
    withcolor gray;
  draw (-10thin - v * wide, -gammasq * wide) --
    (10thin - v * wide, -gammasq * wide)
    withcolor gray;
  draw (-wide, 0) -- (-v * wide, 0)
    withcolor gray;
  label.bot (btex \( 1 - v \) etex,
      0.5 (-wide, 0) + 0.5 (-v * wide, 0));
  draw (-v * wide, (-1.35gammasq) * wide) --
    (wide, (-1.35gammasq) * wide) withcolor gray;
  label.bot (btex \( 1 + v \) etex,
      0.5 (-v * wide, (-1.35gammasq) * wide) +
      0.5 (wide, (-1.35gammasq) * wide));

  draw (center * wide) -- ((center * wide) + (0, gamma * wide))
    withcolor gray;
  draw (focus * wide) -- ((center * wide) + (0, gamma * wide))
    withcolor gray;
  label.rt (btex \( \sqrt{ 1 - v^2 } \) etex,
      (0, gamma * 0.58 wide));
  label.rt (btex \( \sqrt{ ( 1 - v ) \, ( 1 + v ) } \) etex,
      (0, gamma * 0.42 wide));
  label.ulft (btex \( 1 \) etex, (-v * 0.5wide, gamma * 0.5wide));

  draw (center * wide) -- (center * wide) + (10thin, 0)
    withcolor gray;

  draw (focus * wide) -- ((focus * wide) + (-7.5thin, 0))
    withcolor gray;
  draw (focus * wide) -- ((focus * wide) + (0, -gammasq * wide))
    withcolor gray;
  label.rt (btex \( 1-v^2 \) etex,
      (-v * wide, -0.42 * gammasq * wide));
  label.rt (btex \( (1 - v) \, (1 + v) \) etex,
      (-v * wide, -0.58 * gammasq * wide));

  draw (wide - 10thin, 0) -- (wide + 10thin, 0) withcolor gray;
  draw (-wide - 10thin, 0) -- (-wide, 0) withcolor gray;
  draw (0, gamma * wide) -- (0, (gamma * wide) + 10thin)
    withcolor gray;
  draw (-40thin, gamma * wide) -- (40thin, (gamma * wide))
    withcolor gray;
  draw (center * wide) -- (center * wide) - (0, 10thin)
    withcolor gray;

  currentpicture := currentpicture scaled 1.5;
endfig;

end.
