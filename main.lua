
function love.load()
	x = 400
	y = 300

	maxx = love.window.getWidth()
	maxy = love.window.getHeight()
	
	speed = 300
	
	char1 = {
		name = "Big O",
		x = maxx / 2,
		y = maxy / 2
	}
	
	function char1.draw()
		love.graphics.circle( "fill", 300, 300, 32, 100 )
	end
end

function love.update(dt)
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