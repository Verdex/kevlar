
local util = require( 'util' )

local function letter_collider()
    local f = love.graphics.newFont();
    local radius = f:getHeight() / 3
    
    return { t = 'collider' 
           ; k = 'circle'
           ; r = radius 
           }
end

local function circle_collider( radius )
    return { t = 'collider'
           ; k = 'circle'
           ; r = radius
           }
end

local function point_collider()
    return { t = 'collider'
           ; k = 'circle'
           ; r = 1
           }
end

local function line_collider()
    return { t = 'collider'
           ; k = 'line'
           }
end

local function circle_circle_collision( a, b )
    local a_radius_squared = math.pow( a.r, 2 )
    local b_radius_squared = math.pow( b.r, 2 )
    local min_radius = math.min( a_radius_squared, b_radius_squared )

    return util.distance_squared( a, b ) < min_radius 
end

local function line_line_collision( a, b )

end

local function circle_line_collision( a, b )

end

local function collision( a, b )
    assert( a.t == 'collider', "encountered unknown type in collision: " .. a.t ) 
    assert( b.t == 'collider', "encountered unknown type in collision: " .. b.t ) 

    if a.k == 'circle' and b.k == 'circle' then
        return circle_circle_collision( a, b )
    elseif a.k == 'line' and b.k == 'line' then
        return line_line_collision( a, b )
    elseif a.k == 'cirlce' and b.k == 'line' then
        return circle_line_collision( a, b )
    elseif a.k == 'line' and b.k == 'circle' then
        return circle_line_collision( b, a )
    else
        error( "encountered unknown kind in collision: " .. a.k .. " ; " .. b.k )
    end
end

return { collision = collision
       ; circle_collider = circle_collider
       ; letter_collider = letter_collider
       ; point_collider = point_collider
       ; line_collider = line_collider
       }
