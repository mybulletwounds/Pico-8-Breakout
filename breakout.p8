pico-8 cartridge // http://www.pico-8.com
version 32
__lua__

-- Making a Breakout Style game in Pico-8


ball_x = 1
ball_y = 42
ball_dx = 2
ball_dy = 2
ball_r = 2
game_on = true
color = 10
--frame = 0

function _init()
    cls()
end

function _update()
    --frame += 1
    ball_x += ball_dx
    ball_y += ball_dy
    --ball_r = 2+(sin(frame/10))*2 --pulsating ball
    ball_check()

end

function _draw()
    cls() -- clear the screen
    screen_background()

    ball()

end

--Functions Below

function ball()
    circfill(ball_x,ball_y,ball_r,color)
end

function ball_check
    () --check to see if ball leaves the screen
    if ball_x > 127 or ball_x < 0 then
        ball_dx = -ball_dx
        sfx(0) 
    end
    if ball_y > 127 or ball_y <0 then
        ball_dy = -ball_dy
        sfx(0)
    end
end

function screen_background()
    rectfill(0,0,127,127,1)
    

end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100001835018340183301832018310113001330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
