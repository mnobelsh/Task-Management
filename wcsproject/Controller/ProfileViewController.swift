//
//  ProfileViewController.swift
//  wcsproject
//
//  Created by Muhammad Nobel on 08/02/19.
//  Copyright © 2019 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit
import Firebase
import Photos

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var updateProfileButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileImageView: UIView!
    @IBOutlet weak var userEmail: UILabel!
    
    
    
    var displayName = Auth.auth().currentUser?.displayName
    var displayPicture = Auth.auth().currentUser?.photoURL
    var originalImage = UIImagePickerController()
    var imagePicker : UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        updateProfileButton.layer.cornerRadius = 15
        profileImage.layer.cornerRadius = 18
        profileImageView.layer.cornerRadius = 18
        userEmail.layer.cornerRadius = 8
        
        userEmail.text = Auth.auth().currentUser?.email
        
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.profileImageTapped))
        
        tapGesture.cancelsTouchesInView = false
        profileImageView.addGestureRecognizer(tapGesture)
        
    }
    

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info [.editedImage] as? UIImage {
            
            profileImage.image = pickedImage
          
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func profileImageTapped(){
       present(imagePicker, animated: true, completion: nil)
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
