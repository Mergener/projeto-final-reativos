local assets = require 'src.assets'
local object = require 'src.object'

local button = {}

function button.new(x, y, width, height, text, onClick)
    local self = {}

    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.text = text
    self.onClick = onClick

    function self:draw()
        love.graphics.setColor(0.5, 0.5, 0.5)
        love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
        love.graphics.setColor(1, 1, 1)
        love.graphics.print(self.text, self.x + 10, self.y + 10)
    end

    function self:mousepressed(x, y, button)
        if x >= self.x and x <= self.x + self.width and y >= self.y and y <= self.y + self.height then
            self.onClick()
        end
    end

    return object.add(self)
end

return button