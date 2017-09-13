//
//  LoginViewController.swift
//  BatLogin
//
//  Created by Alan Casas on 12/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var batLoginImg: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    var headerAnimator: UIViewPropertyAnimator!
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgLogo.transform = CGAffineTransform(translationX: 0.0, y: -120.0)
        batLoginImg.transform = CGAffineTransform(translationX: 0.0, y: -170.0)
        userLabel.transform = CGAffineTransform(translationX: -200.0, y: 0.0)
        passwordLabel.transform = CGAffineTransform(translationX: -200.0, y: 0.0)
        userTextField.transform = CGAffineTransform(translationX: 350.0, y: 0.0)
        passwordTextField.transform = CGAffineTransform(translationX: 350.0, y: 0.0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureViews()
        self.buildAnimations()
    }
    
    func configureViews(){
        userTextField.layer.cornerRadius = 3.0
        passwordTextField.layer.cornerRadius = 3.0
        enterButton.layer.cornerRadius = 3
    }

    func buildAnimations(){
        headerAnimator = UIViewPropertyAnimator(duration: 0.8, curve: .easeInOut, animations: nil)
        headerAnimator.addAnimations {
            self.imgLogo.transform = CGAffineTransform.identity
            self.batLoginImg.transform = CGAffineTransform.identity
            self.userLabel.transform = CGAffineTransform.identity
            self.passwordLabel.transform = CGAffineTransform.identity
            self.userTextField.transform = CGAffineTransform.identity
            self.passwordTextField.transform = CGAffineTransform.identity
        }
        headerAnimator.startAnimation()
    }
    
}


































