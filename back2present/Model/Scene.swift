//
//  Scene.swift
//  back2present
//
//  Created by Andressa Valengo on 27/04/19.
//  Copyright © 2019 Andressa Valengo. All rights reserved.
//

import Foundation

struct Scene {
    let id: String
    let title: String?
    let text: String?
    let prevScenes: String?
    let nextScenes: [String]?
    // TODO improve
    let firstOption: String?
    let secondOption: String?
}

extension Scene {
    var isLeaf: Bool {
        return self.nextScenes == nil
    }
    var isRoot: Bool {
        return self.prevScenes == nil
    }
    var hasNext: Bool {
        return self.nextScenes != nil
    }
    var hasPrevious: Bool {
        return self.prevScenes != nil
    }
    var isEnd: Bool {
        return self.prevScenes == nil && self.nextScenes == nil
    }
}

extension Scene {
    var description: CustomStringConvertible {
        return "id: \(id);" +
            " title: \(String(describing: title));" +
            " text: \(String(describing: text));" +
            " prevScenes: \(String(describing: prevScenes));" +
        " nextScenes: \(String(describing: nextScenes));"
    }
}
