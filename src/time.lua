local time = {}

local elapsed = 0
local lastDt = 0

function time.update(dt)
    elapsed = elapsed + dt
    lastDt  = dt
end

function time.getElapsed()
    return elapsed
end

function time.getDeltaTime()
    return lastDt
end

function time.yieldNextFrame()
    coroutine.yield()
    return time.getDeltaTime()
end

function time.yieldWaitSeconds(seconds)
    local start = time.getElapsed()
    while time.getElapsed() - start < seconds do
        coroutine.yield()
    end
    return time.getDeltaTime()
end

function time.yieldCondition(condition, timeout)
    local start = time.getElapsed()
    while not condition() do
        if timeout and time.getElapsed() - start > timeout then
            return false
        end
        coroutine.yield()
    end
    return true
end

return time