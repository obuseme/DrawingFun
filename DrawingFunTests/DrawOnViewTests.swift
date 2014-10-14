//
//  DrawOnViewTests.swift
//  DrawingFun
//
//  Created by Matt Rein on 10/13/14.
//  Copyright (c) 2014 mr. All rights reserved.
//

import UIKit
import XCTest


class DrawOnViewTests: XCTestCase {

    let drawOnView = DrawOnView()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddLine() {

       XCTAssertEqual(drawOnView.oldLines.count, 0, "Should start with 0 lines")
        
        drawOnView.startPoint = CGPoint(x: 0, y:0)
        drawOnView.endPoint = CGPoint(x: 100, y: 100)
        
        drawOnView.addLine()
        
        XCTAssertEqual(drawOnView.oldLines.count, 1, "Should have a line now")
    }
    
    func testClearAllShouldRemoveAllLinesAndClearStartAndEnd() {
     
        drawOnView.startPoint = CGPoint(x: 0, y:0)
        drawOnView.endPoint = CGPoint(x: 100, y: 100)
        
        drawOnView.addLine()
        XCTAssertEqual(drawOnView.oldLines.count, 1, "Should have a line now")
        
        drawOnView.clearAll()
        
        XCTAssertEqual(drawOnView.oldLines.count, 0, "Should have no lines after clearAll()")

        
        XCTAssert(drawOnView.startPoint? == nil, "Start point should be cleared out!")
                XCTAssert(drawOnView.endPoint? == nil, "End point should be cleared out!")
    }

}