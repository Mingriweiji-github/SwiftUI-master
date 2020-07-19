//: [Previous](@previous)

import Combine
import Foundation

print("\n Zip on Sequence")
for tuple in zip([1,2,3,4], ["A","B","C","D"]) {
    print(tuple)
}

let subject1 = PassthroughSubject<Int, Never>()
let subject2 = PassthroughSubject<String, Never>()

check("Zip") {
    subject1.zip(subject2)
}

subject1.send(1)
subject1.send(2)
subject2.send("A")
subject2.send("B")
subject2.send("C")
subject2.send("D")
subject1.send(3)
subject1.send(4)

/*
 ----- Zip -----
 receive subscription: (Zip)
 request unlimited

 receive value: ((1, "A"))
 receive value: ((2, "B"))
 receive value: ((3, "C"))
 receive value: ((4, "D"))
 receive cancel
 */
