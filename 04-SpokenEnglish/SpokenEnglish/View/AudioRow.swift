//
//  AudioView.swift
//  SpokenEnglish
//
//  Created by longhuadmin on 2020/7/17.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
import SwiftUI

struct AudioRow: View {
    let audio: Audio
    var body: some View {
        HStack {
            Image(audio.imageName)
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(60)
                .shadow(radius: 3)
            Spacer()
            VStack {
                Text(audio.fileName)
                Text(audio.detail)
            }
        }
    }
}

struct AudioRow_Previews: PreviewProvider {
    static var previews: some View {
        AudioRow(audio:
            Audio(
                fileName:"01-01",
                detail: "吃早餐",
                url:"http://www.ivytw.com/public/uploads/download/Everyday/01-01.mp3",
                imageName: "Pokemon-1"
            )
        )
    }
}
