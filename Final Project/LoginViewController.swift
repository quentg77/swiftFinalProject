//
//  LoginViewController.swift
//  Final Project
//
//  Created by Quentin GUICHAOUA on 14/02/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import UIKit

class RegisterUser {
    static let instance:RegisterUser = RegisterUser()
    
    var user: User?
    
    func setUser(newUser:User) {
        user = newUser
    }
    
    func setPassword(newPassword:String) {
        print(newPassword)
        user?.setPassword(newPassword: newPassword)
    }
    
    func isUserNil() -> Bool {
        if user == nil {
            return true
        }
        else {
            return false
        }
    }
    
    func checkUser(oneUser:User) -> Bool {
        if oneUser.email == user?.email && oneUser.password == user?.password {
            return true
        }
        else {
            return false
        }
    }
    
    func getEmail() -> String {
        if let email = user?.email {
            return email
        }
        else {
            return "nil"
        }
    }
}

class LoginViewController: UIViewController, SignInViewDelegate, SignUpViewDelegate, ProfilViewDelegate {

    @IBOutlet weak var signUpView: SignUpView!
    @IBOutlet weak var signInView: SignInView!
    @IBOutlet weak var profilView: ProfilView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signInView.delegate = self
        signUpView.delegate = self
        profilView.delegate = self
        signUpView.isHidden = true
        profilView.isHidden = true
    }
    
    func onLoginPressed() {
        if RegisterUser.instance.isUserNil() {
            print("Please register first")
            return
        }
        
        if !(signInView.emailTextBox.text?.isEmpty ?? true) && !(signInView.passwordTextBox.text?.isEmpty ?? true) {
            let check:Bool = RegisterUser.instance.checkUser(oneUser: User(email: signInView.emailTextBox.text ?? "nil", password: signInView.passwordTextBox?.text ?? "nil"))
            
            if check {
                goToProfilView()
                profilView.emailLabel.text = "Email : \(RegisterUser.instance.getEmail())"
                print("Successful login")
                return
            }
        }
        print("Unalble to find a match with this pair of email / password")
    }
    
    func onSignUpPressed() {
        if !(signUpView.emailTextBox.text?.isEmpty ?? true) && !(signUpView.passwordTextBox.text?.isEmpty ?? true) && !(signUpView.confirmPasswordTextBox.text?.isEmpty ?? true) {
            if signUpView.passwordTextBox.text == signUpView.confirmPasswordTextBox.text {
                RegisterUser.instance.setUser(newUser: User(email: signUpView.emailTextBox.text ?? "nil", password: signUpView.passwordTextBox.text ?? "nil"))
                print("Successful sign up")
                goToLoginView()
                return
            }
        }
        print("Email or password invalid")
    }
    
    func goToRegisterView() {
        resetTextField(uiview: "signInView")
        resetTextField(uiview: "profilView")
        signInView.isHidden = true
        profilView.isHidden = true
        signUpView.isHidden = false
    }
    
    func goToLoginView() {
        resetTextField(uiview: "signUpView")
        resetTextField(uiview: "profilView")
        signUpView.isHidden = true
        profilView.isHidden = true
        signInView.isHidden = false
    }
    
    func goToProfilView() {
        resetTextField(uiview: "signInView")
        resetTextField(uiview: "signUpView")
        signInView.isHidden = true
        signUpView.isHidden = true
        profilView.isHidden = false
    }
    
    func resetTextField(uiview:String) {
        if uiview == "signUpView" {
            signUpView.emailTextBox.text = ""
            signUpView.passwordTextBox.text = ""
            signUpView.confirmPasswordTextBox.text = ""
        }
        else if uiview == "signInView" {
            signInView.emailTextBox.text = ""
            signInView.passwordTextBox.text = ""
        }
        else if uiview == "profilView" {
            profilView.passwordTextBox.text = ""
            profilView.confirmPasswordTextBox.text = ""
        }
    }
    
    func onChangePasswordPressed() {
        if !(profilView.passwordTextBox.text?.isEmpty ?? true) && !(profilView.confirmPasswordTextBox.text?.isEmpty ?? true) {
            if profilView.passwordTextBox.text == profilView.confirmPasswordTextBox.text {
                RegisterUser.instance.setPassword(newPassword: profilView.passwordTextBox.text ?? "nil")
                resetTextField(uiview: "profilView")
                print("Password change is a success")
                return
            }
        }
        print("Password are not matching")
    }
    
    func onLogoutPressed() {
        goToLoginView()
    }
}
