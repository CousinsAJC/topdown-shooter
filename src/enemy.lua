Enemy = Object:extend()

function Enemy:new(x, y, enemyType)
    self.x = x
    self.y = y
    self:determineType(enemyType)
end

function Enemy:update(dt)

end

function Enemy:draw()

end



function Enemy:determineType(enemy)
    if enemy == "dragon" then
        
    elseif enemy == "slime" then

    end
end