pico-8 cartridge // http://www.pico-8.com
version 35
__lua__

game_mode = {}

game_mode.main = {}
function game_mode.main.draw()
 cls(0)
	player_draw()
 ui_draw()
 world_draw()
end
function game_mode.main.update()
	player_movement()
end

game_mode.dead = {}
function game_mode.dead.draw()
 cls(0)
 print("dead")
  print("press any button", 64,64,7)
end

function game_mode.dead.update()
	if (btnp()>0) then
	 start_game()
	 set_game_mode("main")
	end
end

current_update = game_mode.main.update
current_draw = game_mode.main.draw

function _update()
 current_update()
end

function _draw()
 current_draw()
end
		
function _init()
 start_game()
end
	
function start_game()
	world_create()
	player_create()
end
-->8
--player

player_qs = {}

function player_create()
 player_qs = create_random_q_s()
end

player_x=28 player_y = 28

function player_movement()
 if (btnp(0)) then
  player_qs.s.x -= 1
 end
 if (btnp(1)) then
  player_qs.s.x += 1
 end
 if (btnp(2)) then
  player_qs.s.y -= 1
 end
 if (btnp(3)) then 
  player_qs.s.y += 1
 end
 -- left
 if (player_qs.s.x < 0) then
 	if (player_qs.q.x > 0) then
 	 player_qs.s.x = 9
 	 player_qs.q.x -= 1
 	else
 	 player_qs.s.x += 1
 	end
 end
 -- right
 if (player_qs.s.x > 9) then
 	if (player_qs.q.x < 9) then
 	 player_qs.s.x = 0
 	 player_qs.q.x += 1
 	else
 	 player_qs.s.x -= 1
 	end
 end
 -- up
 if (player_qs.s.y < 0) then
 	if (player_qs.q.y > 0) then
 	 player_qs.s.y = 9
 	 player_qs.q.y -= 1
 	else
 	 player_qs.s.y += 1
 	end
 end
 -- down
 if (player_qs.s.y > 9) then
 	if (player_qs.q.y < 9) then
 	 player_qs.s.y = 0
 	 player_qs.q.y += 1
 	else
 	 player_qs.s.y -= 1
 	end
 end
 if (is_collision(player_qs)) then
  set_game_mode("dead")
 end
end

function player_draw()
 playerloc = sector_to_x_y(
  player_qs.s
 )
 print("q: "..player_qs.q.x..','..player_qs.q.y)
 print("s: "..player_qs.s.x..','..player_qs.s.y)
 spr(1,playerloc.x,playerloc.y)
end

-->8
--world

--quadrant major
-- sector minor

world_planets = {}
world_scale = 9;

function world_create()
 world_planets_create()
end

function world_planets_create()
 planets_to_create = create_random(10,20)
 planets_created = 0
 while (
  planets_created
   < planets_to_create 
  ) do
  planet = create_random_q_s()
  if not(is_collision(planet)) then
   add(world_planets,planet)
  end
  planets_created += 1
 end
end


function world_draw()
 drawplanets()
end
function drawplanets()
 current_q = player_qs.q
 for planet in all(world_planets) do
	 if (planet.q.x == current_q.x and planet.q.y == current_q.y) then
	  planetloc = sector_to_x_y(
		  planet.s
		 )
   spr(6,planetloc.x,planetloc.y)
	 end
	end

 --circfill(getloc(4),getloc(6),2,4)
end
-->8
-- ui
ui_left_padding = 32
function ui_draw()
 drawgrid()
end
function drawgrid()
	for x=27,117,9 do
	 line(x,27,x,117,7)
	 line(27,x,117,x,7) 
	end
end
-->8
-- helpers

function create_random(min, max)
 return flr(rnd(max)) + min
end
	
function create_random_q_or_s()
 return {
 	x = create_random(0, 10),
 	y = create_random(0, 10)
	}
end

function create_random_q_s()
 return {
  q= create_random_q_or_s(),
  s= create_random_q_or_s()
 }
end
	
function sector_to_x_y(sector)
	return {
	 x=getloc(sector.x),
	 y=getloc(sector.y)
	}
end
	
function getloc(position)
	return (ui_left_padding
	 + world_scale
	 * position)
	 - 4
end


function do_objects_collide_x_y(obj_one, obj_two)
 return obj_one.x == obj_two.x 
  and obj_one.y == obj_two.y
end

function do_objects_collide_s_q(obj_one, obj_two)
 return do_objects_collide_x_y(
  obj_one.q,
  obj_two.q
 ) and do_objects_collide_x_y(
  obj_one.s,
  obj_two.s
 )
end

function debug(position)
 print(position.q.x..position.q.y..position.s.x..position.s.y)
end

function is_collision(position)
  for planet in all(world_planets) do
	 if (do_objects_collide_s_q(
	  position,
	  planet)) then
	  return true
	 end
	end
	return false
end

function set_game_mode(mode)
 current_update = game_mode[mode].update
 current_draw = game_mode[mode].draw
end
__gfx__
00000000007777008880888870000007000000000000000000333300000000000000000000000000000000000000000000000000000000000000000000000000
000000000777777087707788330000cc00088000000000000cc3ccc0000000000000000000000000000000000000000000000000000000000000000000000000
0070070007777770770007787333ccc73003300300000000c3ccc3cc000000000000000000000000000000000000000000000000000000000000000000000000
0007700000777700770007787033cc073003300340066004333cc333000000000000000000000000000000000000000000000000000000000000000000000000
0007700000077000707070787703c07733033033606666063333c33c000000000000000000000000000000000000000000000000000000000000000000000000
0070070008077080000700087700007733533533606666063333c3cc000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777700077700077700777035335306666666603ccccc0000000000000000000000000000000000000000000000000000000000000000000000000
00000000070770700888888877700777003333006666666600c33300000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000006066660600000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000060060000000000000000000000000000000000000000000000000000000000000000000000000000000000
