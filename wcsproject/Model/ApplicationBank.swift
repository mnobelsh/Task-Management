//
//  ApplicationBank.swift
//  wcsproject
//
//  Created by Muhammad Nobel on 11/02/19.
//  Copyright © 2019 Muhammad Nobel Shidqi. All rights reserved.
//

import Foundation

class ApplicationBank {
    
    var list = [Application]()
    
    init () {
        
        list.append(Application(title: "Annual Budget", requestDate: "12-11-2018", Deadline: "28-12-2018",status: "", attachment: "https://www.consilium.europa.eu/media/37011/proposal-on-the-architecture-of-a-eurozone-budget.pdf", fileTittle: "Budget Proposal", description: "Please approve budget proposal.", note: "" ))
        list.append(Application(title: "Network Maintenance", requestDate: "01-12-2018", Deadline: "07-12-2018",status: "", attachment: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf", fileTittle: "Sample File.pdf", description: "Network Maintenance Description", note: ""))
        list.append(Application(title: "Company Project", requestDate: "08-12-2018", Deadline: "11-12-2018",status: "", attachment: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf", fileTittle: "Sample File.pdf", description: "Company Project Description", note: ""))
        
    }

    
}
