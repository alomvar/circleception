//
//  CircleView.swift
//  Circleception
//
//  Created by Peter Horn on 15.01.2016.
//  Copyright © 2016 Peter Horn. All rights reserved.
//

import Foundation
import Cocoa

//
// Renders circles in form of a circle.
//
@IBDesignable
class CircleView : NSView
{
    @IBInspectable var count: Int = 4
    @IBInspectable var rotation: Double = 0
    @IBInspectable var diameter: Double = 10
    @IBInspectable var distanceFromViewCenter: Double = 20
    @IBInspectable var strokeWidth: Double = 1
    @IBInspectable var strokeColor: NSColor = NSColor.blackColor()
    
    // The key paths of the assigned data model (if assigned) to observe.
    private let modelKeysToObserve = [
        "count",
        "rotation",
        "diameter",
        "distanceFromViewCenter",
        "strokeWidth",
        "strokeColor"
    ]
    
    var circles: Circles? {
        willSet {
            // If the new model is a different instance than the current one, remove all observations.
            if (circles != nil && newValue != circles) {
                for key in modelKeysToObserve {
                    circles?.removeObserver(self, forKeyPath: key)
                }
            }
        }
        didSet {
            // Set up property observation for the newly assigned data model.
            for key in modelKeysToObserve {
                if let model = circles {
                    model.addObserver(self, forKeyPath: key, options: NSKeyValueObservingOptions.New, context: nil)
                }
            }
        }
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if let keyPath = keyPath {
            if (modelKeysToObserve.contains(keyPath)) {
                self.setValue(change!["new"], forKeyPath: keyPath)
                self.needsDisplay = true
            }
        }
    }
 
    override func drawRect(dirtyRect: NSRect) {
        
        // Clear view independent from data model being set.
        NSColor.whiteColor().setFill()
        let background = NSBezierPath(rect: bounds)
        background.fill()
        
        // If data model is set, draw circles.
        if let circles = circles {
            let radialSegment = (360.0 / Double(circles.count)) * (M_PI / 180)
            let viewCenter = NSPoint(x: bounds.width / 2, y: bounds.height / 2)
            let radialRotation = circles.rotation * (M_PI / 180)
            circles.strokeColor.setStroke()
            
            for iterator in Range(start: 0, end: circles.count) {
                var circleCenter = viewCenter
                
                // Relative translation of each circle...
                let cosinus = cos((radialSegment * Double(iterator)) + radialRotation)
                let sinus = sin((radialSegment * Double(iterator)) + radialRotation)
                
                circleCenter.x += CGFloat(circles.distanceFromViewCenter * cosinus)
                circleCenter.y += CGFloat(circles.distanceFromViewCenter * sinus)
                
                // ...based in its center.
                circleCenter.x -= CGFloat(circles.diameter / 2)
                circleCenter.y -= CGFloat(circles.diameter / 2)
                
                let bezierRect = NSRect(x: CGFloat(circleCenter.x), y: CGFloat(circleCenter.y), width: CGFloat(circles.diameter), height: CGFloat(circles.diameter))
                let bezierPath = NSBezierPath(ovalInRect: bezierRect)
                
                bezierPath.lineWidth = CGFloat(circles.strokeWidth)
                bezierPath.stroke()
            }
        }
    }
}
