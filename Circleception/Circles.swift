//
//  Circles.swift
//  Circleception
//
//  Created by Peter Horn on 16.01.2016.
//  Copyright © 2016 Peter Horn. All rights reserved.
//

import Foundation
import Cocoa

//
// Data Model
// 
// Clarification: It is not supposed to represent circles
// but only the parameters how they are drawn in the view.
//
class Circles: NSObject {
    var numberOfCircles: Int
    var rotation: Double
    var circleDiameter: Double
    var circleDistanceFromViewCenter: Double
    var circleStrokeWidth: Double
    var circleStrokeColor: NSColor
    
    override init() {
        numberOfCircles = 9
        rotation = 0
        circleDiameter = 20
        circleDistanceFromViewCenter = 40
        circleStrokeWidth = 2
        circleStrokeColor = NSColor.blackColor()
        
        super.init()
    }
}