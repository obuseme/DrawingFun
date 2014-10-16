//
//  DrawOnView.swift
//  DrawingFun
//
//

//  Created by Matt Rein on 10/10/14.
//  Copyright (c) 2014 mr. All rights reserved.
//

import UIKit
import CoreGraphics
import Foundation

class DrawOnView: UIView {
    
    let RADIAN_SPLIT = 0.2
    
    var endPoint : CGPoint?
    var startPoint : CGPoint?
    
    var lastStart : CGPoint?
    
    var oldLines = Array<(CGPoint, CGPoint)>()
    
    var centerX : CGFloat?
    var centerY : CGFloat?
    
    override func drawRect(rect: CGRect) {
        centerX = self.frame.size.width / 2
        centerY = self.frame.size.height / 2
        let ctx = UIGraphicsGetCurrentContext()
        drawCurrentDragLine(ctx)
        drawOldLines(ctx)
        drawGlyphBoard(ctx)
    }
    
    func drawGlyphBoard(ctx : CGContextRef) {
        drawCenterPoint(ctx)
        draw1oClockPoint(ctx)
        draw2oClockPoint(ctx)
        draw3oClockPoint(ctx)
        draw4oClockPoint(ctx)
        draw6oClockPoint(ctx)
        draw7oClockPoint(ctx)
        draw8oClockPoint(ctx)
        draw9oClockPoint(ctx)
        draw10oClockPoint(ctx)
        draw12oClockPoint(ctx)
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
    
    func drawCenterPoint(ctx: CGContextRef) {
        let x = self.frame.size.width / 2
        let y = self.frame.size.height / 2
        drawCircleAtPoint(CGPointMake(x, y), withContext: ctx);
    }
    
    func draw1oClockPoint(ctx: CGContextRef) {
        let radius = self.frame.size.height * 0.2
        let x = centerX! + radius * CGFloat(cos(RADIAN_SPLIT * M_PI))
        let y = centerY! - radius * CGFloat(sin(RADIAN_SPLIT * M_PI))
        drawCircleAtPoint(CGPointMake(x, y), withContext: ctx)
    }
    
    func draw2oClockPoint(ctx: CGContextRef) {
        let radius = self.frame.size.height * 0.4
        let x = centerX! + radius * CGFloat(cos(RADIAN_SPLIT * M_PI))
        let y = centerY! - radius * CGFloat(sin(RADIAN_SPLIT * M_PI))
        drawCircleAtPoint(CGPointMake(x, y), withContext: ctx)
    }
    
    func draw3oClockPoint(ctx: CGContextRef) {
        let radius = self.frame.size.height * 0.2
        let x = centerX! + radius * CGFloat(cos(RADIAN_SPLIT * M_PI))
        let y = centerY! + radius * CGFloat(sin(RADIAN_SPLIT * M_PI))
        drawCircleAtPoint(CGPointMake(x, y), withContext: ctx)
    }
    
    func draw4oClockPoint(ctx: CGContextRef) {
        let radius = self.frame.size.height * 0.4
        let x = centerX! + radius * CGFloat(cos(RADIAN_SPLIT * M_PI))
        let y = centerY! + radius * CGFloat(sin(RADIAN_SPLIT * M_PI))
        drawCircleAtPoint(CGPointMake(x, y), withContext: ctx)
    }
    
    func draw6oClockPoint(ctx: CGContextRef) {
        let x = self.frame.size.width / 2
        let y = (self.frame.size.height * 0.9)
        drawCircleAtPoint(CGPointMake(x, y), withContext: ctx)
    }
   
    func draw7oClockPoint(ctx: CGContextRef) {
        let radius = self.frame.size.height * 0.2
        let x = centerX! - radius * CGFloat(cos(RADIAN_SPLIT * M_PI))
        let y = centerY! + radius * CGFloat(sin(RADIAN_SPLIT * M_PI))
        drawCircleAtPoint(CGPointMake(x, y), withContext: ctx)
    }
    
    func draw8oClockPoint(ctx: CGContextRef) {
        let radius = self.frame.size.height * 0.4
        let x = centerX! - radius * CGFloat(cos(RADIAN_SPLIT * M_PI))
        let y = centerY! + radius * CGFloat(sin(RADIAN_SPLIT * M_PI))
        drawCircleAtPoint(CGPointMake(x, y), withContext: ctx)
    }

    func draw9oClockPoint(ctx: CGContextRef) {
        let radius = self.frame.size.height * 0.2
        let x = centerX! - radius * CGFloat(cos(RADIAN_SPLIT * M_PI))
        let y = centerY! - radius * CGFloat(sin(RADIAN_SPLIT * M_PI))
        drawCircleAtPoint(CGPointMake(x, y), withContext: ctx)
    }
    
    func draw10oClockPoint(ctx: CGContextRef) {
        let radius = self.frame.size.height * 0.4
        let x = centerX! - radius * CGFloat(cos(RADIAN_SPLIT * M_PI))
        let y = centerY! - radius * CGFloat(sin(RADIAN_SPLIT * M_PI))
        drawCircleAtPoint(CGPointMake(x, y), withContext: ctx)
    }

    func draw12oClockPoint(ctx: CGContextRef) {
        let x = self.frame.size.width / 2
        //OK so what is radius then??
        let y = (self.frame.size.height * 0.1)
        drawCircleAtPoint(CGPointMake(x, y), withContext: ctx)
    }
    
    func drawCircleAtPoint(center: CGPoint, withContext ctx: CGContextRef) {
        var startAngle: Float = 0.0
        var endAngle: Float =  360.0

        let strokeWidth = 2.0
        let radius = 8.0
        
        // Set the stroke color
        CGContextSetStrokeColorWithColor(ctx, UIColor.blackColor().CGColor)
        
        // Set the line width
        CGContextSetLineWidth(ctx, CGFloat(strokeWidth))
        
        // Set the fill color (if you are filling the circle)
        CGContextSetFillColorWithColor(ctx, UIColor.clearColor().CGColor)
        
        // Rotate the angles so that the inputted angles are intuitive like the clock face: the top is 0 (or 2π), the right is π/2, the bottom is π and the left is 3π/2.
        // In essence, this appears like a unit circle rotated π/2 anti clockwise.
        startAngle = startAngle - Float(M_PI_2)
        endAngle = endAngle - Float(M_PI_2)
        
        // Draw the arc around the circle
        CGContextAddArc(ctx, center.x, center.y, CGFloat(radius), CGFloat(startAngle), CGFloat(endAngle), 0)
        
        // Draw the arc
        CGContextDrawPath(ctx, kCGPathFillStroke) //kCGPathStroke or kCGPathFillStroke to fill and stroke the circle
        
    }
    
}