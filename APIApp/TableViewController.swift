//
//  TableViewController.swift
//  APIApp
//
//  Created by Vu Duy on 13/07/2021.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView:UITableView!
    let spinner = UIActivityIndicatorView(style: .medium)
    
    // dataSOurce
    var data:[ApiResult] = []
    
    // variable for pagination
    let limit: Int = 25
    var currentIndex = 0        // Index of the finnal object getting from API
    
    // State when loading data
    var noMoreData: Bool = false
    var loadingData: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        //Set up loading indicator
        spinner.frame = CGRect(x: 0.0, y: 0.0, width: tableView.bounds.width, height: 70)
        tableView.tableFooterView = spinner
        tableView.tableFooterView?.isHidden = false
        spinner.startAnimating()
        
        loadDataUsingAPI()
    }

    
    //TableView func
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if !data.isEmpty{
            cell.textLabel?.text = "\(data[indexPath.row].source_article!)"
            cell.detailTextLabel?.text = "\(data[indexPath.row].country!) (\(data[indexPath.row].latitude!), \(data[indexPath.row].longitude!))"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let latitude = Float(data[indexPath.row].latitude!)
        let longitude = Float(data[indexPath.row].longitude!)
        if latitude != nil && longitude != nil{
            Coordinate.shareInstance.selectedCoordinate = (latitude!, longitude!, true)
        }
        tabBarController?.selectedIndex = 1
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = data.count - 1
        
        // reaching last element, data is not currently loading
        if !loadingData && indexPath.row == lastElement && !noMoreData{
            loadingData = true
            // run loading indicator
            spinner.startAnimating()
            tableView.tableHeaderView?.isHidden = false
            loadDataUsingAPI()
        }
    }
    
    func loadDataUsingAPI(){
        APIHelper.getData(limit: limit, offset: currentIndex, completion: { [self] result in
            // loading the last object from API
            if(result.count < limit){
                noMoreData = true
                currentIndex += result.count
            }else{
                currentIndex += limit
            }
            
            data.append(contentsOf: result)
            // Update
            if Coordinate.shareInstance.lastIndex < currentIndex{
                transferData(startIndex: Coordinate.shareInstance.lastIndex)
            }
            tableView.reloadData()
            loadingData = false
            
            //Change spinner state
            tableView.tableFooterView?.isHidden = true
            spinner.stopAnimating()
        })
    }
    
    
    func transferData(startIndex: Int){
        var dataToTransfer:[(latitude: Float, longitude: Float)] = []
        
        //Create a new array of missing object
        for index in startIndex...data.count - 1{
            let latitude = Float(data[index].latitude!)
            let longitude = Float(data[index].longitude!)
            
            if latitude != nil && longitude != nil{
                dataToTransfer.append((latitude!, longitude!))
            }
        }
        
        // Merge array and update
        Coordinate.shareInstance.cordinates.append(contentsOf: dataToTransfer)
        Coordinate.shareInstance.lastIndex = currentIndex
    }
}


