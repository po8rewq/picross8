function _init()
  shake=0
  dpal=explodeval("0,1,1,2,1,13,6,4,4,9,3,13,1,13,14")
  dirx=explodeval("-1,1,0,0,1,1,-1,-1")
  diry=explodeval("0,0,-1,1,-1,1,1,-1")
  wind={}

  greset()
end

function greset()
  init_game(8)
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
