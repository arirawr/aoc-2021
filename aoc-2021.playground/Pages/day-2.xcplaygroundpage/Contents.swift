//: [Previous](@previous)

import Foundation
var input = readInput().compactMap({$0})

struct Instruction {
    var direction: Direction
    var value: Int
}

enum Direction: String {
    case up, down, forward
}

var instructions = [Instruction]()
for line in input {
    let instruction = line.components(separatedBy: " ")
    guard instruction.count == 2 else { continue }
    instructions.append(Instruction(direction: Direction(rawValue: String(instruction[0]))!, value: Int(instruction[1])!))
}

func part1() {
    var horizontalPosition = 0
    var depth = 0
    
    for command in instructions {
        switch command.direction {
            case .up:
                depth -= command.value
            case .down:
                depth += command.value
            case .forward:
                horizontalPosition += command.value
        }
    }

    print(horizontalPosition * depth)
}

func part2() {
    var horizontalPosition = 0
    var depth = 0
    var aim = 0
    
    for command in instructions {
        switch command.direction {
            case .up:
                aim -= command.value
            case .down:
                aim += command.value
            case .forward:
                horizontalPosition += command.value
                depth += aim * command.value
        }
    }
    
    print(horizontalPosition * depth)
}

part1()
part2()
//: [Next](@next)
