//
//  TableViewController.swift
//  APIApp
//
//  Created by Vu Duy on 13/07/2021.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    //TableView func
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        cell.textLabel?.text = "I'm a label"
        cell.detailTextLabel?.text = "You looking at the detail"
        return cell
    }



}
