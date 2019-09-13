

local keyShiftDict = { ['1'] = '!'
                     ; ['2'] = '@'
                     }

local function init()
    return { left_shift = false
           ; right_shift = false
           }
end

local function shift_key( key )
    if string.match( key, '%a' ) then return string.upper( key )
    else return keyShiftDict[key]
    end
end

local function keypress( listener, key )
    if listener.left_shift or listener.right_shift then
        key = shift_key( key )
    end

    if key == "escape" then

    elseif key == "lshift" then 
        listener.left_shift = true
    elseif key == "rshift" then
        listener.right_shift = true
    end
end

local function keyrelease( listener, key )
    if key == "lshift" then 
        listener.left_shift = false
    elseif key == "rshift" then
        listener.right_shift = false 
    end
end

--[[function handle_move( key, hero )
    if key == 'h' then
        hero.move = west
    elseif key == 'j' then
        hero.move = south 
    elseif key == 'k' then
        hero.move = north 
    elseif key == 'l' then
        hero.move = east 
    end
end--]]

return { keyrelease = keyrelease
       ; keypress = keypress
       ; init = init
       }

