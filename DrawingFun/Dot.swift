//
//  Dot.swift
//  DrawingFun
//
//  Created by Matt Rein on 10/20/14.
//  Copyright (c) 2014 mr. All rights reserved.
//

import UIKit
import Foundation
import CoreGraphics

class Dot : UIView {
    
    var borderRect : CGRect? //Represents the border of this dot for intersection checking
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        borderRect = frame
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func touchesLine(lineStart: CGPoint, lineEnd: CGPoint) -> Bool {
        
        /*Test whether the line intersects any of:
        *- the bottom edge of the rectangle
        *- the right edge of the rectangle
        *- the top edge of the rectangle
        *- the left edge of the rectangle
        *- the interior of the rectangle (both points inside)
        */
        
        return (lineIntersectsLine(lineStart, line1End: lineEnd, line2Start: CGPointMake(self.frame.origin.x, self.frame.origin.y), line2End: CGPointMake(self.frame.origin.x + self.frame.size.width, self.frame.origin.y)) ||
            lineIntersectsLine(lineStart, line1End: lineEnd, line2Start: CGPointMake(self.frame.origin.x + self.frame.size.width, self.frame.origin.y), line2End: CGPointMake(self.frame.origin.x + self.frame.size.width, self.frame.origin.y + self.frame.size.height)) ||
            lineIntersectsLine(lineStart, line1End: lineEnd, line2Start: CGPointMake(self.frame.origin.x + self.frame.size.width, self.frame.origin.y + self.frame.size.height), line2End: CGPointMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height)) ||
            lineIntersectsLine(lineStart, line1End: lineEnd, line2Start: CGPointMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height), line2End: CGPointMake(self.frame.origin.x, self.frame.origin.y)) ||
            (CGRectContainsPoint(self.frame, lineStart) && CGRectContainsPoint(self.frame, lineEnd)));
    }
    
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