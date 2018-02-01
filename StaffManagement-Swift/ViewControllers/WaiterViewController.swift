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

    var restaurant: Restaurant?
    var waiters = [Waiter]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.addRestaurant() // If no restaurant, add one
        
        if let restaurant = self.restaurant
        {
            self.title = restaurant.name
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        self.updateTable()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return waiters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if waiters.count > 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WaiterCell", for: indexPath)
            let waiter = waiters[indexPath.row]
            cell.textLabel?.text = waiter.name
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == UITableViewCellEditingStyle.delete)
        {
            if waiters.count > 0
            {
                let waiter = waiters[indexPath.row]
                WaiterManager.delete(name: waiter.name!)
                self.updateTable()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "NewWaiterSegue"
        {
            let vc = segue.destination as! AddWaiterViewController
            vc.restaurant = self.restaurant
        }
        else if segue.identifier == "ShiftSegue"
        {
            let vc = segue.destination as! ShiftViewController
            
            if let selectedIndex = self.tableView.indexPathForSelectedRow?.row
            {
                vc.waiter = waiters[selectedIndex]
            }
        }
    }
    
    func updateTable()
    {
        let result = WaiterManager.selectAll()
        
        if let allWaiters = result
        {
            if allWaiters.count > 0
            {
                self.waiters = allWaiters
                self.tableView.reloadData()
            }
        }
    }
    
    func addRestaurant()
    {
        if (RestaurantManager.count() == 0)
        {
            RestaurantManager.addRestaurant(restaurantName: "Mays's Burguer")
        }
        
        if let restaurants = RestaurantManager.selectAll()
        {
            restaurant = restaurants[0]
        }
    }

}
