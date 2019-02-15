//
//  User.swift
//  Final Project
//
//  Created by Quentin GUICHAOUA on 14/02/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import UIKit

class User {
    var email:String
    var password:String
    
    init(email:String, password:String) {
        self.email = email
        self.password = password
    }
    
    func setPassword(newPassword:String) {
        password = newPassword
    }
}
