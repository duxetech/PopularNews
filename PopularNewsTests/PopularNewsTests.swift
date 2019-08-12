//
//  PopularNewsTests.swift
//  PopularNewsTests
//
//  Created by Karthik on 31/07/19.
//  Copyright © 2019 Karthik. All rights reserved.
//

import XCTest
@testable import PopularNews

class PopularNewsTests: XCTestCase {

    var newsTest : API!
    var storyBoard : UIStoryboard!
    
    override func setUp() {
        super.setUp()
        newsTest = API()
        storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
    }
    
    override func tearDown() {
        newsTest = nil
        storyBoard = nil
        super.tearDown()
        
    }
    
    func testHomeController(){
        let testableVC = storyBoard.instantiateViewController(withIdentifier: "MainVC") as! MainController
        
        //when
        _ = testableVC.view
        
        //then
        XCTAssertNotNil(testableVC.tv)
        
    }
    
    func testDetailController(){
        let testableVC = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        //when
        _ = testableVC.view
        testableVC.createWebView()
        
        //then
        XCTAssertNotNil(testableVC.webView)
        
    }
    
    func testGetAPIResponse(){
        let expect = expectation(description: "De")
        newsTest.getAPIResponse {
            data, response, error in
            DispatchQueue.main.async {
                
                if (error != nil) || (data == nil) {
                    XCTFail("error: \(String(describing: error))")
                }
                expect.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
        
        
    }
    
    func testFetchData(){
        let expect = expectation(description: "Testing getting data")
        
        newsTest.fetchData { dataArray in
            DispatchQueue.main.async {
                XCTAssertEqual(dataArray?.results?.count, 20)
            }
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10.0) { (error) in
            if error != nil {
                XCTFail("error: \(String(describing: error))")
            }
        }
    }
    
    

}
