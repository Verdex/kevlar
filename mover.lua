
local function handle_move( world, logger )
    return function( options )
        assert( options.who, "mover:handle_move:move event triggered without who option" )
        assert( options.direction, "mover:handle_move:move event triggered without direction option" )

        logger:info( "handling move" )

        local target = world:get_mob( options.who )
        local direction = options.direction

        if not target then
            logger:err( "asked to move unknown mob: " .. options.who )
            return
        end

        if direction == 'west' then
            target.x = target.x - 1
        elseif direction == 'north' then
            target.y = target.y - 1
        elseif direction == 'east' then
            target.x = target.x + 1
        elseif direction == 'south' then
            target.y = target.y + 1
        end
    end
end

local function init( event, world, logger )
    event:register_listener( "move", "mover", handle_move( world, logger ) )  
end

return { init = init }
