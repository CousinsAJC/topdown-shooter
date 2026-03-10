function love.load()
    require "src/requires"

    WINWIDTH = 600
    WINHEIGHT = 400
    love.window.setMode(WINWIDTH, WINHEIGHT)
    
    
    
    p1 = Player()
    --load a map
end


function love.update(dt)
    p1:update(dt)
    --update enemies
end


function love.draw()
    p1:draw()
    --draw map
    --draw enemies
end
