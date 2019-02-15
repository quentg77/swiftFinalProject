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
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        delegate?.onSignUpPressed()
    }
    
    @IBAction func goToLoginPressed(_ sender: Any) {
        delegate?.goToLoginView()
    }
}
