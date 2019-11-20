//
//  PieChartViewController.swift
//  wcsproject
//
//  Created by Muhammad Nobel on 14/02/19.
//  Copyright © 2019 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit
import Charts
import Firebase

class PieChartViewController: UIViewController {

    @IBOutlet weak var chartContainer: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var pieChartContainer: UIView!
    @IBOutlet weak var taskChart: PieChartView!
    
    @IBOutlet weak var completedTaskField: UILabel!
    @IBOutlet weak var pendingTaskField: UILabel!
    
    
    var allPendingTask = ApplicationBank()
    var allTaskHistory = ApplicationHistoryBank()
    
    
    var pendingTaskDataEntry = PieChartDataEntry(value: 0)
    var taskHistoryDataEntry = PieChartDataEntry(value: 0)
    var numberOfDonwloadDataEntry = [PieChartDataEntry]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        descriptionView.layer.cornerRadius = 15
        pieChartContainer.layer.cornerRadius = 15
        
        pendingTaskDataEntry.value = Double(allPendingTask.list.count)
        pendingTaskDataEntry.label = "Pending Task"
        
        
        taskHistoryDataEntry.value = Double(allTaskHistory.list.count)
        taskHistoryDataEntry.label = "Completed Task"
     
        numberOfDonwloadDataEntry = [pendingTaskDataEntry, taskHistoryDataEntry]
        
        updateChartData()
        
        completedTaskField.text = "\(allTaskHistory.list.count)  Completed Task"
        pendingTaskField.text = "\(allPendingTask.list.count)  Pending Task"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))

        tapGesture.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func viewTapped() {
        dismiss(animated: true, completion: nil)
      
    }
    
    func updateChartData() {
        
        let chartDataSet = PieChartDataSet(values: numberOfDonwloadDataEntry, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let chartColor = [UIColor(red:1.00, green:0.64, blue:0.36, alpha:1.0),UIColor(red:0.45, green:0.71, blue:0.61, alpha:1.0)]
        chartDataSet.colors = chartColor
        
        chartData.setValueTextColor(UIColor.clear)
        
        taskChart.data = chartData

        
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
