//: [Previous](@previous)

import Combine

check("Fail") {
    Fail<Int, SampleError>(error: .sampleError)
}
enum MyError: Error {
    case myError
}

check("Map Error") {
    Fail<Int, SampleError>(error: .sampleError)
        .mapError { _ in
            MyError.myError
    }
}

check("TryMap") {
    ["1", "3", "S", "5", "7"].publisher
        .tryMap { (s) -> Int in
            guard let value = Int(s) else {
                throw MyError.myError
            }
            return value
    }
}
check("TryMap replaceError") {
    ["1", "3", "S", "5", "7"].publisher
        .tryMap { (s) -> Int in
            guard let value = Int(s) else {
                throw MyError.myError
            }
            return value
        }
        .replaceError(with: -1)
}
/*
 ----- TryMap replaceError -----
 receive subscription: (ReplaceError)
 request unlimited
 receive value: (1)
 receive value: (3)
 receive value: (-1)
 receive finished
 */
check("TryMap catch") {
    ["1", "3", "S", "5", "7"].publisher
        .tryMap { (s) -> Int in
            guard let value = Int(s) else { throw MyError.myError }
            return value
    }
    .catch { _ in
        [-1].publisher
    }
}
/*
 ----- TryMap catch -----
 receive subscription: (Catch)
 request unlimited
 receive value: (1)
 receive value: (3)
 receive value: (-1)
 receive finished
 */

check("FlatMap Catch and Just") {
    ["1", "3", "S", "5", "7"].publisher
        .print("Original")
        .flatMap { s in
            return Just(s)
            .tryMap { (s) -> Int in
                    guard let value = Int(s) else { throw MyError.myError }
                    return value
            }
        .print("[tryMap]")
        .catch{ _ in
            Just(-1).print("[Just]")
            .print("[Catch]")
        }
    }
}
/*
 ----- FlatMap Catch and Just -----
 receive subscription: (FlatMap)
 request unlimited
 Original: receive subscription: (["1", "3", "S", "5", "7"])
 Original: request unlimited
 Original: receive value: (1)
 [tryMap]: receive subscription: (Once)
 [tryMap]: request unlimited
 [tryMap]: receive value: (1)
 receive value: (1)
 [tryMap]: receive finished
 Original: receive value: (3)
 [tryMap]: receive subscription: (Once)
 [tryMap]: request unlimited
 [tryMap]: receive value: (3)
 receive value: (3)
 [tryMap]: receive finished
 Original: receive value: (S)
 [tryMap]: receive subscription: (Empty)
 [tryMap]: request unlimited
 [tryMap]: receive error: (myError)
 [Just]: receive subscription: (Just)
 [Catch]: receive subscription: (Print)
 [Catch]: request unlimited
 [Just]: request unlimited
 [Just]: receive value: (-1)
 [Catch]: receive value: (-1)
 receive value: (-1)
 [Just]: receive finished
 [Catch]: receive finished
 Original: receive value: (5)
 [tryMap]: receive subscription: (Once)
 [tryMap]: request unlimited
 [tryMap]: receive value: (5)
 receive value: (5)
 [tryMap]: receive finished
 Original: receive value: (7)
 [tryMap]: receive subscription: (Once)
 [tryMap]: request unlimited
 [tryMap]: receive value: (7)
 receive value: (7)
 [tryMap]: receive finished
 Original: receive finished
 receive finished
 */

check("Filter") {
    [1,2,3,4,5].publisher.filter{ $0 % 2 == 0 }
}

check("Contains") {
    [1,2,3,4,5].publisher
    .print("[Original]")
    .contains(10)
}

