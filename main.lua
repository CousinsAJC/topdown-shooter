WINWIDTH = 600
WINHEIGHT = 400
love.window.setMode(WINWIDTH, WINHEIGHT)
require "src/requires"

math.randomseed(os.time())



function love.load()
    establishGrid()
    setGameTables()

    UI = UserInterface()
    p1 = Player()
    table.insert(players, p1)

    spawnTimer = 5
    spawnTimeLeft = 0

    CM = Camera.newManager()

    myKeys = {}
end


function love.update(dt)
    updatePlayers(dt)
    updateEnemies(dt)
    updateCollectibles(dt)

    spawnEnemy(dt)

    UI:update(dt)

    CM.setTarget(p1.centerX, p1.centerY)
    CM.update(dt)

    myKeys = {}
end


function love.draw()
    CM.attach()

    drawGrid()
    drawPlayers()
    drawEnemies()
    drawCollectibles()

    CM.detach()
    UI:draw()
end




function updatePlayers(dt)
    for i = 1, #players, 1 do
        players[i]:update(dt)
    end
end

function updateEnemies(dt)
    for i = #enemies, 1, -1 do
        if enemies[i].dead == true then
            table.remove(enemies, i)
            return
        end
        enemies[i]:update(dt)
    end
end

function updateCollectibles(dt)
    for i = #collectibles, 1, -1 do
        if collectibles[i].pickup == true then
            p1.gold = p1.gold + 1
            table.remove(collectibles, i)
            return
        end
    end
    
    for i = #collectibles, 1, -1 do
        collectibles[i]:update(dt)
    end
end


function spawnEnemy(dt)
    if spawnTimeLeft <= 0 then
        local enemy = Enemy(math.random(500), math.random(300), 'goblin')
        table.insert(enemies, enemy)
        spawnTimeLeft = spawnTimer
    else
        spawnTimeLeft = spawnTimeLeft - dt
    end
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

function drawPlayers()
    for i = 1, #players, 1 do
        players[i]:draw()
    end
end

function drawEnemies()
    for i = #enemies, 1, -1 do
        enemies[i]:draw()
    end
end

function drawCollectibles()
    for i = #collectibles, 1, -1 do
        collectibles[i]:draw()
    end
end