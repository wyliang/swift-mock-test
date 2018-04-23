//
//  DemoTestTests.swift
//  DemoTestTests
//
//  Created by David Liang on 4/23/18.
//  Copyright © 2018 David Liang. All rights reserved.
//

import XCTest
@testable import DemoTest
import Mockit

class DemoTestTests: XCTestCase {
    
    // Instantiate a mock object
    lazy var mock = AddOperationMock(testCase: self)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Create a stub
        let stub = mock.when()
        
        // When the add operation is called with a = 1 and b = 1, then return 3. Otherwise,
        // it just returns the default value which is 0
        stub.call(withReturnValue: mock.add(a: 1, b: 1)).thenReturn(3)
        
        // System under test
        let sut = Calculator(operation: mock)
        
        // Call the add operation and internally it will use the stub class we set up earlier
        let result = sut.add(a: 1, b: 1)
        
        // After the call, we verify that the add operation on our stub class is called once with these two arguments
        mock.verify(verificationMode: Once()).add(a: 1, b: 1)
        
        // Assert that the result is what we expected
        assert(result == 3)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
