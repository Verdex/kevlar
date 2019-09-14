

local function debug_logger() 
    local l = { f = love.filesystem.newFile('logs/debug.log') }
    l.f:open('a')

    function l:info( message )
        self.f:write( "[INFO] : " .. message ) 
    end

    function l:err( message )
        self.f:write( "[ERROR] : " .. message )
    end

    function l:special( file, message )
        local f = love.filesystem.newFile('logs/'..file)
        f:open('a')
        f:write( message )
        f:close()
    end

    function l:close()
       self.f:close()
    end

    return l
end


return { debug_logger = debug_logger
       ;
       }
