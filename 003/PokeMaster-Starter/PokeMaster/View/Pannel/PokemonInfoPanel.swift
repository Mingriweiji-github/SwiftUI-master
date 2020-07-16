//
//  PokemonInfoPanel.swift
//  PokeMaster
//
//  Created by longhuadmin on 2020/7/15.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation
import SwiftUI

struct PokemonInfoPannel: View {
    let model: PokemonViewModel
    //1
    @State var darkBlur = false
    
    var body: some View {
        
        VStack(spacing: 20) {
            // 2
            Button(action: {
                self.darkBlur.toggle()
            }) {
                Text("切换模糊效果")
            }
            topIndicator// 指示器
            Header(model: model) // pokemon头部
            pokemonDescription // 描述信息
            Divider() // 分割线
            AbilityList(
                model: model,
                abilityModels: abilities
            )
            .padding(
                EdgeInsets(
                top: 12,
                leading: 30,
                bottom: 30,
                trailing: 30
                )
            )
        } // VStack
//        .blurBackground(style: .systemMaterial)
        .blurBackground(style: darkBlur ? .systemMaterialDark : .systemMaterial)
        .cornerRadius(20)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    
    var abilities: [AbilityViewModel] {
        AbilityViewModel.sample(pokemonID: model.id)
    }
    
    var topIndicator: some View {
        RoundedRectangle(cornerRadius: 3)
        .frame(width: 40, height: 6)
        .opacity(0.2)
    }

    var pokemonDescription: some View {
        Text(model.descriptionText)
            .font(.callout)
            .foregroundColor(Color(hex: 0x666666))
            .fixedSize(horizontal: false, vertical: true) // 竖直方向显示全部，水平方向按照上层view的限制换行
    }
}


struct PokemonInfoPannel_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoPannel(model: .sample(id: 1))
    }
}
