
local example = require 'example'
local kb_listen = require 'keyboard_listener'



-- this only gets called once at the beginning
function love.load()
    keyboard_listener = kb_listen.init() 
end

-- this function is called continuously
-- dt is the delta time (in seconds?) of the last
-- time that the function was called
function love.update(dt)

end

-- this is the only function that the graphics functions
-- will work in
function love.draw()
    example.x()
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
