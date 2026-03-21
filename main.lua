WINWIDTH = 1080
WINHEIGHT = 720
love.window.setMode(WINWIDTH, WINHEIGHT)
require "src/requires"

math.randomseed(os.time())



function love.load()
    establishGrid()
    setGameTables()


    -- Initialize state machine
    gsm = StateMachine{
        ['menu'] = function() return MenuState() end,
        ['char'] = function() return CharState() end,
        ['play'] = function() return PlayState() end,
        ['options'] = function() return OptionsState() end, 
        ['levelup'] = function() return LevelupState() end
    }

    -- Move to initial state
    gsm:change('play', players)

    myKeys = {}
end


function love.update(dt)
    gsm:update(dt)

    myKeys = {}
end


function love.draw()
    gsm:draw()

end



function setGameTables()
    maxJoys = 4
    joys = {}

    maxPlayers = 4

    players = {}
    enemies = {}
    collectibles = {}
end


function establishGrid()
    grid = {}
    for i = 1, 20, 1 do
        grid[i] = {}
        for j = 1, 20, 1 do
            grid[i][j] = {}
            grid[i][j].x = i * 100
            grid[i][j].y = j * 100
        end
    end
end

function drawGrid()
    love.graphics.setColor(.7, .7, .7, 1)
    for i = 1, 20, 1 do
        for j = 1, 20, 1 do
            love.graphics.circle("line", grid[i][j].x, grid[i][j].y, 2)
        end
    end
end

