//
//  AudioDetail.swift
//  SpokenEnglish
//
//  Created by longhuadmin on 2020/7/17.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
import SwiftUI

struct AudioDetail: View {
    let detail: Audio
    var body: some View {
            VStack(alignment: .leading,spacing: 10,
                   content: {
                    
                    HStack(alignment: .top, spacing: 10) {
                        Spacer()
                        Text(getContent(url: detail.fileName))
                    }
                    Spacer()
                    
                   }
            )
            .navigationBarTitle(detail.fileName)

    }
}

struct AudioDetail_Previews: PreviewProvider {
    static var previews: some View {
        AudioDetail(detail:
            Audio(fileName:"01-03",
            detail: "做晚饭",
            url:"http://www.ivytw.com/public/uploads/download/Everyday/01-03.mp3", imageName: "Pokemon-3")
        )
    }
}

func getContent(url name: String) -> String {
    guard let fileURL = Bundle.main.url(forResource: name, withExtension: "txt") else {
        return ""
    }
    if let content = try? String(contentsOf: fileURL) {
        return content
    }
    return ""
}
