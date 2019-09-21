
local function handle_move( world, logger )
    return function( options )
        assert( options.who, "mover:handle_move:move event triggered without who option" )
        assert( options.direction, "mover:handle_move:move event triggered without direction option" )
        assert( options.time, "mover:handle_move:move event triggered without time option" )

        local target = world:get_mob( options.who )
        local direction = options.direction
        local time = options.time

        if not target then
            logger:err( "asked to move unknown mob: " .. options.who )
            return
        end

        if direction == 'west' then
            target.x = target.x - (target.move * time)
        elseif direction == 'north' then
            target.y = target.y - (target.move * time) 
        elseif direction == 'east' then
            target.x = target.x + (target.move * time) 
        elseif direction == 'south' then
            target.y = target.y + (target.move * time) 
        end
    end
end

local function init( event, world, logger )
    event:register_listener( "move", "mover", handle_move( world, logger ) )  
end

return { init = init }
