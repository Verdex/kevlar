
local key = require 'keyboard'
local log = require 'log'
local wor = require 'world'



-- this only gets called once at the beginning
function love.load()
    logger = log.debug_logger()
    world = wor.init()
    
    x = 10
    y = 10
    keyboard = key.init() 
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
    keyboard:set_mode( 'm', f )
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
    keyboard:keypress( key )
end

function love.keyreleased(key)
    keyboard:keyrelease( key )
end

function love.focus(in_focus)

end

function love.quit()
    logger:close()
end
