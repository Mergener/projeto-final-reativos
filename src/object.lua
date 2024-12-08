local objects = {}

local allObjects = {}

function objects.isRegistered(obj)
    return obj[obj] ~= nil
end

function objects.add(args)
    allObjects[args] = args

    local prevChildren = args.children
    args.children = {}

    if prevChildren ~= nil then
        for i, child in pairs(prevChildren) do
            if not objects.isRegistered(child) then
                objects.add(child)
            end

            objects.setParent(child, args)
        end
    end

    if args.parent then
        objects.setParent(args, args.parent)
    end

    return args
end

function objects.setParent(obj, parent)
    if obj.parent then
        for i, child in ipairs(obj.parent.children) do
            if child == obj then
                table.remove(obj.parent.children, i)
            end
        end
    end

    obj.parent = parent
    if parent ~= nil then
        table.insert(parent.children, obj)
    end
end

function objects.remove(obj)
    for i, child in pairs(obj.children) do
        objects.remove(child)
    end
    if obj.removed then
        obj:removed()
    end
    allObjects[obj] = nil
end

function objects.keypressed(key)
    for i, obj in pairs(allObjects) do
        if obj.keypressed then
            obj:keypressed(key)
        end
    end
end

function objects.keyreleased(key)
    for i, obj in pairs(allObjects) do
        if obj.keyreleased then
            obj:keyreleased(key)
        end
    end
end

function objects.mousepressed(x, y, button)
    for i, obj in pairs(allObjects) do
        if obj.mousepressed then
            obj:mousepressed(x, y, button)
        end
    end
end

function objects.mousereleased(x, y, button)
    for i, obj in pairs(allObjects) do
        if obj.mousereleased then
            obj:mousereleased(x, y, button)
        end
    end
end

function objects.update(dt)
    for i, obj in pairs(allObjects) do
        if obj.update then
            obj:update(dt)
        end
    end
end

function objects.draw()
    local drawQueue = {}

    for i, obj in pairs(allObjects) do
        if obj.draw then
            table.insert(drawQueue, obj)
        end
    end
    
    table.sort(drawQueue, function(a, b)
        return (a.drawLayer or 0) < (b.drawLayer or 0)
    end)

    for i, obj in pairs(drawQueue) do
        obj:draw()
    end
end

function objects.quit()
    for i, obj in pairs(allObjects) do
        if obj.removed then
            obj:removed()
        end

        if obj.quit then
            obj:quit()
        end
    end
end

return objects