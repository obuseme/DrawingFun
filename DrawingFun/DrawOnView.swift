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

    var centerRect : CGRect?
    
    override func drawRect(rect: CGRect) {
        centerX = self.frame.size.width / 2
        centerY = self.frame.size.height / 2
        let ctx = UIGraphicsGetCurrentContext()
        drawCurrentDragLine(ctx)
        drawOldLines(ctx)
        drawGlyphBoard(ctx)

 if let end = endPoint {
            if let start = startPoint {
                if (rectContainsLine(centerRect!, lineStart: start, lineEnd: end)){
                    NSLog("Intersects yo!")
                }
            }
        }

        
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
        let radius = self.frame.size.height * 0.2
        let x = self.frame.size.width / 2
        let y = self.frame.size.height / 2
        centerRect = CGRectMake(x, y, radius, radius)
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

    //    - (BOOL)rectContainsLine:(CGRect)rect startPoint:(CGPoint)lineStart endPoint:(CGPoint)lineEnd
    func rectContainsLine(rect: CGRect, lineStart: CGPoint, lineEnd: CGPoint) -> Bool {
        
        /*Test whether the line intersects any of:
        *- the bottom edge of the rectangle
        *- the right edge of the rectangle
        *- the top edge of the rectangle
        *- the left edge of the rectangle
        *- the interior of the rectangle (both points inside)
        */
        
        return (lineIntersectsLine(lineStart, line1End: lineEnd, line2Start: CGPointMake(rect.origin.x, rect.origin.y), line2End: CGPointMake(rect.origin.x + rect.size.width, rect.origin.y)) ||
            lineIntersectsLine(lineStart, line1End: lineEnd, line2Start: CGPointMake(rect.origin.x + rect.size.width, rect.origin.y), line2End: CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height)) ||
            lineIntersectsLine(lineStart, line1End: lineEnd, line2Start: CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height), line2End: CGPointMake(rect.origin.x, rect.origin.y + rect.size.height)) ||
            lineIntersectsLine(lineStart, line1End: lineEnd, line2Start: CGPointMake(rect.origin.x, rect.origin.y + rect.size.height), line2End: CGPointMake(rect.origin.x, rect.origin.y)) ||
            (CGRectContainsPoint(rect, lineStart) && CGRectContainsPoint(rect, lineEnd)));
    }

    

//    BOOL (^LineIntersectsLine)(CGPoint, CGPoint, CGPoint, CGPoint) = ^BOOL(CGPoint line1Start, CGPoint line1End, CGPoint line2Start, CGPoint line2End) {
    func lineIntersectsLine(line1Start: CGPoint, line1End: CGPoint, line2Start: CGPoint, line2End: CGPoint) -> Bool {

         //Distance between the lines' starting rows times line2's horizontal length
        var q = (line1Start.y - line2Start.y) * (line2End.x - line2Start.x) - (line1Start.x - line2Start.x) * (line2End.y - line2Start.y);
        var d =
            //Line 1's horizontal length times line 2's vertical length
            (line1End.x - line1Start.x) * (line2End.y - line2Start.y)
            //Line 1's vertical length times line 2's horizontal length
            - (line1End.y - line1Start.y) * (line2End.x - line2Start.x);
        
        if( d == 0 ) {
            return false;
        }
        
        var r = q / d;
        
        q =
            //Distance between the lines' starting rows times line 1's horizontal length
            (line1Start.y - line2Start.y) * (line1End.x - line1Start.x)
            //Distance between the lines' starting columns times line 1's vertical length
            - (line1Start.x - line2Start.x) * (line1End.y - line1Start.y);
        
        var s = q / d;
        if( r < 0 || r > 1 || s < 0 || s > 1 ) {
            return false;
        }
        
        return true;

    }

}