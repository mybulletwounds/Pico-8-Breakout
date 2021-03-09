pico-8 cartridge // http://www.pico-8.com
version 32
__lua__

-- Making a Breakout Style game in Pico-8
-- global variables
    -- ball variables
ball_x = 1
ball_y = 33
ball_dx = 2
ball_dy = 2
ball_r = 2
ball_dr = 0.4
    --paddle variables
pad_x = 52
pad_dx = 0
pad_y = 120
pad_w = 24
pad_h = 3
pad_speed = 1

function _init()
    cls()
end

function _update()
    
    ball_move()
    ball_check()
    pad_move()
    
end

function _draw()
    cls() -- clear the screen
    screen_background()

    ball()
    paddle()

end

--User Created Functions Below

function ball()
    circfill(ball_x,ball_y,ball_r,7)
end
function ball_move()
    ball_x += ball_dx
    ball_y += ball_dy
end
function ball_box(box_x, box_y,box_w,box_h)
    if (ball_y - ball_r) > (box_y + box_h) then
        print("test")
    end
    return false
end
function ball_check() --check to see if ball leaves the screen
    if ball_x > 127 or ball_x < 0 then
        ball_dx = -ball_dx
        sfx(0) 
    end
    
    if ball_y > 127 or ball_y <0 then
        ball_dy = -ball_dy
        sfx(0)
    end
    if ball_box(pad_x, pad_y, pad_w, pad_h) then
        --something
    end
end

function screen_background()
    rectfill(0,0,127,127,1)
    

end
function paddle()
    rectfill(pad_x,pad_y,(pad_x + pad_w),(pad_y + pad_h),14)

end
function pad_move()
    buttpress = false
    if btn(0) then --Left
        pad_dx -= pad_speed
        buttpress = true
    end
    
    if btn(1) then --Right
        pad_dx += pad_speed
        buttpress = true
    end
    if not(buttpress) then
        pad_dx /= 1.5 --floaty
    end
    pad_x += pad_dx
end



---NOTHING BELOW THIS--
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100001835018340183301832018310113001330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000000000910012100161001a1001d1001f1002110023100241002610027100291002810025100201000d10006100041000310002100011000110001100041000b1000d1000d10002100001000000000000
