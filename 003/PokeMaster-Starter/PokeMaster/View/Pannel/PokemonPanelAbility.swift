//
//  PokemonPanelAbility.swift
//  PokeMaster
//
//  Created by longhuadmin on 2020/7/15.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

extension PokemonInfoPannel {
    struct AbilityList: View {
        let model: PokemonViewModel
        let abilityModels: [AbilityViewModel]?
        var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                Text("技能")
                    .font(.headline)
                    .fontWeight(.bold)
                if abilityModels != nil {
                    ForEach(abilityModels!) { ability in
                        Text(ability.name)
                            .font(.subheadline)
                            .foregroundColor(self.model.color)
                        
                        Text(ability.descriptionText)
                            .font(.footnote)
                            .foregroundColor(.gray)
                        .fixedSize(horizontal: false, vertical: true)
                        
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }
}
