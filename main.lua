
local keyboard_mod = require 'keyboard'
local log_mod = require 'log'
local world_mod = require 'world'
local event_mod = require 'event'
local mover_mod = require 'mover'



-- this only gets called once at the beginning
function love.load()
    logger = log_mod.debug_logger()
    world = world_mod.init()
    event = event_mod.init( logger )
    keyboard = keyboard_mod.init() 

    mover_mod.init( event, world, logger )
    
    hero_id = world:create_mob( { x = 10 ; y = 10 } )
    
    local movement_mode = keyboard_mod.init_movement_mode( event, hero_id )

--[[    x = 10
    y = 10
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
    end--]]
    keyboard:set_mode( 'm', movement_mode )
end

-- this function is called continuously
-- dt is the delta time (in seconds?) of the last
-- time that the function was called
function love.update(dt)

end

-- this is the only function that the graphics functions
-- will work in
function love.draw()
    local h = world:get_mob( hero_id )
    love.graphics.print( "@", h.x, h.y )
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
