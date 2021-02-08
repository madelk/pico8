pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

music(0) -- play music from pattern 0
X = 60  Y = 90 MOTION=false
FRAME = 0
function _update()
MOTION = false
DIRECTIONRIGHT = false
 if (btn(0)) then X=X-1; MOTION=true; DIRECTIONRIGHT=true end
 if (btn(1)) then X=X+1; MOTION=true; DIRECTIONRIGHT=false  end
--  if (btn(2)) Y=Y-1 
--  if (btn(3)) Y=Y+1
end
function _draw()
  cls(5)
  map(0, 0, 0, 0, 128, 32)
--   print("this is pico-8", 37, 70, 14)
--   print("nice to meet you", 34, 80, 12)
--   spr(1, 64-4, 90) -- draw heart sprite
butt = 0
if (MOTION == true) then 
    FRAME = FRAME + 1
    if (FRAME < 4) then
        butt = 1
    elseif (FRAME < 8) then
        butt = 2
    elseif (FRAME < 12) then
        butt = 1
    elseif (FRAME < 16) then
        butt = 3
    elseif (FRAME < 20) then
        butt = 1
        FRAME = 0
    end
else FRAME = 0
    butt = 2
end
    print(butt, X, Y-12, 12)
  spr(butt, X, Y, 1,2, DIRECTIONRIGHT, false) -- draw heart sprite
end
__gfx__
000ff000000ff000000ff000000ff0000cc00cc04400440044004400000000000000000000000000000000000000000000000000000000000000000000000000
00ffff0000ffff0000ffff0000ffff00cc00cc004400440044004400000000000000000000000000000000000000000000000000000000000000000000000000
00ffff0000ffff0000ffff0000ffff00c00cc00c4400440044004400000000000000000000000000000000000000000000000000000000000000000000000000
000ff000000ff000000ff000000ff00000cc00cc4400440044444444000000000000000000000000000000000000000000000000000000000000000000000000
007777000077770000777700007777000cc00cc04400440044444444000000000000000000000000000000000000000000000000000000000000000000000000
07777770007777000077770000777700cc00cc004400440044444444000000000000000000000000000000000000000000000000000000000000000000000000
07777770007777000077770000777700c00cc00c4400440044444444000000000000000000000000000000000000000000000000000000000000000000000000
7777777700777700077777700777777000cc00cc4400440044004400000000000000000000000000000000000000000000000000000000000000000000000000
7771177700777700f711177ff771117f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77111177001771000f11117ff711117f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ff1111ff001ff1000011110000111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01111110000110000011110000111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01100110000110000111111001111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01100110000110004110011141100111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01100110000110004400044144000441000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04400440000444000400004404000044000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0505050505050505050505050505050500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0505050505050505050505050505050500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0505050505050505050505050505050500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0505050505050505050505050505050500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0505050505050505050505050505050500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0505050505050505050505050505050500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0505050505050505050505050505050500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0505050505050505050505050505050500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606060606060606060606060600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0404040404040404040404040404040400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0404040404040404040404040404040400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0404040404040404040404040404040400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0404040404040404040404040404040400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0001000004750047500675008750097500b7400b7400c7400c7400c1500e1500f15012150131501615018150191501b1401d1401f1401f1401f1401e04021050220502405025040270502b0502d0502f05034050
001000001905030000200500000000000000000000000000000001a050000000000025050000000000000000000000000000000000002a05000000000000000000000000001e0500000000000000000000000000
__music__
00 01424344

