//
//  ApplicationHistoryViewController.swift
//  wcsproject
//
//  Created by Muhammad Nobel on 11/02/19.
//  Copyright © 2019 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit

class ApplicationHistoryViewController: UIViewController {
    
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var tittleFill: UILabel!
    @IBOutlet weak var receiveDateFill: UILabel!
    @IBOutlet weak var submissionDeadlineFill: UILabel!
    @IBOutlet weak var taskStatus: UILabel!
    @IBOutlet weak var messageFill: UITextView!
    @IBOutlet weak var openPDFButton: UIButton!
    @IBOutlet weak var attachmentField: UILabel!
    
    
    var tittle : String = ""
    var deadline : String = ""
    var receiveDate : String = ""
    var status : String = ""
    var fileURL : String = ""
    var fileTittle : String = ""
    var url : String = ""
    var taskNote : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        openPDFButton.layer.cornerRadius = 7
        
        
        messageFill.isEditable = false
        tittleFill.text = " \(tittle)"
        receiveDateFill.text = " \(receiveDate)"
        submissionDeadlineFill.text = " \(deadline)"
        taskStatus.text = " \(status)"
        attachmentField.text = " \(fileTittle)"
        messageFill.text = " \(taskNote)"
        
        StatusBar()
    }
    

    func StatusBar(){

        if status == "Accepted" {

            taskStatus.textColor = UIColor(red:0.04, green:0.52, blue:0.34, alpha:1.0)

        }else if status == "Pending"{

            taskStatus.textColor = UIColor(red:0.98, green:0.78, blue:0.04, alpha:1.0)

        }else if status == "Rejected"{

            taskStatus.textColor = UIColor(red:0.51, green:0.07, blue:0.07, alpha:1.0)

        }
        
        
    }
    
 
    
    @IBAction func openPDFButton(_ sender: Any) {
       
            self.url = fileURL
            performSegue(withIdentifier: "showPDF", sender: self)
    
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showPDF"{
            let destination = segue.destination as! AttachmentFileViewController
            destination.pdfURL = url
        }
    }


}
