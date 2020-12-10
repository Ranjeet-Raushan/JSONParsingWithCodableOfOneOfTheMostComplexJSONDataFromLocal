//  ConnectedDotsVC.swift
//  JSONParsingWithCodableOfOneOfTheMostComplexJSONDataFromLocal
//  Created by Ranjeet Raushan on 12/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit
import  Foundation

class ConnectedDotsVC: UIViewController {
    @IBOutlet weak var connectionTableView: UITableView!
    var resultRes: Result?
   
    override func viewDidLoad() {
       
        super.viewDidLoad()
        navigationItem.title = "My Network"
        navigationController?.navigationBar.barTintColor = UIColor.blue
        guard let path = Bundle.main.path(forResource: "local",
                                          ofType: "json") else{ return }
         let url = URL(fileURLWithPath: path)
        do{
            let jsonData = try Data(contentsOf: url)
            self.resultRes = try JSONDecoder().decode(Result?.self, from: jsonData)
            print(self.resultRes!)
        }
        catch{
            print("Error:\(error)")
        }
    }
}

extension ConnectedDotsVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let inviteeProvider = resultRes?.data?.connections?[0].inviteeProvider
        return inviteeProvider?.offices?.count ?? 00
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let inviteeProvider = resultRes?.data?.connections?[0].inviteeProvider
        let modelArr = inviteeProvider?.offices?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionCell", for: indexPath) as! ConnectionCell
        cell.lbl_addresse.text = modelArr?.fullAddress
        cell.lbl_addresse.backgroundColor = UIColor.green
        
               return cell
        
    }
}



