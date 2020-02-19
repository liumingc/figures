input boxes
input rboxes

beginfig(1);

vardef diadmondit@#(text tt) =
  beginbox_("diadpath_", "sizebox_", @#, tt);
  % copy from boxes circleit
  generic_declare(pair) _n.n, _n.s, _n.e, _n.w;
  @#e-@#c = @#c-@#w = (@#dx,0) + .5*(lrcorner pic_@#-llcorner pic_@#);
  @#n-@#c = @#c-@#s = (0,@#dy) + .5*(ulcorner pic_@#-llcorner pic_@#);
  endbox_(clearc_,@#)
enddef;

%boxjoin(a.se=b.ne+(0,12); a.sw=b.nw+(0,12));
boxjoin(a.c=b.c+(0,23));
rboxit.a1(btex begin etex);
%boxit.a1(btex begin etex);
boxit.a2(btex prepare etex);
diadmondit.a3(btex ready? etex);
%boxit.a3(btex ready? etex);
boxit.a4(btex then part etex);
rboxit.a5(btex end etex);
%boxit.a5(btex end etex);

% 
%boxjoin(a.ne+(20, 0)=b.nw; a.se+(20, 0)=b.sw);
boxjoin(a.c+(30, 0)=b.c);
boxit.a6(btex else-part etex);
a6.nw = a4.ne + (20, 0);
a6.sw = a4.se + (20, 0);

a4.dx = 12bp;
for i:=1 upto 6:
  if i = 3:
    drawunboxed(a[i])
  else:
    drawboxed(a[i])
  fi
endfor

draw a3.e -- a3.n -- a3.w -- a3.s -- cycle;

for i:=1 upto 4:
  drawarrow a[i].s -- a[i+1].n;
endfor
x7 = xpart a6.c; y7 = ypart a3.c;
x8 = xpart a6.c; y8 = ypart a5.c;
drawarrow a6.s -- z8 -- a5.e;
drawarrow a3.e -- z7 -- a6.n;

label.lft("Y", .5[a3.s, a4.n]);
label.top("N", .5[a3.e, z7]);

endfig;
end
