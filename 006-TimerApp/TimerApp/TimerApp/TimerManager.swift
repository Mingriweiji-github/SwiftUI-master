//
//  TimerManager.swift
//  TimerApp
//
//  Created by longhuadmin on 2020/7/19.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    var timer = Timer()
    @Published var timerModel: TimerMode = .initial
    @Published var secondsLeft: Int = UserDefaults.standard.integer(forKey: "timerLength")
    
    func start() {
        timerModel = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondsLeft == 0 {
                self.reset()
            }
            self.secondsLeft -= 1
        })
        
    }
    
    func reset() {
        self.timerModel = .initial
        self.secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
        timer.invalidate()
    }
    
    func pause() {
        self.timerModel = .paused
        timer.invalidate()
    }
    
    func setTimerLength(minutes: Int) {
        let defaults = UserDefaults.standard
        defaults.set(minutes, forKey: "timerLength")
        secondsLeft = minutes
    }
}
