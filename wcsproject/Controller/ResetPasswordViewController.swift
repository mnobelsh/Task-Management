//
//  ProfileUpdateViewController.swift
//  wcsproject
//
//  Created by Muhammad Nobel on 11/02/19.
//  Copyright © 2019 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class ResetPasswordViewController: UIViewController {
    
    

    @IBOutlet weak var oldPasswordField: UITextField!
    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var confirmNewPasswordField: UITextField!
    @IBOutlet weak var resetPasswordButton: UIButton!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        resetPasswordButton.layer.cornerRadius = 10
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    
        
    }
    
    @objc func viewTapped(){
        view.endEditing(true)

    }

    
 
    @IBAction func resetPasswordButtonPressed(_ sender: Any) {
        SVProgressHUD.show()
        
        Auth.auth().currentUser?.updatePassword(to: "\(confirmNewPasswordField.text!)", completion: { (error) in
            
            if error != nil {
                
                print("ERROR!")
                SVProgressHUD.showError(withStatus: "Unable to reset password.")
            }else {
                
                print("SUCCESS!")
                print("\(String(describing: self.confirmNewPasswordField.text))")
                SVProgressHUD.showSuccess(withStatus: "Success reset password.")
            }
            
        })
        

    }
    
    func SuccessResetPasswordAlert() {
        
        let successAlert = UIAlertController(title: "Success", message: "Success reset password", preferredStyle: .alert)
        let successAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        successAlert.addAction(successAlertAction)
        present(successAlert, animated:  true, completion: nil)
    }
    
    func ErrorResetPassword () {
        let errorAlert = UIAlertController(title: "Error", message: "Unable to reset password.", preferredStyle: .alert)
        let errorAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        errorAlert.addAction(errorAlertAction)
        present(errorAlert, animated: true, completion: nil)
        
        
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 50
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
