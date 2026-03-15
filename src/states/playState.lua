PlayState = BaseState:extend()

function PlayState:enter(enterParams)
    UI = UserInterface()
    p1 = Player()
    table.insert(players, p1)

    spawnTimer = 5
    spawnTimeLeft = 0

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