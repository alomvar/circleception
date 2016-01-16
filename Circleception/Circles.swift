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
    var count: Int = 9
    var rotation: Double = 0
    var diameter: Double = 20
    var distanceFromViewCenter: Double = 40
    var strokeWidth: Double = 2
    var strokeColor: NSColor = NSColor.blackColor()
}