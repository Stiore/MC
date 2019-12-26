function blockFace()
    local succes, data = turtle.inspect()
    return(succes)
end

function nameBlockFace()
    local succes, data = turtle.inspect()
    return(data.name)
end

function tLeft()
    turtle.turnLeft()
    if blockFace() then
        backHome()
    else
        turtle.forward()
        turtle.turnLeft()
    end
end

function tRight()
    turtle.turnRight()
    if blockFace() then
        backHome()
    else
        turtle.forward()
        turtle.turnRight()
    end
end

function backHome()
    while not (nameBlockFace() == "minecraft:chest" or nameBlockFace() == "minecraft:trapped_chest") do
        while not blockFace() do
            turtle.forward()
        end
        if nameBlockFace() == "minecraft:dirt" or nameBlockFace() == "minecraft:grass" then
            turtle.turnLeft()
        end
        if nameBlockFace() == "minecraft:stone" then
            turtle.turnLeft()
        end
    end
    print("On est a la maison")
end

function planter()
    local succes, data = turtle.inspectDown()
    if succes then
		if data.metadata == 7 then
            turtle.digDown()
            turtle.select(1)
            turtle.placeDown()
            print("Ca pousse Ca pousse.")
		end
	else
		turtle.digDown()
		turtle.select(1)
        turtle.placeDown()
        print("Qui a cassé mon CHAMP !!!")
	end
end

function decharge()
    for i=1, 15 do
        turtle.select(i)
        turtle.drop()
    end
    turtle.select(1)
    turtle.suck()
    if turtle.getFuelLevel() <=400 then
        turtle.turnRight()
        turtle.select(16)
        turtle.drop()
        turtle.suck()
        turtle.refuel(10)
        turtle.turnRight()
        print("On se recharge !")
    else
        turtle.turnRight()
        turtle.turnRight()
    end
    print("Fais dodo")
    sleep(120)
end

turtle.select(16)
turtle.refuel(10)
backHome()

while true do
    planter()
    if blockFace() then
        if nameBlockFace() == "minecraft:chest" or nameBlockFace() == "minecraft:trapped_chest" then
            decharge()
        end
        if nameBlockFace() == "minecraft:dirt" or nameBlockFace() == "minecraft:grass" then
            tLeft()
        end
        if nameBlockFace() == "minecraft:stone" then
            tRight()
        end
    else
        turtle.forward()
    end
end
