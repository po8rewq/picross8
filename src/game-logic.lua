function init_game(v)
  p_x,p_y=0,0
  board_size=v
  padding=64-board_size*8/2+5
  reset_board(board_size)
  hints_x=get_hint_x(board,board_size)
  hints_y=get_hint_y(board,board_size)
end

function reset_board(raws)
  board={}
  state={} -- 0:not played, 1:mine, 2:error, 3:empty
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

function check_full(i,j,solution,streak,v,list)
  if solution[i+1][j+1]!=v then
    if streak>0 then
      add(list,streak)
    end
    streak=0
  else
    streak+=1
  end
  return streak
end
 
function get_hint_y(solution,raws,v)
  if v==nil then v=2 end
  local hints={}
  for j=0,raws-1 do
    local streak=0
    local list={}
    for i=0,raws-1 do
      streak = check_full(i,j,solution,streak,v,list)
    end
    if streak>0 or #list==0 then
      add(list,streak)
    end
    add(hints,list)
  end
  return hints
end
 
function get_hint_x(solution,raws,v)
  if v==nil then v=2 end
  local hints={}
  for i=0,raws-1 do
   local streak=0
   local list={}
   for j=0,raws-1 do
    streak = check_full(i,j,solution,streak,v,list)
   end
   if streak>0 or #list==0 then
    add(list,streak)
   end
   add(hints,list)
  end
  return hints
end

function array_equals(a,b)
  if #a!=#b then return false end
  for i=1,#a do
    if a[i]!=b[i] then
      return false
    end
  end
  return true
end