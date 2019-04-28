//
//  Stack.swift
//  back2present
//
//  Created by Andressa Valengo on 28/04/19.
//  Copyright © 2019 Andressa Valengo. All rights reserved.
//

import Foundation

struct Stack {
    fileprivate var elements: [String] = []
    
    mutating func push(_ element: String) {
        elements.append(element)
    }
    mutating func pop() -> String? {
        return elements.popLast()
    }
    func peek() -> String? {
        return elements.last
    }
}
