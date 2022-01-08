function addwind(_x,_y,_w,_h,_txt)
  local w={x=_x,
           y=_y,
           w=_w,
           h=_h,
           txt=_txt}
  add(wind,w)
  return w
 end
 
 function draw_windows()
  for w in all(wind) do
   local wx,wy,ww,wh=w.x,w.y,w.w,w.h
   rectfill2(wx,wy,ww,wh,0)
   rect(wx+1,wy+1,wx+ww-2,wy+wh-2,6)
   wx+=4
   wy+=4
   clip(wx,wy,ww-8,wh-8)
   if w.cur then
    wx+=6
   end
   for i=1,#w.txt do
    local txt,c=w.txt[i],6
    if w.col and w.col[i] then
     c=w.col[i]
    end
    print(txt,wx,wy,c)
    if i==w.cur then
     spr(255,wx-5+sin(time()),wy)
    end
    wy+=6
   end
   clip()
  
   if w.dur then
    w.dur-=1
    if w.dur<=0 then
     local dif=w.h/4
     w.y+=dif/2
     w.h-=dif
     if w.h<3 then
      del(wind,w)
     end
    end
   else
    if w.butt then
     oprint8("❎",wx+ww-15,wy-1+sin(time()),6,0)
    end
   end
  end
 end

function showmsg(txt,dur)
  local wid=(#txt+2)*4+7
  local w=addwind(63-wid/2,50,wid,13,{" "..txt})
  w.dur=dur
  w.butt=true
end