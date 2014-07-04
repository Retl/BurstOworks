
function love.load()
	x = 400
	y = 300

	maxx = love.window.getWidth()
	maxy = love.window.getHeight()
	
	speed = 300
	
	mouseDownPrevious = false;
	mouseChanged = false;
	
	char1 = {
		name = "Big O",
		x = maxx / 2,
		y = maxy / 2,
		minsize = 16,
		size = 16,
	}
	
	function char1.draw()
		love.graphics.circle( "fill", char1.x, char1.y, char1.size, 100 )
	end
	
	function char1.jumpToMouse()
		char1.x = love.mouse.getX()
		char1.y = love.mouse.getY()
	end
	
	function char1.resetSize()
		char1.size = char1.minsize
	end
	
	function char1.grow(rate)
		char1.size = char1.size + 10 * rate
	end
end

function love.update(dt)
	--Handling Mouse Input
	
	if MouseDownPrevious ~= love.mouse.isDown("l") then
		mouseChanged = true
	else
		mouseChanged = false
	end
	
	--If the state of the mouse being down is different than before, do something different.
	
	if love.mouse.isDown("l") then  --Left Mouse Button
		--Do a thing. Maybe create a bubblethingy.
	end
	
	if love.mouse.isDown("r") then  --Right Mouse Button
		char1.jumpToMouse()
		char1.grow(dt)
	else
		char1.resetSize()
	end
	
	-- Update the copy of  the mouse's click state.
	MouseDownPrevious = love.mouse.isDown("l")
	
	-- Handling Keyboard Input
   if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
      x = x + (speed * dt)
   end
   if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
      x = x - (speed * dt)
   end

   if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
      y = y + (speed * dt)
   end
   if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
      y = y - (speed * dt)
   end
   
   if x >= maxx then
		x = x - maxx
	end
	if y >= maxy then
		y = y - maxy
	end
	if x < 0 then
		x = x + maxx
	end
	if y < 0 then
		y = y + maxy
	end
end

function love.draw()
    love.graphics.print("Hello World", x, y)
	char1.draw()
	
end