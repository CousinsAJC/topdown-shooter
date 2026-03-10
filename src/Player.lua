Player = Object:extend()

function Player:new()
    --position, size, speed
    self.w = 20
    self.h = 20
    self.x = WINWIDTH/2 - self.w/2
    self.y = WINHEIGHT/2 - self.h/2
    self.speed = 3
    self.pace = 1

    --shooting
    self.bullets = {}
    self.fireCooldown = .3
    self.fireTimer = 0
    self.bulletSpeed = 450

end

function Player:update(dt)
    self:move(dt)
    self:fireNewBullet(dt)
    self:updateBulletsFromTable(dt)
end

function Player:draw()
    love.graphics.setColor(1, 0, 1, 1)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
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
    if love.keyboard.isDown("space") then
        if self.fireTimer <= 0 then
            local mouseX, mouseY = love.mouse.getPosition()
            local angle = math.atan2(mouseY - self.y, mouseX - self.x)
            local dx = math.cos(angle)
            local dy = math.sin(angle)
            local instance = Bullet(self.x + self.w/2, self.y + self.h/2, self.bulletSpeed, dx, dy)
            table.insert(self.bullets, instance)
            self.fireTimer = self.fireCooldown
        else
            self:checkForFire(dt)
        end
    end
end


function Player:move(dt)
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
end