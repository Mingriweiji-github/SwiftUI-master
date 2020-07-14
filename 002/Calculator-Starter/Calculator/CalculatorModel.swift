//
//  CalculatorModel.swift
//  Calculator
//
//  Created by longhuadmin on 2020/7/14.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation

import Combine

class CalculatorModel: ObservableObject {
//    let objectWillChange = PassthroughSubject<Void, Never>()
//
//    var brain: CalculatorBrain = .left("0") {
//        willSet { objectWillChange.send() }
//    }
    
    @Published var brain: CalculatorBrain = .left("0")
    @Published var history: [CalculatorButtonItem] = []
    
    func applay(_ item: CalculatorButtonItem) {
        brain = brain.apply(item: item)
        history.append(item)
    }
    
    
}
