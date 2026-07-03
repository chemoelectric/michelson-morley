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
  wide := 1.5in;

  picture pnt;
  pnt := image(path pntpath;
    pntpath = (fullcircle scaled 3thin);
    fill pntpath;);

  a := 1.5;                     % semi-major axis
  b := 1;                       % semi-minor axis
  ae := sqrt(a*a - b*b);        % distance center to focus
  e := ae/a;                    % eccentricity
  p := b*b/a;                   % semi-latus rectum
  d := a/e;                     % distance center to directrix

%% If you add the distances from the foci to any point on the ellipse,
%% the sum equals 2a.

  s := 1.2;

  currentpen := pencircle scaled thin;
  draw (fullcircle xscaled (2a * wide) yscaled (2b * wide));

  draw pnt shifted (0,0);
  label.bot (btex \textit{center} etex, (0,0));

  draw pnt shifted (ae * wide, 0);
  label.bot (btex \textit{focus} etex, (ae * wide,0));

  draw pnt shifted (-ae * wide, 0);
  label.bot (btex \textit{focus} etex, (-ae * wide,0));

  currentpen := pencircle scaled 0.5thin;

  draw (0,0) -- (0, b * wide);
  label.rt (btex \(b\) etex, (0, 0.5b * wide));
  label (btex \textit{semi-minor axis} etex, (0,0)) rotated 90
    shifted (-8thin, 0.5b * wide);

  draw (0,0) -- (ae * wide, 0);
  label.bot (btex \(\sqrt{a^2 - b^2}\) etex, (0.5ae * wide, 0));

  draw (ae * wide, 0) -- (ae * wide, p * wide);
  label.rt (btex \(p = \frac{\,\,b^2}{a}\) etex,
      (ae * wide, 0.35p * wide));
  label (btex \textit{semi-latus rectum} etex, (0,0)) rotated 90
    shifted ((ae * wide) - 8thin, 0.5p * wide);

  draw (0, -20thin) -- (0, -s * b * wide);
  draw (a * wide, 10thin) -- (a * wide, -60thin);
  draw (0 * wide, -50thin) -- (a * wide, -50thin);
  label.bot (btex \(a\) etex, (0.5a * wide, -50thin));
  label.top (btex \textit{semi-major axis} etex,
      (0.5a * wide, -50thin));

  draw (0, (-s * b * wide) + 10thin) --
    (d * wide, (-s * b * wide) + 10thin);
  label.top (btex \(\frac{a}{e}\) etex,
      0.5 (0, (-s * b * wide) + 10thin) +
      0.5 (d * wide, (-s * b * wide) + 10thin));

  currentpen := pencircle scaled thin;

  draw (d * wide, s * b * wide) -- (d * wide, -s * b * wide);
  label (btex \textit{directrix} etex, (0,0)) rotated 90
    shifted ((d * wide) + 8thin, 0);
  
  draw (-d * wide, s * b * wide) -- (-d * wide, -s * b * wide);
  label (btex \textit{directrix} etex, (0,0)) rotated 90
    shifted ((-d * wide) - 8thin, 0);

  label (btex \( \left\{e=\frac{\sqrt{a^2 - b^2}}{a} \right \}
        \)\ \textit{eccentricity} etex,
      (1.4wide,1wide));

  currentpicture := currentpicture scaled 1.5;
endfig;

end.
