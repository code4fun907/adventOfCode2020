use std::fs::File;
use std::io::prelude::*;
use std::collections::HashSet;
use std::collections::HashMap;

fn part_one(input: Vec<String>) -> usize {
    let mut answer_amounts: Vec<usize> = vec![];
    for string in &input {
        let mut unique_answers = HashSet::new();
        for character in string.replace("\n", "").chars() {
            unique_answers.insert(character);
        }
        answer_amounts.push(unique_answers.len())
    }

    let mut sum = 0;
    for answer_amount in answer_amounts {
        sum += answer_amount;
    }
    sum
}

fn part_two(input: Vec<String>) -> usize {
    let mut sum = 0;
    for string in &input {
        let mut unique_character_sets: Vec<HashSet<String>> = vec![];
        for line in string.split("") {
            let mut unique_character_set = HashSet::new();
            for character in line.split("") {
                unique_character_set.insert(String::from(character));
            }
            unique_character_sets.push(unique_character_set);
        }
        let mut amount_map: HashMap<String, usize> = HashMap::new();
        for unique_character_set in unique_character_sets {
            for element in unique_character_set {
                if amount_map.contains_key(&element) {
                    *amount_map.get_mut(&element).unwrap() += 1;
                } else {
                    amount_map.insert(element.to_string(), 1);
                }
            }
        }
        for (_key, value) in amount_map.into_iter() {
            let chunks: Vec<&str> = string.split("\n").collect();
            if value == chunks.len() {
                sum += 1;
            }
        }
    }
    return sum;
}

fn read_input() -> Vec<String> {
    let mut file = File::open("input.txt").expect("Unable to open file");
    let mut contents = String::new();
    file.read_to_string(&mut contents).expect("Unable to read the file");
    contents.split("\n\n").map(str::to_string).collect()
}

fn main() {
    let input = read_input();
    println!("Part One Answer: {}", part_one(input.clone()));
    println!("Part Two Answer: {}", part_two(input.clone()));
}
