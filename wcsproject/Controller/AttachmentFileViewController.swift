//
//  AttachmentFileViewController.swift
//  wcsproject
//
//  Created by Muhammad Nobel on 15/02/19.
//  Copyright © 2019 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit
import WebKit

class AttachmentFileViewController: UIViewController {

 
    @IBOutlet weak var webView: WKWebView!
    
    var pdfURL : String = ""
    var backButton = UIBarButtonItem()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.title = "Back"
        
    self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        //let path = Bundle.main.url(forResource: pdfURL, withExtension: "pdf")
        let url = URL(string: "\(pdfURL)")
        
        let request = URLRequest(url: url!)
        
        webView.load(request)
        
        print("URL : \(pdfURL)")
   
    }
    
  

}


