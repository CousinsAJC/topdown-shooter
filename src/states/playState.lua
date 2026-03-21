PlayState = BaseState:extend()

function PlayState:enter(enterParams)
    UI = UserInterface()
    p1 = Player(p_type['ranger'])
    table.insert(players, p1)

    spawnTimer = 5
    spawnTimeLeft = 0
    id = 1

    CM = Camera.newManager()
end

function PlayState:update(dt)
    updatePlayers(dt)
    updateEnemies(dt)
    updateCollectibles(dt)

    spawnEnemy(dt)

    UI:update(dt)

    CM.setTarget(p1.centerX, p1.centerY)
    CM.update(dt)
end

function PlayState:draw()
    CM.attach()

    drawGrid()
    drawPlayers()
    drawEnemies()
    drawCollectibles()

    CM.detach()
    UI:draw()
end


function spawnEnemy(dt)
    if spawnTimeLeft <= 0 then
        local enemy = Enemy(math.random(500), math.random(300), 'goblin', id)
        table.insert(enemies, enemy)
        spawnTimeLeft = spawnTimer
        id = id + 1
    else
        spawnTimeLeft = spawnTimeLeft - dt
    end
end



function updatePlayers(dt)
    for i = 1, #players, 1 do
        players[i]:update(dt)
    end
end

function updateEnemies(dt)
    for i = #enemies, 1, -1 do
        enemies[i]:update(dt)
        if enemies[i].dead == true then
            table.remove(enemies, i)
        end
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