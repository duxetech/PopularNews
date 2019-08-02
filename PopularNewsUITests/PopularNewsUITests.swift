//
//  PopularNewsUITests.swift
//  PopularNewsUITests
//
//  Created by Karthik on 31/07/19.
//  Copyright © 2019 Karthik. All rights reserved.
//

import XCTest

class PopularNewsUITests: XCTestCase {

    var app : XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
      
    }
    
    override func tearDown() {
        app = nil
    }
    
    
    func testTableView() {
        
        let cell = app.tables.staticTexts["By BEN CASSELMAN"]
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: cell, handler: nil)
        waitForExpectations(timeout: 15, handler: nil)
        XCTAssertTrue(cell.exists)
    }
    
    func testNavigation() {
        
        app.tables.staticTexts["By BEN CASSELMAN"].tap()
        
        let page = app.navigationBars["PopularNews.DetailView"].buttons["Most Popular News"]
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: page, handler: nil)
        waitForExpectations(timeout: 15)
        XCTAssertTrue(page.exists)
        
        
    }
    
    
   

}
