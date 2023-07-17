push = require 'push'
Class = require 'class'

require 'Util'

require 'Brick'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243


function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')

	brickTextures = love.graphics.newImage('bricks.png')
	brickQuads = GenerateQuads(brickTextures, 32, 16)
	
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = true,
		vsync = true
	})
	
	bricks = {}
	GenerateBricks()
end

function love.resize(weight, height)
	push:resize(weight, height)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end

function love.update(dt)
	
	
end

function GenerateBricks()
	for y = 0, 5 do
		for x = 0.2, VIRTUAL_WIDTH / 32 - 3 do 
			table.insert(bricks, Brick(x * 38, y * 20, y + 1))
		end
	end
end

function love.draw()
	push:start()
	
	for k, brick in pairs(bricks) do 
		brick:render()
	end
	
	push:finish()
end
