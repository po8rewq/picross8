function debug(txt)
  printh(txt, "log")
end

function dofade()
  local p,kmax,col,k=flr(mid(0,fadeperc,1)*100)
  for j=1,15 do
    col = j
    kmax=flr((p+j*1.46)/22)
    for k=1,kmax do
      col=dpal[col]
    end
    pal(j,col,1)
  end
end
 
function checkfade()
  if fadeperc>0 then
    fadeperc=max(fadeperc-0.04,0)
    dofade()
  end
end
 
function wait(_wait)
  repeat
    _wait-=1
    flip()
  until _wait<0
end
 
function fadeout(spd,_wait)
  if (spd==nil) spd=0.04
  if (_wait==nil) _wait=0
  repeat
    fadeperc=min(fadeperc+spd,1)
    dofade()
    flip()
  until fadeperc==1
  wait(_wait)
end

function explode(s)
  local retval,lastpos={},1
  for i=1,#s do
    if sub(s,i,i)=="," then
      add(retval,sub(s, lastpos, i-1))
      i+=1
      lastpos=i
    end
  end
  add(retval,sub(s,lastpos,#s))
  return retval
end
 
function explodeval(_arr)
  return toval(explode(_arr))
end
 
function toval(_arr)
  local _retarr={}
  for _i in all(_arr) do
    add(_retarr,flr(tonum(_i)))
  end
  return _retarr
end
 
function doshake()
  local shakex,shakey=16-rnd(32),16-rnd(32)
  camera(shakex*shake,shakey*shake)
  shake*=0.95
  if (shake<0.05) shake=0
end

function oprint8(_t,_x,_y,_c,_c2)
  for i=1,8 do
    print(_t,_x+dirx[i],_y+diry[i],_c2)
  end 
  print(_t,_x,_y,_c)
end

function rectfill2(_x,_y,_w,_h,_c)
  rectfill(_x,_y,_x+max(_w-1,0),_y+max(_h-1,0),_c)
end