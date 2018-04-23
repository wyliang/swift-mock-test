//
//  Calculator.swift
//  DemoTest
//
//  Created by David Liang on 4/23/18.
//  Copyright © 2018 David Liang. All rights reserved.
//

import Foundation

protocol AddOperationProtocol {
    func add(a: Int, b: Int) -> Int
}

class AddOperation: AddOperationProtocol {
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
}

class Calculator: NSObject {
    private var addOperation: AddOperationProtocol
    init(operation: AddOperationProtocol) {
        self.addOperation = operation

        super.init()
    }
    
    public func add(a: Int, b: Int) -> Int {
        return self.addOperation.add(a:a, b:b)
    }
}
