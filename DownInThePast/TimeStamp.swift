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
    
    private var timerIsSet : Bool = false
    private var timerIsOver : Bool = false
    private var tHours : Int = 0
    private var tMinutes : Int = 0
    private var tSeconds : Int = 20
    
    func setTimer(hours : Int, minutes : Int, seconds : Int) {
        tHours = hours
        tMinutes = minutes
        tSeconds = seconds
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
        timerIsSet = true
    }
    
    func deactivateTimer() {
        timerIsSet = false
        hours = 0
        minutes = 0
        seconds = 0
    }
    
    func increase() {
        if timerIsSet == false {
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
        else {
            if timerIsOver == false {
                seconds -= 1
                if seconds < 0 {
                    seconds = 59
                    minutes -= 1
                }
                if minutes < 0 {
                    minutes = 59
                    hours -= 1
                }
                if hours < 0 {
                    timerIsOver = true
                    hours = 0
                    minutes = 0
                    seconds = 0
                }
            }
            if timerIsOver == true {
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
        }
    }
    
    func toStringElapsedTime() -> String {
        if timerIsSet == false {
            return toString()
        }
        else {
            if timerIsOver == false {
                var rSeconds = tSeconds - seconds
                var rMinutes = tMinutes - minutes
                var rHours = tHours - hours
                
                if rSeconds < 0 {
                    rSeconds = 60 - seconds
                    rMinutes -= 1
                }
                if rMinutes < 0 {
                    rMinutes = 60 - minutes
                    rHours -= 1
                }
                
                return String(format: "%02d:%02d:%02d", rHours, rMinutes, rSeconds)
            }
            else {
                var rSeconds = tSeconds + seconds
                var rMinutes = tMinutes + minutes
                var rHours = tHours + hours
                
                if rSeconds > 59 {
                    rSeconds -= 60
                    rMinutes += 1
                }
                if rMinutes > 59 {
                    rMinutes -= 60
                    rHours += 1
                }
                
                return String(format: "%02d:%02d:%02d", rHours, rMinutes, rSeconds)
            }
        }
        
    }
    
    func toString() -> String {
        if timerIsSet && timerIsOver {
            return String(format: "- %02d:%02d:%02d", hours, minutes, seconds)
        }
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
