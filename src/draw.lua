function draw_game()
  cls()
  if fadeperc==1 then return end

  draw_board(board_size)
  draw_state(state,board_size)
  draw_hints_x(hints_x,board_size)
  draw_hints_y(hints_y,board_size)
  draw_cursor(p_x,p_y)
  
  draw_ig_ui()
end

function draw_board(raws)
  local length=padding+raws*8
  for y=0,raws do
   local ly=padding+y*8
   line(padding,ly,length,ly,6)
   for x=0,raws do
    local lx=padding+x*8
    line(lx,padding,lx,length,6)
   end
  end
end
 
function draw_cursor(_x,_y)
  local x0=padding+_x*8
  local y0=padding+_y*8
  rect(x0,y0,x0+8,y0+8,9)
end
 
function draw_hints_x(hints,raws)
  local current_values=get_hint_x(state,raws,1)

  for i=1,#hints do
   local lh=hints[i]
   local color=7
   if array_equals(lh, current_values[i]) then
    color=5
   end

   for j=1,#lh do
    print(
     hints[i][j],
     padding-8*(#lh)+(j-1)*8,
     padding+(i-1)*8+2,
     color
    )
   end
  end
end
 
function draw_hints_y(hints,raws)
  local current_values=get_hint_y(state,raws,1)

  for i=1,#hints do
   local lh=hints[i]
   local color=7
   if array_equals(lh, current_values[i]) then
    color=5
   end

   for j=1,#lh do 
    print(
     hints[i][j],
     padding+(i-1)*8+2,
     padding-8*(#lh)+(j-1)*8,
     color
    )
   end
  end
end
 
function draw_state(state,raws)
  for y=1,raws do
   for x=1,raws do
    local x0=padding+x*8-7
    local x1=x0+6
    local y0=padding+y*8-7
    local y1=y0+6
    
    local cell_value=state[y][x]
    if cell_value==1 then
      rectfill(x0,y0,x1,y1,3)
    elseif cell_value==2 then
      rectfill(x0,y0,x1,y1,7)
      print("x",x0+2,y0+1,8)
    elseif cell_value==3 then
      rectfill(x0,y0,x1,y1,15)
    end
   end
  end
end
 
function draw_ig_ui()
  print("\x97 full \x8e empty", 35, 112, 7)
end

function draw_endgame()
  cls()
  if fadeperc==1 then return end
  draw_windows()
end

function draw_menu()
  cls()
  map()

  local v=sin(time())
  local bx=27+v
  local by=40+menu_pos*10
  line(bx,by,bx,by+4,7)
  line(bx+1,by+1,bx+1,by+3,7)
  line(bx+2,by+2,bx+2,by+2,7)

  print("grid size: ", 35, 40, 5)
  print(board_size, 79, 40, menu_pos==0 and 7 or 5)

  print("show errors: ", 35, 50, 5)
  print(display_errors and "yes" or "no", 87, 50, menu_pos==1 and 7 or 5)

  print("press \x97 when ready", 25, 81+v, 5)
  print("press \x97 when ready", 25, 80+v, 7)
end