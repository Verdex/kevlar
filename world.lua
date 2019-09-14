
local function mob_id()
    return { t = "mob" }
end

local function init() 
    local w = { mobs = {}
              ;
              }
    function w:get_mob( id )
        assert( id.t == "mob", "encountered non mob id in get_mob : " .. id.t )
        return self.mobs[id] or false 
    end

    function w:create_mob( mob )
        local id = mob_id()
        mob.id = id
        self.mobs[id] = mob
        return id
    end

    function w:mobs()
        return self.mobs
    end


    return w
end


return { init = init 
       }
