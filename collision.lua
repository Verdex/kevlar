
local function letter_collider( letter )
    local f = love.graphics.newFont();
    local height = f:getHeight()
    local width = f:getWidth( letter )
    
    return { t = 'collider' 
           ; k = 'rectangle'
           ; h = height
           ; w = width
           }
end

local function rectangle_collider( width, height )
    return { t = 'collider' 
           ; k = 'rectangle'
           ; h = height
           ; w = width
           }
end

local function circle_collider( radius )
    return { t = 'collider'
           ; k = 'circle'
           ; r = radius
           }
end

local function circle_circle_collision( a, b )

end

local function circle_rectangle_collision( circle, rectangle )

end

local function rectangle_rectangle_collision( a, b )

end

local function collision( a, b )
    assert( a.t == 'collider', "encountered unknown type in collision: " .. a.t ) 
    assert( b.t == 'collider', "encountered unknown type in collision: " .. b.t ) 

    if a.k == 'rectangle' and b.k == 'rectangle' then
        return rectangle_rectangle_collision( a, b )
    elseif a.k == 'rectangle' and b.k == 'circle' then
        return circle_rectangle_collision( b, a )
    elseif a.k == 'circle' and b.k == 'rectangle' then
        return circle_rectangle_collision( a, b )
    elseif a.k == 'circle' and b.k == 'circle' then
        return circle_circle_collision( a, b )
    else
        error( "encountered unknown kind in collision: " .. a.k .. " ; " .. b.k )
    end
end



return { collision = collision
       ; circle_collider = circle_collider
       ; rectangle_collider = rectangle_collider
       ; letter_collider = letter_collider
       }
