//
//  Application.swift
//  wcsproject
//
//  Created by Muhammad Nobel on 11/02/19.
//  Copyright © 2019 Muhammad Nobel Shidqi. All rights reserved.
//

import Foundation


class Application {
    
    var applicationTitle : String = ""
    var applicationStatus : String = ""
    var applicationDeadline : String = ""
    var applicationRequestDate : String = ""
    var attachmentFile : String = ""
    var attachmentTittle : String = ""
    var applicationDescription : String  = ""
    var applicationNote : String = ""
    
    init (title : String, requestDate : String, Deadline : String, status : String, attachment : String, fileTittle : String, description : String, note : String ){
        applicationTitle = title
        applicationRequestDate = requestDate
        applicationDeadline = Deadline
        applicationStatus = status
        attachmentFile = attachment
        attachmentTittle = fileTittle
        applicationDescription = description
        applicationNote = note
        
    }
    
    
}
