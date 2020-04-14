//
//  ViewController.swift
//  Mvc Project
//
//  Created by AshutoshD on 09/04/20.
//  Copyright © 2020 ravindraB. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    private var employeeData = [EmployeeDataModelItem]()
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        getData()
        self.tblView.dataSource = self
    }

    func getData(){
        EmployeeDataModel.shareInstance.getAllEmployeeData { (arrData, error) in
            if(error==nil){
                self.employeeData = arrData ?? []
                print("employeeData \(self.employeeData)")
                DispatchQueue.main.sync {
                    self.tblView.reloadData()
                }
            }
        }
    }
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
       
        cell?.textLabel?.text = employeeData[indexPath.row].employee_age
        cell?.detailTextLabel?.text = employeeData[indexPath.row].employee_name
        return cell!
    }
}
