local module = {}

local objects = {}

function module.add(args)
    table.insert(objects, args)

    return args
end

function module.remove(object)
    for i, obj in ipairs(objects) do
        if obj == object then
            table.remove(objects, i)
            return
        end
    end
end

function module.keypressed(key)
    for i, object in ipairs(objects) do
        if object.keypressed then
            object:keypressed(key)
        end
    end
end

function module.keyreleased(key)
    for i, object in ipairs(objects) do
        if object.keyreleased then
            object:keyreleased(key)
        end
    end
end

function module.mousepressed(x, y, button)
    for i, object in ipairs(objects) do
        if object.mousepressed then
            object:mousepressed(x, y, button)
        end
    end
end

function module.mousereleased(x, y, button)
    for i, object in ipairs(objects) do
        if object.mousereleased then
            object:mousereleased(x, y, button)
        end
    end
end

function module.update(dt)
    for i, object in ipairs(objects) do
        if object.update then
            object:update(dt)
        end
    end
end

function module.draw()
    local drawQueue = {}

    for i, object in ipairs(objects) do
        if object.draw then
            table.insert(drawQueue, object)
        end
    end
    
    table.sort(drawQueue, function(a, b)
        return (a.drawLayer or 0) < (b.drawLayer or 0)
    end)

    for i, object in ipairs(drawQueue) do
        object:draw()
    end
end

function module.quit()

end

return module