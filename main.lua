WINWIDTH = 600
WINHEIGHT = 400
love.window.setMode(WINWIDTH, WINHEIGHT)
require "src/requires"



function love.load()
    grid = {}
    for i = 1, 20, 1 do
        grid[i] = {}
        for j = 1, 20, 1 do
            grid[i][j] = {}
            grid[i][j].x = i * 100
            grid[i][j].y = j * 100
        end
    end

    setGameTables()

    UI = UserInterface()
    p1 = Player()
    e1 = Enemy(100, 100, 'dragon')
    
    CM = Camera.newManager()

    myKeys = {}
end


function love.update(dt)
    p1:update(dt)
    e1:update(dt)
    UI:update(dt)

    CM.setTarget(p1.centerX, p1.centerY)
    CM.update(dt)

    myKeys = {}
end


function love.draw()
    CM.attach()

    drawGrid()
    p1:draw()
    e1:draw()
    

    CM.detach()
    UI:draw()
end




function setGameTables()
    maxJoys = 4
    joys = {}

    maxPlayers = 4
    players = {}

    enemies = {}
end


function drawGrid()
    love.graphics.setColor(.7, .7, .7, 1)
    for i = 1, 20, 1 do
        for j = 1, 20, 1 do
            love.graphics.circle("line", grid[i][j].x, grid[i][j].y, 2)
        end
    end
end