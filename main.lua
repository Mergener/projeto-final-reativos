local objects = require 'src.object'
local assets = require 'src.assets'
local button = require 'src.objects.button'

function love.load()
    assets.load()
    button.new(100, 100, 100, 50, 'Click me!', function()
        print('Button clicked!')
    end)
end

function love.update(dt)
    objects.update(dt)
end

function love.draw()
    objects.draw()
end

function love.keypressed(key)
    objects.keypressed(key)
end

function love.keyreleased(key)
    objects.keyreleased(key)
end

function love.mousepressed(x, y, button)
    objects.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
    objects.mousereleased(x, y, button)
end

function love.quit()
    love.window.close()
    love.event.quit()
end
