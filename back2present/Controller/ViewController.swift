//
//  ViewController.swift
//  back2present
//
//  Created by Andressa Valengo on 27/04/19.
//  Copyright © 2019 Andressa Valengo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
        nameTextField.delegate = self
        nameTextField.useUnderline()
        
        
    }
    
    @IBAction func changeText(_ sender: Any) {
        guard let name = nameTextField.text else {
            return
        }
        SceneRepository.name = name
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardFrame.height
        }

    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ nameTextField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

extension UITextField {
    func useUnderline() {
        let underline = CALayer()
        let borderWidth = CGFloat(1.0)
        let color = UIColor.white.withAlphaComponent(0.5)
        underline.borderColor = color.cgColor
        underline.frame = CGRect(origin: CGPoint(x: 0, y : self.frame.size.height - borderWidth),
                                 size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        underline.borderWidth = borderWidth
        self.layer.addSublayer(underline)
        self.layer.masksToBounds = true

    }
}

