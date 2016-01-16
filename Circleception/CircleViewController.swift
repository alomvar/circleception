//
//  CircleViewController.swift
//  Circleception
//
//  Created by Peter Horn on 16.01.2016.
//  Copyright © 2016 Peter Horn. All rights reserved.
//

import Foundation
import Cocoa

class CircleViewController : NSViewController {
    
    @IBOutlet weak var circleView : CircleView!
    
    override var representedObject: AnyObject? {
        didSet {
            circleView.circles = representedObject as? Circles
        }
    }
}