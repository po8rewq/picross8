 function init_game(v)
  fadeperc=1
  p_x,p_y=0,0
  board_size=v
  padding=64-board_size*8/2+5
  reset_board(board_size)
  hints_x=get_hint_x(board,board_size)
  hints_y=get_hint_y(board,board_size)
end

function reset_board(raws)
  board={}
  state={}
  total=0
  progress=0
  errors=0
  for y=0,raws-1 do
   r={}
   rs={}
   for x=0,raws-1 do
    local random = ceil(rnd(2))
    add(r,random)
    add(rs,0)
    total+=(random-1)
   end
   add(board,r)
   add(state,rs)
  end
end
 
function get_hint_y(solution,raws)
  local hints={}
  for j=0,raws-1 do
   local streak=0
   local list={}
   for i=0,raws-1 do
    if solution[i+1][j+1]<2 then
     if streak>0 then
      add(list,streak)
     end
     streak=0
    else
     streak+=1
    end
   end
   if streak>0 then
    add(list,streak)
   elseif #list==0 then
    add(list,0)
   end
   add(hints,list)
  end
  return hints
end
 
function get_hint_x(solution,raws)
  local hints={}
  for i=0,raws-1 do
   local streak=0
   local list={}
   for j=0,raws-1 do
    if solution[i+1][j+1]<2 then
     if streak>0 then
      add(list,streak)
     end
     streak=0
    else
     streak+=1
    end
   end
   if streak>0 then
    add(list,streak)
   elseif #list==0 then
    add(list,0)
   end
   add(hints,list)
  end
  return hints
end