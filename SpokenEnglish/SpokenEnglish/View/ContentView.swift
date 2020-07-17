//
//  ContentView.swift
//  SpokenEnglish
//
//  Created by longhuadmin on 2020/7/17.
//  Copyright © 2020 KM. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
    let audios = [
        Audio(fileName:"01-01",
              detail: "吃早餐",
              url:"http://www.ivytw.com/public/uploads/download/Everyday/01-01.mp3",
              imageName: "Pokemon-1"),
        Audio(fileName:"01-02",
              detail: "叫外卖",
              url:"http://www.ivytw.com/public/uploads/download/Everyday/01-02.mp3", imageName: "Pokemon-2"),
        Audio(fileName:"01-03",
              detail: "做晚饭",
              url:"http://www.ivytw.com/public/uploads/download/Everyday/01-03.mp3", imageName: "Pokemon-3")
    ]
    var body: some View {
        NavigationView {
            //1、给List添加navigationBarTitle
            //2、给row添加NavigationLink跳转到AudioDetail()
            List(audios) { audio in
                NavigationLink(
                destination: AudioDetail(detail: audio)) {
                    AudioRow(audio: audio)
                }
            }.navigationBarTitle("Audios")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
