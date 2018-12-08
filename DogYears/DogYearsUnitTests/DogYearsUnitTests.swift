//
//  DogYearsUnitTests.swift
//  DogYearsUnitTests
//
//  Created by Norman Lim on 1/12/2018.
//  Copyright © 2018 Razeware. All rights reserved.
//

import XCTest
@testable import DogYears

class DogYearsUnitTests: XCTestCase {
    
    let calc = Calculator()
    var resData: Data? = nil

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAdd() {
        let result = calc.evaluate(op: "+", arg1: 2.0, arg2: 9.0)
        XCTAssert(result == 11.0, "Calculator add operation failed")
    }
    
    func testSubtract() {
        let result = calc.evaluate(op: "-", arg1: 9.0, arg2: 3.0)
        XCTAssertEqual(result, 6, "Calculator subtract operation failed")
    }
    
    func testResult() {
        let res1 = calc.evaluate(op: "+", arg1: 2.0, arg2: 2.0)
        let res2 = calc.result
        XCTAssert(res1 == res2, "Calculator displayed result does not match calculation result.")
    }

    func testClear() {
        calc.clear()
        let result = calc.result
        XCTAssert(result == 0.0, "Calculator clear operation failed")
    }
    
    func testInfoLoading() { // test for async
        let url = "https://raw.githubusercontent.com/FahimF/Test/DogYears-Info.rtf"
        HTTPClient.shared.get(url: url) { (data, error) in
            self.resData = data
        }
        let pred = NSPredicate(format: "resData != nil")
        let exp = expectation(for: pred, evaluatedWith: self, handler: nil)
        let res = XCTWaiter.wait(for: [exp], timeout: 5.0)
        if res == XCTWaiter.Result.completed {
            XCTAssertNotNil(resData, "No data received from the server for InfoView content")
        } else {
            XCTAssert(false, "The call to get the URL ran into some other error")
        }
    }

}
