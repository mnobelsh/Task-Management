//
//  PendingApplicationDetailViewController.swift
//  wcsproject
//
//  Created by Muhammad Nobel on 11/02/19.
//  Copyright © 2019 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit
import PDFKit

class PendingApplicationDetailViewController: UIViewController {

    
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var activityButton: UIButton!
    @IBOutlet weak var taskTittleField: UILabel!
    @IBOutlet weak var receiveDateField: UILabel!
    @IBOutlet weak var submissionField: UILabel!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var attachmentField: UILabel!
    @IBOutlet weak var openPDFButton: UIButton!
    
    
    
    var tittle : String = ""
    var receiveDate : String = ""
    var deadline : String = ""
    var fileURL : String = ""
    var fileTittle : String = ""
    var url : String = ""
    var taskDescription : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        descriptionField.isEditable = false
        activityButton.layer.cornerRadius = 10
        openPDFButton.layer.cornerRadius = 7

        taskTittleField.text = " \(tittle)"
        receiveDateField.text = " \(receiveDate)"
        submissionField.text = " \(deadline)"
        attachmentField.text = " \(fileTittle)"
        descriptionField.text = " \(taskDescription)"
        
        print("FILE TITTLE : \(fileTittle)")
        
        
    }
    
    
    @IBAction func openPDF(_ sender: Any) {
        self.url = fileURL
        performSegue(withIdentifier: "showPDF", sender: self)
    }
    
    
    @IBAction func activityButtonPressed(_ sender: Any) {
        ShowActionSheet()
    }
    
    
    
    func ShowActionSheet() {
        
        let actionSheet = UIAlertController(title: "Task Action", message: "In order to complete the task you have to choose one of the button below or cancel action.", preferredStyle: .actionSheet)
        
        let accept  = UIAlertAction(title: "Accept", style: .default) { (UIAlertAction) in
            print ("accepted")
            self.performSegue(withIdentifier: "goToActionDetailVC", sender: self)
        }
        
        let reject = UIAlertAction(title: "Reject", style: .default) { (UIAlertAction) in
            print("Reject")
            self.performSegue(withIdentifier: "goToActionDetailVC", sender: self)
        }
        
        let delegate = UIAlertAction(title: "Delegate", style: .default) { (UIAlertAction) in
            print("Delegate")
            self.performSegue(withIdentifier: "goToActionDetailVC", sender: self)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        
        actionSheet.addAction(accept)
        actionSheet.addAction(delegate)
        actionSheet.addAction(reject)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true, completion: nil)
        
        
    }
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showPDF"{
        let destination = segue.destination as! AttachmentFileViewController
        destination.pdfURL = url
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

