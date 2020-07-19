//: [Previous](@previous)

import Combine

let sub1 = PassthroughSubject<Int, Never>()
let sub2 = PassthroughSubject<Int, Never>()

check("Sub Order") {
    sub1.merge(with: sub2)
}

sub1.send(20)
sub2.send(1)
sub1.send(40)
sub1.send(60)
sub2.send(1)
sub1.send(80)
sub1.send(100)
sub1.send(completion: .finished)
sub2.send(completion: .finished)



