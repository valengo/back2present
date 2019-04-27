//
//  SceneLocalSource.swift
//  back2present
//
//  Created by Andressa Valengo on 27/04/19.
//  Copyright © 2019 Andressa Valengo. All rights reserved.
//

import Foundation

final class SceneLocalSource {
    
    private enum SceneIds: String {
        case root, hospital, secretLab
        case exploreRoom, leaveRoom
        case turnOnTV, leaveRoomAfterExploring
        case watchJournal, watchMovie
        case sisterArrival
        case callDoctor, keepTalking
    }
    
    private enum FieldNames {
        static let Previous = "PreviousScene"
        static let Next = "NextScenes"
        static let Title = "SceneTitle"
        static let Text = "SceneText"
    }
    
    private var sceneGraph = [
        SceneIds.root: [
            FieldNames.Next: [SceneIds.hospital, SceneIds.secretLab]
        ],
        
        SceneIds.hospital : [
            
            FieldNames.Previous: SceneIds.root,
            FieldNames.Next: [SceneIds.exploreRoom, SceneIds.leaveRoom]
        ],
        
        SceneIds.exploreRoom: [
            FieldNames.Previous: SceneIds.hospital,
            FieldNames.Next: [SceneIds.turnOnTV, SceneIds.leaveRoomAfterExploring]
        ],
        
        SceneIds.turnOnTV: [
            FieldNames.Previous: SceneIds.exploreRoom,
            FieldNames.Next: [SceneIds.watchMovie, SceneIds.watchJournal]
        ],
        SceneIds.watchMovie: [
            FieldNames.Previous: SceneIds.turnOnTV,
            FieldNames.Next: [SceneIds.sisterArrival]
        ],
        
        SceneIds.watchJournal: [
            FieldNames.Previous: SceneIds.turnOnTV,
            FieldNames.Next: [SceneIds.sisterArrival]
        ],
        
        SceneIds.sisterArrival: [
            FieldNames.Previous: SceneIds.watchMovie,
            FieldNames.Next: [SceneIds.keepTalking, SceneIds.callDoctor]
        ],
        
        SceneIds.keepTalking: [
            FieldNames.Previous: SceneIds.sisterArrival,
        ],
        
        SceneIds.secretLab: [
            FieldNames.Previous: SceneIds.root
        ],
        
        SceneIds.leaveRoom: [
            FieldNames.Previous: SceneIds.hospital
        ],
        
        SceneIds.leaveRoomAfterExploring: [
            FieldNames.Previous: SceneIds.exploreRoom
        ],
        
        SceneIds.callDoctor: [
            FieldNames.Previous: SceneIds.sisterArrival
        ]
        
    ]
    
    func getSceneById(id: String) -> Scene? {
        guard let sceneId = SceneIds(rawValue: id) else {
            return nil
        }
        guard let sceneNode = sceneGraph[sceneId] else {
            return nil
        }
        
        let previousNode = sceneNode[FieldNames.Previous] as? SceneIds
        let prevScene = previousNode?.rawValue
        
        var nextScenes: [String]? = nil
        let nextNodes = sceneNode[FieldNames.Next] as? [SceneIds]
        if nextNodes != nil {
            nextScenes = [String]()
            for node in nextNodes! {
                nextScenes?.append(node.rawValue)
            }
        }
        let scene = Scene(id: id,
                          title: "A great scene",
                          text: "Once upon a time...",
                          prevScenes: prevScene,
                          nextScenes: nextScenes)
        return scene
    }
    
    func getRootScene() -> Scene {
        return getSceneById(id: SceneIds.root.rawValue)!
    }
}
