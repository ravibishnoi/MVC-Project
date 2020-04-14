//
//  EmployeeDataModel.swift
//  Mvc Project
//
//  Created by AshutoshD on 09/04/20.
//  Copyright © 2020 ravindraB. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

//protocol EmployeeDataModelDelegate {
//    func didReceive(data: [EmployeeDataModelItem])
//    func didFail(_with error: Error)
//}
public class EmployeeDataModel : NSObject{
 
    
    static let shareInstance = EmployeeDataModel()
    
    func getAllEmployeeData(completion: @escaping([EmployeeDataModelItem]?, Error?)-> ()) {
        let urlString = "http://dummy.restapiexample.com/api/v1/employees"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url){ (data, respose, error) in
            if let err = error {
                completion(nil,err)
                print("Loading data error: \(err.localizedDescription)")
            }else{
                guard let data = data else{return}
                do {
                    var arrEmployee = [EmployeeDataModelItem]()
                    let results = try JSONDecoder().decode(dataModel.self, from: data)
                    for EmpData in results.data{
                        arrEmployee.append(EmployeeDataModelItem(id: EmpData.id!, employeeName: EmpData.employee_name!, employeeSalary: EmpData.employee_salary!, employeeAge: EmpData.employee_age!))
                    }
                    completion(arrEmployee,nil)
                    print(results)
                }catch let jsonErr{
                    print("json error \(jsonErr.localizedDescription)")
                }
            }
            
            }.resume()
    }
}
