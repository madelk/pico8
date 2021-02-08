pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
lives = 3
score = 0
local paddle = {
	x=52,
	y=122,
	w=24,
	h=4
}
function paddle:move()
	if btn(0) then
		paddle.x-=3
	elseif btn(1) then
		paddle.x+=3
	end
end

local ball = {
	x=64,
	y=64,
	s=3,
	xd=5,
	yd=-3
}
function ball:move()
	if ball.y>128 then
		ball.y=24
		lives -= 1
		if lives > 0 then
			sfx(2)
		else
			ball.y = 64
			sfx(3)
			return
		end
	end
	
	local bounced = false
	if ball.x<ball.s then
		ball.xd=-ball.xd
		bounced = true
	end
	if ball.x>128-ball.s then
		ball.xd=-ball.xd
		bounced = true
	end
	if ball.y<ball.s then
		ball.yd=-ball.yd
		bounced = true
	end
	if ball.x>=paddle.x and
		ball.x<=paddle.x+paddle.w and
		ball.y>paddle.y-paddle.h then
		ball.yd=-ball.yd
	 	sfx(1)
	 	score += 10
	end
	if bounced then
		sfx(0)
	end
	
	ball.x+=ball.xd
	ball.y+=ball.yd
end

function _update()
	if lives == 0 then
		if btn(5) then
			lives = 3
		end
		return
	end
	paddle.move()
	ball.move()
end

function _draw()
	
	if lives == 0 then
		rectfill(0,0,128,128,1)
		print("score: "..score,50,60,15)
		print("press x for new game",20,70,15)
		return
	end
	
	--clear screen
	rectfill(0,0,128,128,3)
	
	
	--paddle
	rectfill(
		paddle.x,
		paddle.y,
		paddle.x+paddle.w,
		paddle.y+paddle.h,
		15
	)
	
	--ball
	circfill(ball.x,ball.y,ball.s,15)

	--score
	print(score,12,6,15)
	
	--lives
	for i=1,lives do
		spr(001,90+i*8,4)
	end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000ee0ee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700eeeeeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000eeeeeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000eeeee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000eee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000200003107010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d00002207026000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000600002207019070120700c07007070050700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d0000160701607010070100700b0700b07010070100700b0700b07010070100701507015070040000400000000000000000000000000000000000000000000000000000000000000000000000000000000000
0010000010070100700f0701007011070110700e0700e0700d0700e0700c070010000507003070010700300002000010000100000000000000000000000000000000000000000000000000000000000000000000
__music__
00 44424344

