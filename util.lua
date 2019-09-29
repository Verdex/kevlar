
local function distance_squared( a, b )
    return math.pow(b.x - a.x, 2) + math.pow(b.y - a.y, 2)
end

local function distance( a, b )
    return math.sqrt( math.pow(b.x - a.x, 2) + math.pow(b.y - a.y, 2) )
end

return { distance_squared = distance_squared
       ; distance = distance
       }
