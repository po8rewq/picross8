-- game picross8
-- by revolgame

function _init()
  shake=0
  fadeperc=1
  dpal=explodeval("0,1,1,2,1,13,6,4,4,9,3,13,1,13,14")
  dirx=explodeval("-1,1,0,0,1,1,-1,-1")
  diry=explodeval("0,0,-1,1,-1,1,1,-1")
  wind={}

  min_board_size=3
  max_board_size=8
  board_size=max_board_size
  display_errors=true

  menu_pos=0
  _drw=draw_menu
  _upd=update_menu

  --greset()
end

function greset()
  init_game(board_size)
  _drw=draw_game
  _upd=update_game
end

function _draw()
  doshake()
  _drw()
  checkfade()
end

function _update()
  _upd()
end
