//
//  HomeViewController.swift
//  wcsproject
//
//  Created by Muhammad Nobel on 06/02/19.
//  Copyright © 2019 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit
import Firebase
import Charts
import SVProgressHUD

class HomeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var pendingApplicationTable: UITableView!
    @IBOutlet weak var applicationHistoryTable: UITableView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var taskChart: PieChartView!
    @IBOutlet weak var taskHistoryTittle: UILabel!
    @IBOutlet weak var pendingTaskTittle: UILabel!
    @IBOutlet weak var chartContainer: UIView!
    
    
    
    var allPendingApplication = ApplicationBank()
    var allApplicationHistory = ApplicationHistoryBank()
    
    var pendingApplicationTittle : String = ""
    var pendingApplicationReceive : String = ""
    var pendingApplicationDeadline : String = ""
    var pendingApplicationFileURL : String = ""
    var pendingApplicationFileTittle : String = ""
    var pendingApplicationTaskDescription : String = ""
    
    var applicationHistoryTittle : String = ""
    var applicationHistoryReceive : String = ""
    var applicationHisttoryDeadline : String = ""
    var applicationHistoryStatus : String = ""
    var applicationHistoryFileURL : String = ""
    var applicationHistoryFileTittle : String = ""
    var applicationHistoryTaskNote : String = ""
    
    
    var pendingTaskDataEntry = PieChartDataEntry(value: 0)
    var taskHistoryDataEntry = PieChartDataEntry(value: 0)
    var numberOfDonwloadDataEntry = [PieChartDataEntry]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        
        navigationItem.leftBarButtonItem = backButton 
        
        profileButton.layer.cornerRadius = 10
        taskHistoryTittle.layer.cornerRadius = 7
        pendingTaskTittle.layer.cornerRadius = 7
        pendingApplicationTable.layer.cornerRadius = 7
        applicationHistoryTable.layer.cornerRadius = 7
        chartContainer.layer.cornerRadius = 7
        
        pendingApplicationTable.delegate = self
        pendingApplicationTable.dataSource = self
        applicationHistoryTable.delegate = self
        applicationHistoryTable.dataSource = self
        
        
        
        pendingTaskDataEntry.value = Double(allPendingApplication.list.count)
        pendingTaskDataEntry.label = "\(Int(pendingTaskDataEntry.value)) Pending Task"
        
        
        taskHistoryDataEntry.value = Double(allApplicationHistory.list.count)
        taskHistoryDataEntry.label = "\(Int(taskHistoryDataEntry.value)) Completed Task"
        
        numberOfDonwloadDataEntry = [pendingTaskDataEntry, taskHistoryDataEntry]
        
        
        updateChartData()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.ChartViewTapped))
        
        taskChart.addGestureRecognizer(tapGesture)
  
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    @objc func ChartViewTapped(){
        self.performSegue(withIdentifier: "showPieChart", sender: self)
    }
    
    
    func updateChartData() {
        
        let chartDataSet = PieChartDataSet(values: numberOfDonwloadDataEntry, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let chartColor = [UIColor(red:1.00, green:0.64, blue:0.36, alpha:1.0),UIColor(red:0.45, green:0.71, blue:0.61, alpha:1.0)]
        chartDataSet.colors = chartColor
        
        chartData.setValueTextColor(UIColor.clear)
        
        taskChart.data = chartData
      
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
            return allPendingApplication.list.count
        }else{
            return allApplicationHistory.list.count
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell1 = tableView.dequeueReusableCell(withIdentifier: "pendingApplicationTable")
        var cell2 = tableView.dequeueReusableCell(withIdentifier: "applicationHistoryTable")
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultTable")
        
            if tableView.tag == 1 {
                if cell1 == nil {
                cell1 = UITableViewCell(style: .subtitle, reuseIdentifier: "pendingApplicationTable")
                
            }
                cell1?.textLabel?.text = allPendingApplication.list[indexPath.row].applicationTitle
                cell1?.detailTextLabel?.text = allPendingApplication.list[indexPath.row].applicationDeadline
            
                return cell1!
            }else if tableView.tag == 2 {
                if cell2 == nil {
                    cell2 = UITableViewCell(style: .subtitle, reuseIdentifier: "applicationHistoryTable")
                    
                }
                
                cell2?.textLabel?.text = allApplicationHistory.list[indexPath.row].applicationTitle
                cell2?.detailTextLabel?.text = allApplicationHistory.list[indexPath.row].applicationStatus
                
                if allApplicationHistory.list[indexPath.row].applicationStatus == "Accepted" {
                    cell2?.detailTextLabel?.textColor = UIColor(red:0.04, green:0.52, blue:0.34, alpha:1.0)
                }else if allApplicationHistory.list[indexPath.row].applicationStatus == "Rejected" {
                    cell2?.detailTextLabel?.textColor = UIColor(red:0.51, green:0.07, blue:0.07, alpha:1.0)
                }else if allApplicationHistory.list[indexPath.row].applicationStatus == "Delegate" {
                    cell2?.detailTextLabel?.textColor = UIColor(red:0.98, green:0.78, blue:0.04, alpha:1.0)
                }else{
                    cell2?.detailTextLabel?.textColor = UIColor.gray
                }
                
                
                return cell2!
            }
        
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        if tableView.tag == 1 {
            self.pendingApplicationTittle = allPendingApplication.list[indexPath.row].applicationTitle
            self.pendingApplicationReceive = allPendingApplication.list[indexPath.row].applicationRequestDate
            self.pendingApplicationDeadline = allPendingApplication.list[indexPath.row].applicationDeadline
            self.pendingApplicationFileURL = allPendingApplication.list[indexPath.row].attachmentFile
            self.pendingApplicationFileTittle = allPendingApplication.list[indexPath.row].attachmentTittle
            self.pendingApplicationTaskDescription = allPendingApplication.list[indexPath.row].applicationDescription
        
            performSegue(withIdentifier: "goToPendingApplicationDetail", sender: self)
            
        }else if tableView.tag == 2{
            
            
            self.applicationHistoryTittle = allApplicationHistory.list[indexPath.row].applicationTitle
            self.applicationHisttoryDeadline = allApplicationHistory.list[indexPath.row].applicationDeadline
            self.applicationHistoryReceive = allApplicationHistory.list[indexPath.row].applicationRequestDate
            self.applicationHistoryStatus = allApplicationHistory.list[indexPath.row].applicationStatus
            self.applicationHistoryFileURL = allApplicationHistory.list[indexPath.row].attachmentFile
            self.applicationHistoryFileTittle = allApplicationHistory.list[indexPath.row].attachmentTittle
            self.applicationHistoryTaskNote = allApplicationHistory.list[indexPath.row].applicationNote
            
            performSegue(withIdentifier: "goToApplicationHistoryViewController", sender: self)
            
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPendingApplicationDetail"{
            
        let pendingVC = segue.destination as! PendingApplicationDetailViewController
        pendingVC.tittle = pendingApplicationTittle
        pendingVC.receiveDate = pendingApplicationReceive
        pendingVC.deadline = pendingApplicationDeadline
        pendingVC.fileURL = pendingApplicationFileURL
        pendingVC.fileTittle = pendingApplicationFileTittle
        pendingVC.taskDescription = pendingApplicationTaskDescription
            
        }else if segue.identifier == "goToApplicationHistoryViewController" {
            
            let applicationHistoryVC = segue.destination as! ApplicationHistoryViewController
            
            applicationHistoryVC.tittle = applicationHistoryTittle
            applicationHistoryVC.receiveDate = applicationHistoryReceive
            applicationHistoryVC.deadline = applicationHisttoryDeadline
            applicationHistoryVC.status = applicationHistoryStatus
            applicationHistoryVC.fileURL = applicationHistoryFileURL
            applicationHistoryVC.fileTittle = applicationHistoryFileTittle
            applicationHistoryVC.taskNote = applicationHistoryTaskNote
          
            
        }
    }
    
    
    @IBAction func logoutButtonPressed(_ sender: AnyObject) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        }catch{
            print("Error Signout.")
            
        }
        
    
        
    }
    

    @IBAction func profileButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "goToProfilePage", sender: self)
        
    }
    

    
    
}
