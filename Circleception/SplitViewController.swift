//
//  SplitViewController.swift
//  Circleception
//
//  Created by Peter Horn on 16.01.2016.
//  Copyright © 2016 Peter Horn. All rights reserved.
//

import Foundation
import Cocoa

class SplitViewController : NSSplitViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        representedObject = Circles()
    }
    
    override var representedObject: AnyObject? {
        didSet {
            for childViewController in childViewControllers {
                childViewController.representedObject = representedObject
            }
        }
    }
}