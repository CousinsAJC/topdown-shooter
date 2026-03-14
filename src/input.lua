

function love.keypressed(key)
    addToSet(myKeys, key)
    if key == "escape" or key == "tab" then
        love.event.quit()
    end
    
    if key == "space" and p1.timeUntilBoost <= 0 then
        p1.boosting = true
        p1.boostTimer = .35
    end
end

function addToSet(set, key)
    set[key] = true
end

function setContains(set, key)
    return set[key] ~= nil
end