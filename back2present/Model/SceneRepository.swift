//
//  SceneRepository.swift
//  back2present
//
//  Created by Andressa Valengo on 27/04/19.
//  Copyright © 2019 Andressa Valengo. All rights reserved.
//

import Foundation

final class SceneRepository {
    static let shared = SceneRepository()
    private let sceneLocalSource = SceneLocalSource()
    
    private init() {
        
    }
    
    func getFirstScene() -> Scene {
        // TODO consider to get last scene visited
        return sceneLocalSource.getRootScene()
    }
    
    func getSceneByName(name: String?) -> Scene {
        if name == nil {
            return sceneLocalSource.getTheEnd()
        }
        guard let scene = sceneLocalSource.getSceneById(id: name!) else {
            return sceneLocalSource.getTheEnd()
        }
        return scene
    }
}
