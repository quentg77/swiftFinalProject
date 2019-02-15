//
//  ProfilView.swift
//  Final Project
//
//  Created by Quentin GUICHAOUA on 14/02/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import UIKit

protocol ProfilViewDelegate {
    func onChangePasswordPressed()
    func onLogoutPressed()
}

class ProfilView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var passwordTextBox: UITextField!
    @IBOutlet weak var confirmPasswordTextBox: UITextField!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    
    var delegate:ProfilViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ProfilView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    @IBAction func changePasswordPressed(_ sender: Any) {
        delegate?.onChangePasswordPressed()
    }
    @IBAction func logoutPressed(_ sender: Any) {
        delegate?.onLogoutPressed()
    }
}
