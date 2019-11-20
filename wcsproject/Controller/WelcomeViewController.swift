//
//  WelcomeViewController.swift
//  wcsproject
//
//  Created by Muhammad Nobel on 06/02/19.
//  Copyright © 2019 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit
import Firebase


class WelcomeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.24, green:0.25, blue:0.37, alpha:1.0)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        if Auth.auth().currentUser != nil {
            
            self.performSegue(withIdentifier: "goToHomePage", sender: self)
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        self.performSegue(withIdentifier: "goToLoginVC", sender: self)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "goToRegisterVC", sender: self)
    }
    
}
