//
//  Functions.swift
//  LapTimer
//
//  Created by Joris ZEFIRINI on 27/04/2017.
//  Copyright © 2017 SoniWeb. All rights reserved.
//

import Foundation
import AVFoundation

let dateFormatter = DateFormatter()

func startTimer(_ view:ChronoViewController) -> Timer{
    return(Timer.scheduledTimer(timeInterval: 0.01, target: view, selector: #selector(ChronoViewController.counter), userInfo: nil, repeats: true))
}

func getDiff(t1: String, t2:String) -> [String] {

    let d1 = dateFormatter.date(from: t1)
    let d2 = dateFormatter.date(from: t2)
    
    
    let interval: TimeInterval
    interval = (d1?.timeIntervalSince(d2!))!

    var code: String
    
    if(interval < 0){
        code = "0"
    }
    else if(interval == 0){
        code = "2"
    }
    else{
        code = "1"
    }
    
    let ti = Int(Swift.abs(interval))
    
    let ms = Swift.abs(Int(interval.truncatingRemainder(dividingBy: 1) * 100))
    let seconds = ti % 60
    let minutes = (ti / 60) % 60
    
    return [code, String(format: "%0.2d:%0.2d.%0.2d",minutes,seconds,ms)]
}
