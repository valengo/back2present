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
    let title: String
    let text: String
    let prevScenes: String?
    let nextScenes: [String]?
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
}
