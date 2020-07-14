//
//  ContentView.swift
//  Calculator
//
//  Created by Wang Wei on 2019/06/17.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import SwiftUI
import Combine

let scale = UIScreen.main.bounds.width / 414

struct ContentView : View {

//    @State private var brain: CalculatorBrain = .left("0")
    
//    @ObservedObject var model = CalculatorModel()
    @EnvironmentObject var model: CalculatorModel
    
    @State private var editingHistory = false
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Button("操作记录:\(model.history.count)") {
                print(self.model.history)
                self.editingHistory = true
            }.sheet(isPresented: self.$editingHistory) {
                HistoryView(model: self.model)
            }
            Text(model.brain.output)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24 * scale)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .trailing)
//            CalculatorButtonPad(model: self.model)
            CalculatorButtonPad()
                .padding(.bottom)
        }
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(CalculatorModel())
//            ContentView().previewDevice("iPhone 8")
//            ContentView().previewDevice("iPad Air 2")
        }
    }
}
struct HistoryView: View {
    @ObservedObject var model: CalculatorModel
    var body: some View {
        VStack {
            //1
            if model.totalCount == 0 {
                Text("没有记录")
            } else {
                HStack {
                    Text("记录").font(.headline)
                    Text("\(model.historyDetail)").lineLimit(nil)
                }
                HStack{
                    Text("当前结果").font(.headline)
                    Text("\(model.brain.output)")
                }
                
                //2
                Slider(value: $model.slidingIndex, in: 0...Float(model.totalCount), step: 1)
            }
        }.padding()
    }
}
struct CalculatorButtonPad: View {
    
//    @Binding var brain: CalculatorBrain
//    var model: CalculatorModel
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip),
         .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]

    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
//                CalculatorButtonRow(model: self.model, row: row)
                CalculatorButtonRow(row: row)
            }
        }
    }
}

struct CalculatorButtonRow : View {
    
//    @Binding var brain: CalculatorBrain
//    var model: CalculatorModel
    @EnvironmentObject var model: CalculatorModel

    let row: [CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(
                    title: item.title,
                    size: item.size,
                    backgroundColorName: item.backgroundColorName,
                    foregroundColor: item.foregroundColor)
                {
//                    self.brain = self.brain.apply(item: item)
                    self.model.applay(item)
                }
            }
        }
    }
}

struct CalculatorButton : View {

    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let foregroundColor: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize * scale))
                .foregroundColor(foregroundColor)
                .frame(width: size.width * scale, height: size.height * scale)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width * scale / 2)
        }
    }
}




