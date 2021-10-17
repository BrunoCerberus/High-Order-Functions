// MARK: High Order Functions
// functions that operate on other functions by receiving a function as an argument or returning
// a function

// MARK: Sorted
// return a new array sorted
let numbers: [Int] = [4, 1, 8, 3, 9, 5, 6 ,7 ,2]
let ascendingNumbers: [Int] = numbers.sorted()
print(numbers)
print(ascendingNumbers)

// specify how we want to sort an array using high order function "(by:)"
let descendingNumbersOne = numbers.sorted(by: { $0 > $1 })
let descendingNumbersTwo = numbers.sorted(by: { (a, b) in
    return a > b
})

print(descendingNumbersOne)
print(descendingNumbersTwo)

// MARK: MAP
// iterates throught an array or collection and return an array or collection of any type
let numbersAsStrings = numbers.map { String($0) }
print(numbersAsStrings)


// MARK: Filter
// returns an array that has only elements that pass your filter
let numbersAsStringsFilter = numbers.filter { $0 < 5 }.sorted(by: >)
print(numbersAsStringsFilter)

// MARK: Reduce
// combine elements of an array and return an object of any type
let sumOfAllNumbers = numbers.reduce("", { $0 + String($1)})
print(sumOfAllNumbers)

// MARK: First
let first9 = numbers.first(where: { $0 == 9 })!
let indexFirst9 = numbers.firstIndex(of: 9)!
print(first9)
print(indexFirst9)

// MARK: Closures
func simpleClosure(number: Int, completion: @escaping (_ a: Int) -> Void) {
    completion(number)
}

simpleClosure(number: 66, completion: {
    print($0)
})

simpleClosure(number: 99) { completionNumber in
    print(completionNumber)
}

// MARK: Closures as typealias
typealias methodHandler = (String) -> ()
func anotherClosure(completion: @escaping methodHandler) {
    completion("Foo Bar")
}

anotherClosure { print($0) }

// MARK: Function that returns a function
func someFunction(_ a: @escaping methodHandler) -> (String) -> (Void) {
    return a
}

func functionToPutInside(a: String) { }
func anotherFunctionToPutInside(_: String) { }
let anyFunction = someFunction(anotherFunctionToPutInside)
print(anyFunction)

// MARK: Execute a function inside another funcion (Closures)

func functionToBeExecuted() {
    print("Hello World")
}

func functionThatExecuteAnotherFunction(someFunction: () -> Void) {
    someFunction()
}

functionThatExecuteAnotherFunction(someFunction: functionToBeExecuted)
