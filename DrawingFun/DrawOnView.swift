//
//  DrawOnView.swift
//  DrawingFun
//
//

//  Created by Matt Rein on 10/10/14.
//  Copyright (c) 2014 mr. All rights reserved.
//

import UIKit

class DrawOnView: UIView {
    
    var touchPoint : CGPoint?
    var startPoint : CGPoint?
    
    override func drawRect(rect: CGRect) {
        if let point = touchPoint {
            if let start = startPoint {
                let ctx = UIGraphicsGetCurrentContext()
                CGContextMoveToPoint(ctx, start.x, start.y)
                CGContextAddLineToPoint(ctx, point.x, point.y)
                CGContextStrokePath(ctx)
            }
        }
    }
    
    
}