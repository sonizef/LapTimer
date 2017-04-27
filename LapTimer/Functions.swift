//
//  Functions.swift
//  LapTimer
//
//  Created by Joris ZEFIRINI on 27/04/2017.
//  Copyright © 2017 SoniWeb. All rights reserved.
//

import Foundation

func startTimer(_ view:ChronoViewController) -> Timer{
    return(Timer.scheduledTimer(timeInterval: 0.01, target: view, selector: #selector(ChronoViewController.counter), userInfo: nil, repeats: true))
}
