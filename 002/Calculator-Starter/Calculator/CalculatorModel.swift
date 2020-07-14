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
    // 添加操作到history
    func applay(_ item: CalculatorButtonItem) {
        brain = brain.apply(item: item)
        history.append(item)
        
        temporaryKept.removeAll()
        slidingIndex = Float(totalCount)
    }
    
    // 操作回溯界面
    // 1、将history数组中记录的操作连接起来
    var historyDetail: String {
        history.map { $0.description }.joined()
    }
    // 2、记录被回溯的操作，可使用滑块恢复这些操作
    var temporaryKept: [CalculatorButtonItem] = []
    // 3、滑块
    var totalCount: Int {
        history.count + temporaryKept.count
    }
    // 4、当前滑块的index值
    var slidingIndex: Float = 0 {
        didSet {
            keepHistory(to: Int(slidingIndex))
        }
    }
    // 5、操作滑块
    func keepHistory(to index: Int) {
        precondition(index <= totalCount, "Out of Index")
        
        let total = history + temporaryKept
        history = Array(total[..<index])
        temporaryKept = Array(total[index...])
        
        brain = history.reduce(CalculatorBrain.left("0"), { result, item in
            result.apply(item: item)
        })
        
    }
}
