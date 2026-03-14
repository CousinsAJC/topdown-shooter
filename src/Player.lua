Player = Object:extend()

function Player:new()
    --position, size, speed
    
    self.shape = 'circle'  --options are circle and square

    if self.shape == 'circle' then
        self.r = 10
        self.x = WINWIDTH/2
        self.y = WINHEIGHT/2
        self.centerX = self.x
        self.centerY = self.y
    else
        self.w = 20
        self.h = 20
        self.x = WINWIDTH/2 - self.w/2
        self.y = WINHEIGHT/2 - self.h/2
        self.centerX = WINWIDTH
        self.centerY = WINHEIGHT
    end

    self.health = 5

    --position
    self.originX = 0
    self.originY = 0
    self.xWorld = self.x
    self.yWorld = self.y

    --speed
    self.boosting = false
    
    self.boostSpeed = 5
    self.baseSpeed = 3
    self.speed = self.baseSpeed
    self.pace = 1

    --shooting
    self.bullets = {}
    self.fireCooldown = .2
    self.fireTimer = 0
    self.bulletSpeed = 550

    --cooldowns
    self.boostTimer = 0
    self.boostResetTimer = 4
    self.timeUntilBoost = 0
end

function Player:update(dt)
    self.xWorld, self.yWorld = CM.toWorldCoords(self.x, self.y)
    self:move(dt)
    self:fireNewBullet(dt)
    self:updateBulletsFromTable(dt)
end

function Player:draw()
    love.graphics.setColor(1, 0, 1, 1)
    if self.shape == 'circle' then
        love.graphics.circle("fill", self.x, self.y, self.r)
    else
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    end
    self:drawBulletsFromTable()
end



function Player:updateBulletsFromTable(dt)
    for i = #self.bullets, 1, -1 do
        self.bullets[i]:update(dt)
    end
end

function Player:drawBulletsFromTable()
    for i = #self.bullets, 1, -1 do
        self.bullets[i]:draw()
    end
end


function Player:checkForFire(dt)
    if self.fireTimer > 0 then
        self.fireTimer = self.fireTimer - dt
    end
end

function Player:fireNewBullet(dt)
    if love.mouse.isDown(1) then
    --if love.keyboard.isDown("space") then
        if self.fireTimer <= 0 then
            --get world position for mouse, camera and player
            local mouseX, mouseY = CM.toWorldCoords(love.mouse.getPosition())
            local camPlayerX, camPlayerY = CM.toWorldCoords(self.centerX, self.centerY)
            local xPos, yPos = CM.toWorldCoords(self.centerX, self.centerY) 

            --calculate angle and trajectory of bullet
            local angle = getAngle(mouseY, self.y, mouseX, self.x)
            local dx = math.cos(angle)
            local dy = math.sin(angle)

            --instantiate bullet and add to table
            local instance = Bullet(xPos, yPos, self.bulletSpeed, dx, dy)
            table.insert(self.bullets, instance)

            self.fireTimer = self.fireCooldown
        else
            self:checkForFire(dt)
        end
    end
end


function Player:move(dt)
    if self.boosting == true then
        self.speed = self.boostSpeed
        self.boostTimer = self.boostTimer - dt
        if self.boostTimer <= 0 then
            self.boostTimer = 0
            self.boosting = false
            self.speed = self.baseSpeed
            self.timeUntilBoost = self.boostResetTimer
        end
    elseif self.timeUntilBoost > 0 then
        self.timeUntilBoost = self.timeUntilBoost - dt
    end

    if self.timeUntilBoost < 0 then
        self.timeUntilBoost = 0
    end

    if (love.keyboard.isDown("a") and (love.keyboard.isDown("w") or love.keyboard.isDown("s"))) or
        (love.keyboard.isDown("d") and (love.keyboard.isDown("w") or love.keyboard.isDown("s"))) then
            self.pace = .65
    else
        self.pace = 1
    end
    
    if love.keyboard.isDown("a") then
        self.x = self.x - self.speed * self.pace
    end
    if love.keyboard.isDown("d") then
        self.x = self.x + self.speed * self.pace
    end
    if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * self.pace
    end
    if love.keyboard.isDown("s") then
        self.y = self.y + self.speed * self.pace
    end

    self:updateCenterPosition(dt)

end


function Player:updateCenterPosition(dt)
    if self.type == circle then
        self.centerX = self.x
        self.centerY = self.y
    else
        self.centerX = self.x - self.w/2
        self.centerY = self.y - self.h/2
    end
end

function Player:getWorldCoordinates()

end