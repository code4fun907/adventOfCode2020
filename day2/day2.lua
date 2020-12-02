local function partOne(inputs)
    return "Not Implemented"
end

local function partTwo(inputs)
    return "Not Implemented"
end

local file = io.open("./input.txt", "r")
local inputs = {}
for line in file:lines() do
    table.insert(inputs, tonumber(line))
end

print("Part One Answer:", partOne(inputs))
print("Part Two Answer:", partTwo(inputs))
