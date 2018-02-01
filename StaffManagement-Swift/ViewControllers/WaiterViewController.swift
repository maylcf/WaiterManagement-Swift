//
//  WaiterViewController.swift
//  StaffManagement-Swift
//
//  Created by Mayara Felix on 2018-01-30.
//  Copyright © 2018 Mayara Felix. All rights reserved.
//

import UIKit
import CoreData

class WaiterViewController: UITableViewController {

    var restaurant = Restaurant()
    var waiters = [Waiter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check Restaurant
        if (RestaurantManager.count() == 0)
        {
            RestaurantManager.addRestaurant(restaurantName: "Mays's Burguer")
        }
        
        if let restaurants = RestaurantManager.selectAll()
        {
            restaurant = restaurants[0]
        }
        
        print("Restaurant Name: \(restaurant.name!)")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "NewWaiterSegue"
        {
            let vc = segue.destination as! AddWaiterViewController
            vc.restaurant = self.restaurant
        }
    }
    
    func updateTable()
    {
        var result = WaiterManager.selectAll()
        
        if let allWaiters = result, result?.count > 0
        {
            self.waiters = allWaiters
            self.tableView.reloadData()
        }
    }

}
