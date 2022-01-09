function update_game()
  if fadeperc==1 then return end
	update_cursor()
	check_endgame()
end

function update_cursor() --TODO: optimise 
  local nx,ny=p_x,p_y
  --dir={-1,1,-1,1}
  if btnp(⬅️) then
   nx-=1
  end
  if btnp(➡️) then
   nx+=1
  end
  if btnp(⬆️) then
   ny-=1
  end
  if btnp(⬇️) then
   ny+=1
  end
  
  p_x=mid(0,nx,board_size-1)
  p_y=mid(0,ny,board_size-1)
  
  local sv=state[p_y+1][p_x+1]
  if btnp(❎) then
    if display_errors then
      if sv==0 or sv==2 then
        if board[p_y+1][p_x+1]==2 then
          if sv!=1 then
            state[p_y+1][p_x+1]=1
            progress+=1
          end
        else
          if sv!=2 then
            state[p_y+1][p_x+1]=2
            errors+=1
          end
        end
      end
    else
      if board[p_y+1][p_x+1]==2 then
        if sv!=1 then
          state[p_y+1][p_x+1]=1
          progress+=1
        else
          state[p_y+1][p_x+1]=0
          progress-=1
        end
      else
        if sv==1 then
          state[p_y+1][p_x+1]=0
        else
          state[p_y+1][p_x+1]=1
        end
      end
    end
  elseif btnp(🅾️) then
    if display_errors then
      if sv==0 or sv==2 then
        if board[p_y+1][p_x+1]==1 then
         if sv!=3 then
          state[p_y+1][p_x+1]=3
         end
        else
         if sv!=2 then
          state[p_y+1][p_x+1]=2
          errors+=1
         end
        end
      end
    else --only if !display_errors
      if sv==3 then 
        state[p_y+1][p_x+1]=0 
      else
        state[p_y+1][p_x+1]=3
      end

      if board[p_y+1][p_x+1]==1 and sv!=3 then
        errors+=1
      end
    end
  end
 end
 
function check_endgame()
  if progress == total then
    fadeout()
    showmsg('congrats!', nil)
    _upd=update_endgame
    _drw=draw_endgame
  end
end

function update_endgame()
  if btnp(❎) then
    greset()
  end
end

function update_menu()
  if btnp(❎) then
    greset()
  end
  if btnp(⬇️) and menu_pos<1 then
    menu_pos+=1
  end
  if btnp(⬆️) and menu_pos>0 then
    menu_pos-=1
  end

  if btnp(➡️) then
    if menu_pos==0 then
      board_size+=1
      if board_size>max_board_size then
        board_size=min_board_size
      end
    elseif menu_pos==1 then
      display_errors=not display_errors
    end
  end
  if btnp(⬅️) then
    if menu_pos==0 then
      board_size-=1
      if board_size<min_board_size then
        board_size=max_board_size
      end
    elseif menu_pos==1 then
      display_errors=not display_errors
    end
  end
end