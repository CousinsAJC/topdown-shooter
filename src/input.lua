function love.keypressed(key)
    if key == "escape" or key == "tab" then
        love.event.quit()
    end
    if key == "space" and p1.timeUntilBoost <= 0 then
        p1.boosting = true
        p1.boostTimer = .35
    end
end
