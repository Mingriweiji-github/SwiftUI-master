//: [Previous](@previous)

import Combine

check("Sequence") {
    Publishers.Sequence<[Int], Never>(sequence: [1, 2, 3])
}

check("Array") {
    [1, 2, 3].publisher
}
check("Map") {
    [1,2,3]
    .publisher
    .map{ $0 * 2 }
}

check("map just") {
    Just(5)
    .map { $0 * 2 }
}
check("CompactMap") {
    ["2","4","6","dog"].publisher.compactMap { Int($0) }
    /*
     ----- CompactMap -----
     receive subscription: ([2, 4, 6])
     request unlimited
     receive value: (2)
     receive value: (4)
     receive value: (6)
     receive finished
     */
}
check("FlatMap1") {
    [[1,2,3], ["a","b","c"]].publisher
        .flatMap {
            $0.publisher
        }
    /*
     ----- FlatMp -----
     receive subscription: (FlatMap)
     request unlimited
     receive value: (1)
     receive value: (2)
     receive value: (3)
     receive value: (a)
     receive value: (b)
     receive value: (c)
     receive finished
     */
}
check("FlapMap2") {
    ["A","B","C"].publisher
        .flatMap { letter in
            [1,2,3].publisher
                .map{"\(letter)\($0)"}
        }
    /*
     ----- FlapMap2 -----
     receive subscription: (FlatMap)
     request unlimited
     receive value: (A1)
     receive value: (A2)
     receive value: (A3)
     receive value: (B1)
     receive value: (B2)
     receive value: (B3)
     receive value: (C1)
     receive value: (C2)
     receive value: (C3)
     receive finished
     */
}

check("Reduce") {
    [1,2,3].publisher.reduce(0, +)
    /*
     ----- Reduce -----
     receive subscription: (Once)
     request unlimited
     receive value: (6)
     receive finished
     */
}

check("Scane") {
    [1,2,3].publisher.scan(0, +)
    /*
     ----- Scane -----
     receive subscription: ([1, 3, 6])
     request unlimited
     receive value: (1)
     receive value: (3)
     receive value: (6)
     receive finished
     */
}

check("RemoveDuplicates") {
    ["s", "s","Sw","Swi","Swif","Swift"].publisher
    .removeDuplicates()
    /*
     ----- RemoveDuplicates -----
     receive subscription: (["s", "Sw", "Swi", "Swif", "Swift"])
     request unlimited
     receive value: (s)
     receive value: (Sw)
     receive value: (Swi)
     receive value: (Swif)
     receive value: (Swift)
     receive finished
     */
}

