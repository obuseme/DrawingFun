//
//  DotTests.swift
//  DrawingFun
//
//  Created by Matt Rein on 10/20/14.
//  Copyright (c) 2014 mr. All rights reserved.
//

import Foundation
import XCTest
import CoreGraphics

class DotTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitWithBorder() {
        // This is an example of a functional test case.
        let testBorderRect = CGRectMake(0, 0, 100, 100)
        let dot = Dot(frame: testBorderRect)
        XCTAssert(dot.frame == testBorderRect, "The provided CGRect did not match the Dot's frame.")
    }
    
}
