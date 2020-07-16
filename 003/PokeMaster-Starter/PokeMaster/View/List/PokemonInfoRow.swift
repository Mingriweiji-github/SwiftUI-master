//
//  PokemonInfoRow.swift
//  PokeMaster
//
//  Created by longhuadmin on 2020/7/15.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation
import SwiftUI

struct PokemonInfoRow: View {
    //定义model
//    let model = PokemonViewModel.sample(id: 1)
    let model: PokemonViewModel
//    @State var expended: Bool
    let expended: Bool
    
    var body: some View {
        VStack{
            HStack{
                // Image设置frame前需要resizable()
                Image("Pokemon-\(model.id)")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: ContentMode.fit)
                    .shadow(radius: 4)
                Spacer()
                VStack(alignment: .trailing) {
                    Text(model.name)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    Text(model.nameEN)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            .padding(.top, 15)
            
            Spacer() // 1
            
            HStack(spacing: expended ? 20: -30 ){ //2 隐藏状态高度为-30
                Spacer()
                Button(action: {
                    print("Fav")
                }) {
                    Image(systemName: "star")
                        .modifier(ToolButtonModifier())
                }
                Button(action: {
                    print("Panel")
                }) {
                    Image(systemName: "chart.bar")
                        .modifier(ToolButtonModifier())
                }
                Button(action: {
                    print("web")
                }) {
                    Image(systemName: "info.circle")
                        .modifier(ToolButtonModifier())
                }
            }
            .padding(.bottom, 12)
            .opacity(expended ? 1 : 0.0)//3 通过透明度来隐藏按钮
            .frame(maxHeight: expended ? .infinity : 0) // 4 设置按钮高度
        } //VStack
        .frame(height: expended ? 120 : 80) //5 设置Vstack高度
        .padding(.leading, 25)
        .padding(.trailing, 15)
        .background(
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(model.color, style: StrokeStyle(lineWidth: 4))
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.white, model.color]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            }
        )
        .padding(.horizontal)
//         .animation(.default) // 隐式动画
//        .onTapGesture { // 6 为VStack cell添加手势
//            withAnimation ( // 7 使用显式动画
//                .spring(
//                    response: 0.55,
//                    dampingFraction: 0.425,
//                    blendDuration: 0
//                )
//            ) {
//                self.expended.toggle()
//            }
//        }
    }
}

struct PokemonInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            PokemonInfoRow(model: .sample(id: 1), expended: false)
            PokemonInfoRow(model: .sample(id: 21), expended: true)
            PokemonInfoRow(model: .sample(id: 25), expended: false)
        }
    }
}

