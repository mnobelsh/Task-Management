//
//  ApplicationHistoryBank.swift
//  wcsproject
//
//  Created by Muhammad Nobel on 11/02/19.
//  Copyright © 2019 Muhammad Nobel Shidqi. All rights reserved.
//

import Foundation

class ApplicationHistoryBank {
    
    var list = [Application]()
    
    init () {
        
        list.append(Application(title: "General Meeting Proposal", requestDate: "02-02-2018", Deadline: "17-02-2018",status: "Accepted", attachment: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf", fileTittle: "Sample File.pdf", description: "General Meeting Proposal Description...", note: "General meeting note..."))
        
        list.append(Application(title: "Software Upgrade Proposal", requestDate: "01-03-2018", Deadline: "12-03-2018", status: "Rejected", attachment: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf", fileTittle: "Sample File.pdf", description: "Software Upgrade Proposal Description...", note: "Software Updgrade note..."))
        
        list.append(Application(title: "Regular Maintenance", requestDate: "03-05-2018", Deadline: "07-05-2018", status: "Accepted", attachment: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf", fileTittle: "Sample File.pdf", description: "Regular Maintenance Description...", note: "regular maintenance note..."))
        
        list.append(Application(title: "Board Meeting Agenda", requestDate: "10-05-2018", Deadline: "12-05-2018", status: "Accepted", attachment: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf", fileTittle: "Sample File.pdf", description: "Board Meeting Agenda Description...", note: "board meeting agenda note..."))
        
    
        list.append(Application(title: "Annual Converence", requestDate: "03-05-2018", Deadline: "07-05-2018", status: "Delegate", attachment: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf", fileTittle: "Sample File.pdf", description: "Converence description...", note: "converence note..."))
        
        list.append(Application(title: "Server Migration", requestDate: "03-05-2018", Deadline: "07-05-2018", status: "Accepted", attachment: "https://azure.microsoft.com/mediahandler/files/resourcefiles/azure-migration-guide-for-windows-server/Azure_Migration_Guide_for_Windows_Server.pdf", fileTittle: "Server Migration Sample File", description: "Server Migration Descriptiom", note: "I've accept cost from server migration project."))
    }
    
    
    
    
    
}
