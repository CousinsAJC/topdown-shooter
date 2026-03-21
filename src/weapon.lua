Weapon = Object:extend()

function Weapon:new(w)
    self.complete = w.complete
    self.name = w.name
    self.type = w.type
    self.class = w.class
    self.damage = w.damage
    self.damageScaling = w.damageScaling
    self.scalingPercent = w.scalingPercent
    self.attackSpeed = w.attackSpeed
    self.timer = w.timer
    self.critDamage = w.critDamage
    self.critChance = w.critChance
    self.range = w.range
    self.lifesteal = w.lifesteal
    self.specialEffect = w.specialEffect
    self.basePrice = w.basePrice
    self.unlocked = w.unlocked
    self.texture = w.texture
    self.animations = w.animations

    self.bullets = {}
end

function Weapon:update(dt)
    self:setPosition(p1.x, p1.y)
    self:attack(dt)
    self:updateBulletsFromTable(dt)
end

function Weapon:draw()
    love.graphics.draw(self.texture, self.x, self.y)
    self:drawBulletsFromTable()
end




function Weapon:setPosition(x, y)
    self.x = x - 60 - 16
    self.y = y - 40 - 16
end


function Weapon:attack(dt)
    local melee = false
    local ranged = false
    for i = 1, #self.class, 1 do
        if self.class[i] == 'melee' then
            melee = true
        elseif self.class[i] == 'ranged' then
            ranged = true
        end
        if melee == true then
            if #enemies > 0 then
                --determine if it is attacking
                --determine if it is slashing or thrusting
                --update position
            end
        elseif ranged == true then
            if #enemies > 0 then
                local targetX, targetY, target = self:findClosestEnemy()
                if getDistance(targetX, targetY, self.x, self.y) <= self.range then
                    self:checkForFire(dt, targetX, targetY, target)
                end
            end
        end
    end
end



function Weapon:findClosestEnemy()
    local closest = nil
    local closestX = nil
    local closestY = nil
    local closestDistance = nil
    local distance = nil
    if #enemies > 0 then
        for i = #enemies, 1, -1 do
            local eX, eY, eId = enemies[i].x, enemies[i].y, enemies[i].id
            distance = getDistance(eX, eY, self.x, self.y)
            if closest == nil then
                closest = enemies[i]
                closestDistance = distance
                closestX, closestY = eX, eY
            else
                if distance < closestDistance then
                    closest = enemies[i]
                    closestDistance = distance
                    closestX, closestY = eX, eY
                end
            end
        end
        return closestX, closestY, eId
    end
end

function Weapon:checkForFire(dt, tX, tY, t)
    if self.timer <= 0 then
        self.timer = self.attackSpeed
        self:fireNewBullet(dt, tX, tY, t)
    else
        self.timer = self.timer - dt
    end
end

function Weapon:fireNewBullet(dt, tX, tY, t)
        --calculate angle and trajectory of bullet
        local angle = getAngle(tY, self.y, tX, self.x)
        local dx = math.cos(angle)
        local dy = math.sin(angle)


        --instantiate bullet and add to table
        local instance = Bullet(self.x, self.y, p1.bulletSpeed, dx, dy, self.range, t)
        table.insert(self.bullets, instance)
end



function Weapon:updateBulletsFromTable(dt)
    for i = #self.bullets, 1, -1 do
        self.bullets[i]:update(dt)
        for j = #enemies, 1, -1 do
            local distance = getDistance(self.bullets[i].x, self.bullets[i].y, enemies[j].x, enemies[j].y)
            if distance <= (self.bullets[i].r + enemies[j].r) then
                table.remove(self.bullets, i)
                enemies[j]:takeHit()
            end
        end
    end
end

function Weapon:drawBulletsFromTable()
    for i = #self.bullets, 1, -1 do
        self.bullets[i]:draw()
    end
end
















