input boxes
input rboxes

beginfig(23);
%
boxjoin(a.se=b.sw; a.ne=b.nw);
boxit.a(btex $ \cdots $ etex);
boxit.big(btex outline etex);
drawboxed(a, big);
label.bot("mark+", a.s);

z1 = a.n + (0, 8); % up
y2 = ypart z1;
x2 = xpart big.e + 8;
y3 = ypart big.e;
x3 = xpart big.e + 8;

drawarrow a.n -- z1 -- z2 .. z3 .. big.e;
endfig;

beginfig(24);
% boxjoin(a.se=b.sw; a.ne=b.nw);
boxit.a(btex $ \cdots $ etex);
boxit.big(btex outline etex);

big.sw - a.se = big.nw - a.ne = (12, 0);
drawboxed(a, big);
label.bot("mark+", a.s);

z1 = a.n + (0, 8); % up
y2 = ypart z1;
x2 = xpart big.e + 8;
y3 = ypart big.e;
x3 = xpart big.e + 8;

drawarrow a.n -- z1 -- z2 .. z3 .. big.e;

endfig;

beginfig(25);
  % illustrated dx dy
  boxit.bx(btex bx etex);
  bx.dx = 12;
  bx.dy = 16;
  z1 = bx.nw + (1, 2);
  z2 = bx.nw + (12, 1);
  z3 = bx.ne + (-1, 2);
  drawboxed(bx);
  draw bx.nw .. z1 .. z2 .. z3 .. bx.ne;
  label.top("dx", z2);

  z4 = bx.ne + (2, -1);
  z5 = bx.ne + (1, -16);
  z6 = bx.se + (2, 1);
  draw bx.ne .. z4 .. z5 .. z6 .. bx.se;
  label.rt("dy", z5);
endfig;

beginfig(26);
  draw (0cm,0cm)--(1cm,1cm) ; draw (1cm,0cm)--(0cm,1cm) ;
  picture pic ; pic := currentpicture ;
  draw pic shifted (3cm,0cm) ; draw pic shifted (6cm,0cm) ;
  pic := currentpicture ; draw pic shifted (0cm,2cm) withcolor red;
endfig;

vardef cluster(expr out)(expr s)(text sub) =
  save whole, prev;
  picture whole, prev;
  prev := currentpicture;
  currentpicture := nullpicture;
  boxjoin(a.ne + (5, 0) = b.nw; a.se + (5, 0) = b.sw);
  % boxjoin(a.ne=b.nw; a.se=b.sw);
  boolean isfirst;
  isfirst := true;
  forsuffixes $ = sub:
    string txt;
    txt := str $;
    rboxit$(txt);
    if isfirst:
      $.c = s;
      isfirst := false;
    fi
  endfor
  forsuffixes $$ = sub:
    drawboxed($$)
  endfor
  dotlabel.top(out, s + (1, 20));
  whole := currentpicture;
  % whole := whole shifted s;
  currentpicture := prev;
  whole
enddef;


% /usr/share/texlive/texmf-dist/metapost/base/boxes.mp
beginfig(27);
  picture clx[];
  clx[1] := cluster("B1")((0, 0))(b11, b12, b13);
  clx[2] := cluster("B2")((120, 0))(b21, b22);
  clx[3] := cluster("B3")((60, 100))(b31, b32, b33, b34);
  % clx[1].c + (20, 0) = clx[2].c;
  % clx[3].c = (clx[1].c + clx[2].c)/2 + (0, 10);
  % clx[2] := clx[2] shifted (120, 0);
  % clx[3] := clx[3] shifted (60, 100);
  addto currentpicture also clx[1];
  addto currentpicture also clx[2]; % shifted (120, 0);
  addto currentpicture also clx[3]; % shifted (60, 100);
  draw bbox clx[1] withcolor red;
  draw bbox clx[2] withcolor green;
  draw bbox clx[3] withcolor blue;
  drawarrow b11.n -- b34.s;
endfig;

end.
