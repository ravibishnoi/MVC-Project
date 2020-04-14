//
//  EmployeeDataModelItem.swift
//  Mvc Project
//
//  Created by AshutoshD on 09/04/20.
//  Copyright © 2020 ravindraB. All rights reserved.
//

import Foundation
import UIKit


struct EmployeeDataModelItem : Decodable {
    var id : String?
    var employee_name : String?
    var employee_salary: String?
    var employee_age: String?
    
    init(id : String , employeeName : String ,  employeeSalary : String, employeeAge : String ) {
        self.id = id
        self.employee_name = employeeName
        self.employee_salary = employeeSalary
        self.employee_age = employeeAge
     
    }
}

struct dataModel : Decodable {
    
    var data = [EmployeeDataModelItem]()
    init(data:[EmployeeDataModelItem]) {
        self.data = data
    }
}
