//
//  ActionDetailViewController.swift
//  wcsproject
//
//  Created by Muhammad Nobel on 12/02/19.
//  Copyright © 2019 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit
import SVProgressHUD

class ActionDetailViewController: UIViewController {


    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        confirmButton.layer.cornerRadius  = 10
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    
    @objc func viewTapped(){
        view.endEditing(true)
        print("tapped")
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 77
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func confirmButtonPressed(_ sender: Any) {
        
        ConfirmationAlert()
        
        let vc = navigationController?.viewControllers[1]
        navigationController?.popToViewController(vc!, animated: true)
    }
    
    func ConfirmationAlert () {
        
        let alert = UIAlertController(title: "Are you sure ?", message: "You will not be able to modify action.", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (UIAlertAction) in
            
            let vc = self.navigationController?.viewControllers[1]
            
            self.navigationController?.popToViewController(vc!, animated: true)
            
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
        
        
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
