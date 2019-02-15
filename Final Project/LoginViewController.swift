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
    @IBOutlet weak var alertLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signInView.delegate = self
        signUpView.delegate = self
        profilView.delegate = self
        signUpView.isHidden = true
        profilView.isHidden = true
        
        alertLabel.layer.masksToBounds = true
        alertLabel.layer.cornerRadius = 25
        alertLabel.isHidden = true
    }
    
    func onLoginPressed() {
        if RegisterUser.instance.isUserNil() {
            showAlert(alertMessage: "Please register first")
            print("Please register first")
            return
        }
        
        if !(signInView.emailTextBox.text?.isEmpty ?? true) && !(signInView.passwordTextBox.text?.isEmpty ?? true) {
            let check:Bool = RegisterUser.instance.checkUser(oneUser: User(email: signInView.emailTextBox.text ?? "nil", password: signInView.passwordTextBox?.text ?? "nil"))
            
            if check {
                goToProfilView()
                profilView.emailLabel.text = "Email : \(RegisterUser.instance.getEmail())"
                showAlert(alertMessage: "Successful login")
                print("Successful login")
                return
            }
        }
        showAlert(alertMessage: "Unalble to find a match with this pair of email / password")
        print("Unalble to find a match with this pair of email / password")
    }
    
    func onSignUpPressed() {
        if !(signUpView.emailTextBox.text?.isEmpty ?? true) && !(signUpView.passwordTextBox.text?.isEmpty ?? true) && !(signUpView.confirmPasswordTextBox.text?.isEmpty ?? true) {
            if signUpView.passwordTextBox.text == signUpView.confirmPasswordTextBox.text {
                RegisterUser.instance.setUser(newUser: User(email: signUpView.emailTextBox.text ?? "nil", password: signUpView.passwordTextBox.text ?? "nil"))
                showAlert(alertMessage: "Successful sign up")
                print("Successful sign up")
                goToLoginView()
                return
            }
        }
        showAlert(alertMessage: "Email or password invalid")
        print("Email or password invalid")
    }
    
    func onChangePasswordPressed() {
        if !(profilView.passwordTextBox.text?.isEmpty ?? true) && !(profilView.confirmPasswordTextBox.text?.isEmpty ?? true) {
            if profilView.passwordTextBox.text == profilView.confirmPasswordTextBox.text {
                RegisterUser.instance.setPassword(newPassword: profilView.passwordTextBox.text ?? "nil")
                resetTextField(uiview: "profilView")
                showAlert(alertMessage: "Password change is a success")
                print("Password change is a success")
                return
            }
        }
        showAlert(alertMessage: "Password are not matching")
        print("Password are not matching")
    }
    
    func onLogoutPressed() {
        goToLoginView()
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
    
    func showAlert(alertMessage:String) {
        alertLabel.text = alertMessage
        alertLabel.isHidden = false
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            self.alertLabel.isHidden = true
        }
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
}
