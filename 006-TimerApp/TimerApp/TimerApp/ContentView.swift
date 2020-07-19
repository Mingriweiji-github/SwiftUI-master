//
//  ContentView.swift
//  TimerApp
//
//  Created by longhuadmin on 2020/7/19.
//  Copyright © 2020 KM. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
//    @State var timerMode: TimerMode = .initial
    @State var selectedPickerIndex = 0
    let avaliableMinutes = Array(1...59)
    
    @ObservedObject var timerManager = TimerManager()
    
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                Text("\(secondsToMinutesAndSeconds(seconds: timerManager.secondsLeft))")
                    .font(.system(size: 80))
                    .padding(.top, 80)
                Image(systemName: timerManager.timerModel == .running ? "pause.circle.fill" : "play.circle.fill" )
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .foregroundColor(.orange)
                    .onTapGesture {
                        self.timerManager.timerModel == .running ? self.timerManager.pause() : self.timerManager.start()
                        
                        if self.timerManager.timerModel == .initial {
                            self.timerManager.setTimerLength(minutes: self.avaliableMinutes[self.selectedPickerIndex] * 60)
                        }
                }
                
                if timerManager.timerModel == .initial {
                    Picker(selection: $selectedPickerIndex, label: Text("")) {
                        ForEach(0..<avaliableMinutes.count) {
                            Text("\(self.avaliableMinutes[$0]) min")
                        }
                    }
                    .labelsHidden()
            
                }
                
                if timerManager.timerModel == .paused {
                    Image(systemName: "gobackward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(.top, 40)
                        .onTapGesture {
                            self.timerManager.reset()
                    }
                }
                Spacer()
                
            }.navigationBarTitle("TimerApp")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
