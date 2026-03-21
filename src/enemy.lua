Enemy = Object:extend()

function Enemy:new(x, y, enemyType, id)
    self.id = id
    self.x = x
    self.y = y

    self.r = 15
    self.health = 5
    self.dead = false

    self.minFollow = 150
    self.maxFollow = 200 

    self.follow = false
    self.faster = false
    self.slower = false
    
    self.minSpeed = 150
    self.maxSpeed = 200
    self.speed = 150
    
    self:determineType(enemyType)
end

function Enemy:update(dt)
    --print("enemy X: " .. self.x .. " || enemy Y: " .. self.y)
    --for each target:get distance (table of players?)
    local distance = getDistance(self.x, self.y, p1.x, p1.y)
    self:chase(dt, distance)
    self:followTarget(dt, distance)
end

function Enemy:draw()
    love.graphics.setColor(1,0,0,1)
    love.graphics.circle("fill", self.x, self.y, self.r)
end





function Enemy:takeHit()
    self.health = self.health - 1
    if self.health <= 0 then
        self:dropGold()
        self.dead = true
    end
end



function Enemy:dropGold()
    --create class for gold
    local gold = Gold(self.x, self.y)
    table.insert(collectibles, gold)
end


function Enemy:adjustSpeed(dt)
    if self.follow == false then
        -- Speedup
        self.speed = self.speed * 1.05
        if self.speed > self.maxSpeed then
            self.speed = self.maxSpeed
        end
    else
        -- Slowdown
        self.speed = self.speed * .95
        if self.speed < self.minSpeed then
            self.speed = self.minSpeed
        end
    end
    self.follow = true
end




function Enemy:chase(dt, dist)
    local distance = math.abs(dist)
    if distance >= self.minFollow and distance <= self.maxFollow then
        self.follow = true
        self:adjustSpeed(dt)
    end

    if distance < self.minFollow then
        self.follow = true
        self.speed = self.maxSpeed
    end

    if distance > self.maxFollow then
        self.speed = self.minSpeed
        self.follow = false
    end
end

function Enemy:followTarget(dt)
    if self.follow == true then
        local angle = getAngle(p1.y, self.y, p1.x, self.x)
        dx = math.cos(angle)
        dy = math.sin(angle)
        self.x = self.x + dx * self.speed * dt
        self.y = self.y + dy * self.speed * dt
    end
end


function Enemy:determineType(enemy)

end