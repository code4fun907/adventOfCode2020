package main

import (
    "fmt"
    "strings"
    "io/ioutil"
    "math"
    "sort"
)

func partOne(input []string) int {
    highId := 0

    for i := 0; i < len(input); i++ {
        minRow := 0
        maxRow := 127
        minColumn := 0
        maxColumn := 7
        for pos, char := range input[i] {
            if string(char) == "F" && pos <= 6 {
                maxRow = int(math.Floor((float64(minRow + maxRow)) / 2))
            }
            if string(char) == "B" && pos <= 6 {
                minRow = int(math.Ceil((float64(minRow + maxRow)) / 2))
            }
            if string(char) == "L" && pos > 6 {
                maxColumn = int(math.Floor((float64(minColumn + maxColumn)) / 2))
            }
            if string(char) == "R" && pos > 6 {
                minColumn = int(math.Ceil((float64(minColumn + maxColumn)) / 2))
            }
        }
        
        if (minRow * 8) + maxColumn > highId {
            highId = (minRow * 8) + maxColumn
        }
    }
    return highId
}

func partTwo(input []string) int {
    seatIds := make([]int, len(input))

    for i := 0; i < len(input); i++ {
        minRow := 0
        maxRow := 127
        minColumn := 0
        maxColumn := 7
        for pos, char := range input[i] {
            if string(char) == "F" && pos <= 6 {
                maxRow = int(math.Floor((float64(minRow + maxRow)) / 2))
            }
            if string(char) == "B" && pos <= 6 {
                minRow = int(math.Ceil((float64(minRow + maxRow)) / 2))
            }
            if string(char) == "L" && pos > 6 {
                maxColumn = int(math.Floor((float64(minColumn + maxColumn)) / 2))
            }
            if string(char) == "R" && pos > 6 {
                minColumn = int(math.Ceil((float64(minColumn + maxColumn)) / 2))
            }
        }
        seatIds = append(seatIds, (minRow * 8) + maxColumn)
    }
    sort.Ints(seatIds)

    for i := 1; i < len(seatIds); i++ {
        if seatIds[i] + 1 != seatIds[i+1] && seatIds[i] != 0 {
            return seatIds[i] + 1
        }
    }
    return 0
}

func readInput() []string {
    data, err := ioutil.ReadFile("./input.txt")
    if err != nil {
        fmt.Println("There was an error")
    }
    return strings.Split(string(data), "\n")
}

func main() {
    input := readInput()
    fmt.Println("Part One Answer:", partOne(input))
    fmt.Println("Part Two Answer:", partTwo(input))
}
