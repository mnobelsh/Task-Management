//
//  LoginViewController.swift
//  wcsproject
//
//  Created by Muhammad Nobel on 06/02/19.
//  Copyright © 2019 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD



class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginMessage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func viewTapped(){
        view.endEditing(true)
        
    }
    
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
    
        SVProgressHUD.show()
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
                
            if error != nil {
                
                if self.emailTextField.text == "" && self.passwordTextField.text == ""{
                    self.loginMessage.text = "Please enter your email and password."
                    
                    
                }else if let errorMessage = AuthErrorCode(rawValue: (error?._code)!){
                    
                    switch errorMessage {
                        
                    case .wrongPassword :
                        self.loginMessage.text = "Incorrect email or password."
                        break
                        
                    case .userNotFound :
                        self.loginMessage.text = "No Existing User."
                        break
                        
                    case .invalidEmail :
                        self.loginMessage.text = "Incorrect email or password."
                        break
                        
                        
                    default :
                        self.loginMessage.text = "Unable to login."
                        break
                        
                    }
                }
                
                
            }else {
                print("Log in successful!")
                self.performSegue(withIdentifier: "goToHomePage", sender: self)
                
            
            }
            
             SVProgressHUD.dismiss()
        }
    
    }
    
        
    
}

