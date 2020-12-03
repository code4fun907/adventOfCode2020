function partOne(input)
  row = 1 
  column = 1 
  trees = 0

  while true
    if input[row][column] == "#"
      trees += 1
    end

    column += 3
    
    if column > length(input[1])
      column = column - length(input[1])
    end

    row += 1

    if row > length(input)
      return trees
    end
  end
end

function partTwo(input, right, down)
  row = 1 
  column = 1 
  trees = 0

  while true
    if input[row][column] == "#"
      trees += 1
    end

    column += right
    
    if column > length(input[1])
      column = column - length(input[1])
    end

    row += down

    if row > length(input)
      return trees
    end
  end
end

lines = readlines("./input.txt")
input = []

for line in lines
  push!(input, split(line, ""))
end

println("Part One Answer: ", partOne(input))

trees = []
for directions in [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
  push!(trees, partTwo(input, directions[1], directions[2]))
end

println("Part Two Answer: ", trees[1] * trees[2] * trees[3] * trees[4] * trees[5])
