//
//  PendingContractsTableViewController.swift
//  PlumberApp
//
//  Created by Vineet Baid on 14/02/18.
//  Copyright © 2018 Vineet Baid. All rights reserved.
//

import UIKit

class PendingContractsTableViewController: UITableViewController {
    //input the alamofire stuff here
    let cellID = "AlamoFireID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
     
        navigationItem.title = "Pending Work"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = """
        Dispatch ID = \(String(describing: GlobalJSONValues.jsonGlobal[indexPath.row]["Dispatch_ID"]))
        Customer Name = \(String(describing: GlobalJSONValues.jsonGlobal[indexPath.row]["fname"]))
        City = \(String(describing: GlobalJSONValues.jsonGlobal[indexPath.row]["city"]))
"""
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        return cell
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return GlobalJSONValues.jsonGlobal.count
    }


}
