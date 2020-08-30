-- Stripmining 1x1x3 with Sand/Gravel fall protection
moving_forward = 0
strip_count = 0
 
function checkFuel2()
 if turtle.getFuelLevel() < 1 then
  turtle.select(1)
  turtle.refuel(1)
 end
end
 
-- Funktion for digging forward until there is space (with Gravel & Sand security) 
function diggingForward() 
 while turtle.detect() do
  turtle.dig()
  sleep(0.6)
 end 
end
 
-- Funktion for digging Up until there is space to move (with Gravel & Sand security)
function diggingUp()
 while turtle.detectUp() do
  turtle.digUp()
  sleep(0.6)
 end
end
 
-- Funktion for digging Down until there is space to move (with Gravel & Sand security)
function diggingDown()
 turtle.digDown()
 
 if moving_forward % 7 == 0 then
    turtle.select(16)
    turtle.placeDown()
    turtle.select(1)
 end
end
-- 
function moveForward()
    if turtle.detect() == false then
        checkFuel2()
        turtle.forward()        
        moving_forward = moving_forward + 1
    end
end
 
function strip(n)
 strip_count = n
 
 while moving_forward < strip_count do
    checkFuel2()
    diggingForward()
    moveForward()
    diggingDown()
    diggingUp()
    print(moving_forward)
 end
 
end
 
strip(32)