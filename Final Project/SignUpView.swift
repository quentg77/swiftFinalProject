//
//  SignUpView.swift
//  Final Project
//
//  Created by Quentin GUICHAOUA on 14/02/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import UIKit

protocol SignUpViewDelegate {
    func onSignUpPressed()
    func goToLoginView()
}

class SignUpView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var emailTextBox: UITextField!
    @IBOutlet weak var passwordTextBox: UITextField!
    @IBOutlet weak var confirmPasswordTextBox: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var goToLoginButton: UIButton!
    
    var delegate:SignUpViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SignUpView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        emailTextBox.layer.borderWidth = 1
        emailTextBox.layer.borderColor = UIColor.red.cgColor
        emailTextBox.layer.cornerRadius = 5
    }
    
    func checkEmail() -> Bool {
        if !(emailTextBox.text?.isEmpty ?? true) {
            if let emailString = emailTextBox.text {
                let range = NSRange(location: 0, length: emailString.count)
                
                let regex = try! NSRegularExpression(pattern: "@")
                
                if regex.firstMatch(in: emailString, options: [], range: range) != nil {
                    return true
                }
            }
        }
        return false
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        delegate?.onSignUpPressed()
    }
    
    @IBAction func goToLoginPressed(_ sender: Any) {
        delegate?.goToLoginView()
    }
    @IBAction func emailValueChange(_ sender: Any) {
        print("test email")
        if checkEmail() {
            emailTextBox.layer.borderColor = UIColor.black.cgColor
        }
        else {
            emailTextBox.layer.borderColor = UIColor.red.cgColor
        }
    }
}
