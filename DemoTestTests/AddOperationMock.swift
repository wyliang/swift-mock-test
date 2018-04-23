//
//  AddOperationMock.swift
//  DemoTestTests
//
//  Created by David Liang on 4/23/18.
//  Copyright © 2018 David Liang. All rights reserved.
//

import UIKit
import Mockit
import XCTest

class AddOperationMock: AddOperationProtocol, Mock {
    func instanceType() -> AddOperationMock {
        return self
    }
    
    let callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }

    func add(a: Int, b: Int) -> Int {
        return callHandler.accept(0, ofFunction: #function, atFile: #file, inLine: #line, withArgs: a, b) as! Int;
    }
    

}
