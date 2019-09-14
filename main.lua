
local kb_listen = require 'keyboard_listener'



-- this only gets called once at the beginning
function love.load()
    x = 10
    y = 10
    keyboard_listener = kb_listen.init() 
    local f = {}
    function f:keypress(key)
        if key == 'h' then
            x = x - 1
        elseif key == 'k' then
            y = y - 1
        elseif key == 'l' then
            x = x + 1
        elseif key == 'j' then
            y = y + 1
        end
    end
    function f:keyrelease(key)
    end
    kb_listen.set_mode( keyboard_listener, 'm', f )
end

-- this function is called continuously
-- dt is the delta time (in seconds?) of the last
-- time that the function was called
function love.update(dt)

end

-- this is the only function that the graphics functions
-- will work in
function love.draw()
    love.graphics.print( "@", x, y )
end

function love.mousepressed(x, y, button, istouch)
    
end

function love.mousereleased(x, y, button, istouch)

end

function love.keypressed(key)
    kb_listen.keypress( keyboard_listener, key )
end

function love.keyreleased(key)
    kb_listen.keyrelease( keyboard_listener, key )
end

function love.focus(in_focus)

end

function love.quit()

end
