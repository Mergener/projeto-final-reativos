local objects = require 'src.object'
local tossam = require 'tossam.tossam'

function love.load()

    objects.add({
        x = 100,
        y = 100,
        keypressed = function(self, key)
            if key == 'up' then
                self.y = self.y - 10
            elseif key == 'down' then
                self.y = self.y + 10
            elseif key == 'left' then
                self.x = self.x - 10
            elseif key == 'right' then
                self.x = self.x + 10
            end
        end,
        draw = function(self)
            love.graphics.setColor(255, 0, 0)
            love.graphics.rectangle('fill', self.x, self.y, 50, 50)
        end,
    })
end

function love.update(dt)
    objects.update(dt)

    if love.keyboard.isDown('escape') then
        mote = tossam.connect {
            protocol = "sf",
            host     = "localhost",
            port     = 9002,
            nodeid   = 1
        }
        if not(mote) then print("Connection error!"); return(1); end
    end
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
