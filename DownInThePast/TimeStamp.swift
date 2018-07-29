//
//  TimeStamp.swift
//  DownInThePast
//
//  Created by Anton on 29.07.18.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation

class TimeStamp {
    var hours : Int = 0
    var minutes : Int = 0
    var seconds : Int = 0
    
    func increase() {
        seconds += 1
        if seconds >= 60 {
            seconds = 0
            minutes += 1
        }
        if minutes >= 60 {
            minutes = 0
            hours += 1
        }
    }
    
    func toString() -> String {
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
