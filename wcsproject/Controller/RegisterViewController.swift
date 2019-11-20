//
//  RegisterViewController.swift
//  wcsproject
//
//  Created by Muhammad Nobel on 06/02/19.
//  Copyright © 2019 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD


class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var alertMessage: UILabel!
    
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
  
    
    @IBAction func registerPressed(_ sender: AnyObject) {
    
    
        SVProgressHUD.show()
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: confirmPasswordTextField.text!) { (user, error) in
            
            
            
            
            if error != nil{
                
                if self.passwordTextField.text != self.confirmPasswordTextField.text{
                     self.alertMessage.text = "Incorrect password"
                    
                }else if let errorMessage = AuthErrorCode(rawValue: (error?._code)!){
                    
                    switch errorMessage {
                        
                    case .emailAlreadyInUse :
                        self.alertMessage.text = "Email Already Taken."
                        break
                        
                    case .weakPassword :
                        self.alertMessage.text = "Password must contain 8 characters."
                        break
                        
                    case .invalidEmail :
                        self.alertMessage.text = "Invalid Email Address."
                        break
                        
                    default :
                        self.alertMessage.text = "Unable to register, please check the email and password field."
                        break
                    }
            
                }
            
            }else{
                
                print("Register Successful.")
                self.performSegue(withIdentifier: "goToLoginVC", sender: self)
                
            }
            
            SVProgressHUD.dismiss()
            
        }
    
    }
    
        
    
    
    
}

