-- LESSON STATUS: Just finished 24, move to 25 next.

-- Runs the moment the game starts (global variables, window size etc...)
function love.load()
    -- Target Table
    target = {}
    target.x = 300
    target.y = 300
    target.radius = 50
    
    -- tracks game score
    score = 0

    -- tracks time
    timer = 0

    gameFont = love.graphics.newFont(40)
end

-- This function runs as the game loop. It calls every frame of the game. dt stands for delta time
function love.update(dt)

end

-- this draws graphics and images to the screen.
function love.draw()
    -- sets color of circle
    love.graphics.setColor(1,0,0)
    -- draws circle and uses global target table to insert values for position and radius
    love.graphics.circle("fill", target.x, target.y, target.radius)

    -- set colors of font to white. it was using red before because of previous color declaration for circle.
    love.graphics.setColor(1,1,1)
    -- sets font to global variable gameFont
    love.graphics.setFont(gameFont)
    -- prints score in the upper left corner of screen
    love.graphics.print(score,0, 0)
end

--More details in link below. Using mouse pressed to determine if left click is clicking the circle to increase score.
--https://love2d.org/wiki/love.mousepressed
function love.mousepressed( x, y, button, istouch, presses )
    if button == 1 then
        -- create a local variable since this only needs calculated within love.mousepressed
        -- using the distancebetween function, x,y paramaters are passed from mousepressed
        -- using the distance between fuction, target.x and targety are passed from global variable.
        local mouseToTarget = distanceBetween(x, y, target.x, target.y)
        if mouseToTarget < target.radius then
            score = score + 1
        end
    end
end

-- in order to properly calculate the distance between where the mouse was clicked, and the target, we have to use the distance formula.
-- this function below will allow us to use the distanceBetween() function and return the distance between the target and mousepress location
function distanceBetween(x1, y1, x2, y2)
    return math.sqrt( (x2 - x1)^2 + (y2 - y1)^2 )
end