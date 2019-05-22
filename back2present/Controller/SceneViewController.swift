//
//  SceneViewController.swift
//  back2present
//
//  Created by Andressa Valengo on 28/04/19.
//  Copyright © 2019 Andressa Valengo. All rights reserved.
//

import UIKit

class SceneViewController: UIViewController {

    @IBOutlet var sceneLabel: UILabel!
    @IBOutlet var sceneText: UITextView!
    @IBOutlet var firstOptionBtn: UIButton!
    @IBOutlet var secondOptionBtn: UIButton!
    
    
    var sceneStack = Stack()
    var currentScene = SceneRepository.shared.getFirstScene()
    let name = SceneRepository.name
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneStack.push(currentScene.id)
        setView(currentScene)
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func setView(_ scene: Scene) {
        var text = scene.text
        if text != nil {
            text = text!.replacingOccurrences(of: "<nome>", with: name, options: .literal, range: nil)
        }
        sceneText.text = text
        sceneLabel.text = scene.title
        
        if scene.firstOption != nil {
            firstOptionBtn.isHidden = false
            firstOptionBtn.setTitle(scene.firstOption, for: .normal)
        } else {
            firstOptionBtn.isHidden = true
        }
        
        if scene.secondOption != nil {
            secondOptionBtn.isHidden = false
            secondOptionBtn.setTitle(scene.secondOption, for: .normal)
        } else {
            secondOptionBtn.isHidden = true
        }
    }
    
    @IBAction func firstOptionClick(_ sender: Any) {
        if currentScene.isEnd {
            dismiss(animated: false, completion: nil)
        } else {
        nextScene(currentScene.nextScenes?.first)
        }
    }
    
    @IBAction func secondOptionClick(_ sender: Any) {
        nextScene(currentScene.nextScenes?.last)
    }
    
    private func nextScene(_ sceneName: String?) {
        currentScene = SceneRepository.shared.getSceneByName(name: sceneName)
        sceneStack.push(currentScene.id)
        setView(currentScene)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

    
}
