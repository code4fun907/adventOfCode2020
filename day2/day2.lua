-- helper function
local function split(s, delimiter)
    local result = {}
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match)
    end
    return result
end

-- solution
local function partOne(inputs)
    local valid = 0

    for i=1,#inputs do
        local parts = split(inputs[i], ":")
        local policy = split(parts[1], " ")
        local policyMin = tonumber(split(policy[1], "-")[1])
        local policyMax = tonumber(split(policy[1], "-")[2])
        local policyLetter = policy[2]
        local password = parts[2]

        local count = select(2, string.gsub(password, policyLetter, ""))

        if count >= policyMin and count <= policyMax then
            valid = valid + 1
        end
    end

    return valid
end

local function partTwo(inputs)
    local inPosition = 0

    for i=1,#inputs do
        local parts = split(inputs[i], ":")
        local policy = split(parts[1], " ")
        local positionOne = tonumber(split(policy[1], "-")[1])
        local positionTwo = tonumber(split(policy[1], "-")[2])
        local policyLetter = policy[2]
        local password = string.sub(parts[2], 2, #parts[2])

        local positionOneIsPolicyLetter = string.sub(password, positionOne, positionOne) == policyLetter
        local positionTwoIsPolicyLetter = string.sub(password, positionTwo, positionTwo) == policyLetter
        if positionTwoIsPolicyLetter and not positionOneIsPolicyLetter then
            inPosition = inPosition + 1
        end

        if positionOneIsPolicyLetter and not positionTwoIsPolicyLetter then
            inPosition = inPosition + 1
        end
    end

    return inPosition 
end

local file = io.open("./input.txt", "r")
local inputs = {}
for line in file:lines() do
    table.insert(inputs, line)
end

print("Part One Answer:", partOne(inputs))
print("Part Two Answer:", partTwo(inputs))
