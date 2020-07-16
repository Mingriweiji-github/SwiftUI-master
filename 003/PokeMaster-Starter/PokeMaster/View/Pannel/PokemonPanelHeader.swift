//
//  PokemonPanelHeader.swift
//  PokeMaster
//
//  Created by longhuadmin on 2020/7/15.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

extension PokemonInfoPannel {
    
    struct Header: View {
        
        let model: PokemonViewModel
        var body: some View {
            HStack(spacing: 18) {
                pokenmonIcon
                nameSpace
                verticalDivider
                VStack (spacing: 12){
                    bodyStatus
                    typeInfo
                }
            }
        }
        
        
        //2
        var pokenmonIcon: some View {
            Image("Pokemon-\(model.id)")
            .resizable()
            .frame(width: 68, height: 68)
        }
        //3
        var nameSpace: some View {
//            VStack{
//                Text(model.name)
//                    .font(.system(size: 22, weight: .bold, design: .default))
//                    .foregroundColor(model.color)
//                Text(model.nameEN)
//                    .font(.system(size: 13, weight: .bold, design: .default))
//                    .foregroundColor(model.color)
//                Spacer(minLength: 10)
//                Text(model.genus)
//                    .font(.system(size: 13, weight: .bold, design: .default))
//                    .foregroundColor(.gray)
//            }
            VStack(spacing: 10) {
                VStack {
                    Text(model.name)
                        .font(.system(size: 22, weight: .bold, design: .default))
                        .foregroundColor(model.color)
                    Text(model.nameEN)
                        .font(.system(size: 13, weight: .bold, design: .default))
                        .foregroundColor(model.color)
                }
                Text(model.genus)
                    .font(.system(size: 13, weight: .bold, design: .default))
                    .foregroundColor(.gray)
            }
        }
        // 4
        var verticalDivider: some View {
//            Text("")
//            .frame(width: 1, height: 44)
//            .opacity(0.1)
            RoundedRectangle(cornerRadius: 1)
                .frame(width: 1, height: 44)
                .opacity(0.1)
        }
        // 5
        var bodyStatus: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text("身高")
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                    Text(model.height)
                        .font(.system(size: 11))
                        .foregroundColor(model.color)
                }
                HStack {
                    Text("体重")
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                    Text(model.weight)
                        .font(.system(size: 11))
                        .foregroundColor(model.color)
                    
                }
            }
        }
        // 6
        var typeInfo: some View {
            HStack {
                ForEach(model.types) { type in
                    ZStack{
                        RoundedRectangle(cornerRadius: 7)
                            .fill(type.color)
                            .frame(width: 36, height: 14)
                        Text(type.name)
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                    }
                }
            }
        }        
    }
}

