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
    
    var endPoint : CGPoint?
    var startPoint : CGPoint?
    
    var lastStart : CGPoint?
    
    var oldLines = Array<(CGPoint, CGPoint)>()
    
    override func drawRect(rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        drawCurrentDragLine(ctx)
        drawOldLines(ctx)
    }
    
    func removeLast() {
        endPoint = nil
        startPoint = nil
        oldLines.removeLast()
    }
    
    func clearAll() {
        endPoint = nil
        startPoint = nil
        oldLines.removeAll(keepCapacity: false)
    }
    
    func addLine() {
        if let end = endPoint {
            if let start = startPoint {
                oldLines.append((start,end))
            }
        }

    }
    
    func drawOldLines(ctx: CGContextRef) {
        for (start,end) in oldLines {
            drawLine(ctx, withStart:start, andEnd:end)
        }
    }
    
    func drawCurrentDragLine(ctx: CGContextRef) {
        if let end = endPoint {
            if let start = startPoint {
                drawLine(ctx, withStart:start, andEnd:end)
            }
        }
    }
    
    func drawLine(ctx: CGContextRef, withStart start: CGPoint, andEnd end: CGPoint) {
        CGContextMoveToPoint(ctx, start.x, start.y)
        CGContextAddLineToPoint(ctx, end.x, end.y)
        CGContextStrokePath(ctx)
    }
    
}