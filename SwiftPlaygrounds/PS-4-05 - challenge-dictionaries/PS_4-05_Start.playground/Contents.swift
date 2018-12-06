typealias Operation = (Int, Int) -> Int

func add(_ a: Int, _ b: Int) -> Int {
    return a+b
}

func printResultOf(_ a: Int, _ b: Int, operation: Operation) {
    print("\(operation(a, b))")
}

//let multiply: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
//    return a*b
//}

let multiply: (Int, Int) -> Int = { $0 * $1 }

//let multiply: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
//    return a*b
//}
multiply(1, 4)

let divide: Operation = { a, b in
    a/b
}

printResultOf(10, 9) { $0 + 10*$1}
