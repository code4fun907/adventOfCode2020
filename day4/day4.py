def part_one(input):
    valid_count = 0
    for passport in input:
        valid = True

        if not all(needed in passport for needed in ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]):
            valid = False

        if valid:
            valid_count += 1

    return valid_count
        
def validate_passport(passport):
    if not all(needed in passport for needed in ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]):
        return False

    if not all([
        1920 <= int(passport["byr"]) <= 2002,
        2010 <= int(passport["iyr"]) <= 2020,
        2020 <= int(passport["eyr"]) <= 2030,
        passport["hgt"][-2:] in ("cm", "in") and (
            (passport["hgt"][-2:] == "in" and 59 <= int(passport["hgt"][:-2]) <= 76) or
            (passport["hgt"][-2:] == "cm" and 150 <= int(passport["hgt"][:-2]) <= 193)
        ),
        passport["hcl"][0] == "#" and all(char in '0123456789abcdef' for char in passport["hcl"][1:]),
        passport["ecl"] in "amb brn gry grn hzl oth blu".split(),
        passport["pid"].isdigit() and len(passport["pid"]) == 9
    ]):
        return False

    return True

def part_two(input):
    valid_count = 0
    for passport in input:
        if validate_passport(passport):
            valid_count += 1

    return valid_count

def get_input():
    with open("./input.txt", "r") as f:
        lines = [line.replace("\n", " ") for line in open("./input.txt").read().split("\n\n")]
        passports = [dict(tuple(entry.split(":")) for entry in line.split()) for line in lines]
        return passports

print("Part One Answer: ", part_one(get_input()))
print("Part Two Answer: ", part_two(get_input()))
