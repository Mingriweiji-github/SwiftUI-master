//
//  PokenmonList.swift
//  PokeMaster
//
//  Created by longhuadmin on 2020/7/15.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation
import SwiftUI

struct PokemonList: View {
    //1
    @State var expendingIndex: Int?
    
    var body: some View {
//        List(PokemonViewModel.all) { pokenmon in
//            PokemonInfoRow(model: pokenmon, expended: false)
//        }//分割线去不掉
        
        ScrollView {
            ForEach(PokemonViewModel.all) { pokmon in
                //2
                PokemonInfoRow(
                    model: pokmon,
                    expended: self.expendingIndex == pokmon.id
                )
                .onTapGesture {
                    withAnimation(
                        .spring(response: 0.55,
                                dampingFraction: 0.425,
                                blendDuration: 0))
                    {
                        if self.expendingIndex == pokmon.id {
                            // nil 表示没有任何cell选中
                            self.expendingIndex = nil
                        } else {
                            // 设置当前pokmon为选中index
                            self.expendingIndex = pokmon.id
                        }
                    }
                }
            }
        }
    }
}
