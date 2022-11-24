//: [Previous](@previous)

import Foundation
var input = readInput().compactMap({ Int($0) })

func part1() {
    var count = 0
    var previous = input.removeFirst()

    for value in input {
        if value > previous {
            count += 1
        }
        previous = value
    }
    print(count)
}

func part2() {
    var slidingSums: [Int] = []

    // Add up the first 3 values, and then remove the first value
    // to get to the start of the next 3-measurement window.
    // Stop when there are fewer than 3 values left.
    while input.count >= 3 {
        slidingSums.append(input.prefix(3).reduce(0,+))
        input.removeFirst()
    }

    var count = 0
    var previous = slidingSums.removeFirst()

    for value in slidingSums {
        if value > previous {
            count += 1
        }
        previous = value
    }
    print(count)
}

part1()
part2()
//: [Next](@next)
