//
//  ViewController.swift
//  back2present
//
//  Created by Andressa Valengo on 27/04/19.
//  Copyright © 2019 Andressa Valengo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func changeText(_ sender: Any) {
        guard let name = nameTextField.text else {
            return
        }
        SceneRepository.name = name
    }
}

