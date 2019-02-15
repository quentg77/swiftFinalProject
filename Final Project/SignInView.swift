//
//  SignInView.swift
//  Final Project
//
//  Created by Quentin GUICHAOUA on 14/02/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import UIKit

protocol SignInViewDelegate {
    func onLoginPressed()
    func goToRegisterView()
}

class SignInView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var emailTextBox: UITextField!
    @IBOutlet weak var passwordTextBox: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    var delegate:SignInViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SignInView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    @IBAction func LoginPressed(_ sender: Any) {
        delegate?.onLoginPressed()
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        delegate?.goToRegisterView()
    }
}
