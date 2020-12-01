// Day 1 Javascript
const fs = require("fs");

function expenseReportPartOne(inputs) {
  // Find the 2 entries that sum to 2020 then return
  // them multipled with one another
  for (let i = 0; i < inputs.length; ++i) {
    for (let j = i; j < inputs.length; ++j) {
      if (inputs[i] + inputs[j] === 2020) {
        return inputs[i] * inputs[j];
      }
    }
  }
}

function expenseReportPartTwo(inputs) {
  // Find the 3 entries that sum to 2020 then return
  // them multipled with one another
  for (let i = 0; i < inputs.length; ++i) {
    for (let j = i; j < inputs.length; ++j) {
      if (inputs[i] + inputs[j] < 2020) {
        let needed = 2020 - (inputs[i] + inputs[j]);
        for (let k = 0; k < inputs.length; ++k) {
          if (inputs[k] === needed) {
            return inputs[i] * inputs[j] * inputs[k]
          }
        }
      }
    }
  }
}

const inputFileContents = fs.readFileSync("./input.txt");
const inputs = inputFileContents
  .toString()
  .split("\n")
  .map(stringNumber => parseInt(stringNumber));

console.log("Part One Answer:", expenseReportPartOne(inputs));
console.log("Part Two Answer:", expenseReportPartTwo(inputs));
