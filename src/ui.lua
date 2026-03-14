UserInterface = Object:extend()

function UserInterface:new()
    self.baseHealthX = 20
    self.baseHealthY = 20
    --to be image
    self.healthRadius = 10
    self.healthColor = color.red

    self.cooldownColor = color.green
    self.cooldownX = WINWIDTH - 100
    self.cooldownY = 20
end


function UserInterface:update(dt)
    self:getPlayerHealth(p1.health)
    self:getBoostCooldown(p1.timeUntilBoost)
end

function UserInterface:draw()
    self:drawHealthBars()
    self:drawCoolDowns()
end





function UserInterface:getPlayerHealth(health)
    self.health = health
end

function UserInterface:getBoostCooldown(timeLeft)
    self.boostTimer = timeLeft    
end



function UserInterface:drawHealthBars()
    for i = 1, self.health, 1 do
        love.graphics.setColor(self.healthColor)
        love.graphics.circle('fill', self.baseHealthX * i, self.baseHealthY, self.healthRadius) 
        love.graphics.setColor(color.white)
        love.graphics.circle('line', self.baseHealthX * i, self.baseHealthY, self.healthRadius)
    end
end

function UserInterface:drawCoolDowns()
    love.graphics.setColor(self.cooldownColor)
    love.graphics.setNewFont(24)
    love.graphics.print(self.boostTimer, self.cooldownX, self.cooldownY)
end