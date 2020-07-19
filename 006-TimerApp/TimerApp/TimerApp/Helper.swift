//
//  Helper.swift
//  TimerApp
//
//  Created by longhuadmin on 2020/7/19.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
enum TimerMode {
    case running
    case paused
    case initial
}

func secondsToMinutesAndSeconds(seconds: Int) -> String {
    let minutes = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    let minuteStamp = minutes.count > 1 ? minutes : "0" + minutes
    let secondStamp = seconds.count > 1 ? minutes : "0" + seconds
    return "\(minuteStamp):\(secondStamp)"
}