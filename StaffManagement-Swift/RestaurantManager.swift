//
//  RestaurantManager.swift
//  StaffManagement-Swift
//
//  Created by Mayara Felix on 2018-02-01.
//  Copyright © 2018 Mayara Felix. All rights reserved.
//

import Foundation
import CoreData

class RestaurantManager
{
    // Add a new restaurant
    public class func addRestaurant(restaurantName: String) -> Bool
    {
        if (!checkRestaurant(name: restaurantName))
        {
            let newRestaurant = Restaurant(context: PersistenceService.context)
            newRestaurant.name = restaurantName
            PersistenceService.saveContext()
            return true
        }
        else
        {
            return false
        }
    }
    
    // Check if the restaurant already exists on the database
    private class func checkRestaurant(name: String) -> Bool
    {
        var exists = false;
        
        let fetchRequest: NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
        let predicate = NSPredicate(format: "self.name = %@", name)
        fetchRequest.predicate = predicate
        
        do {
            let restaurant = try PersistenceService.context.fetch(fetchRequest)
            exists = restaurant.count == 0 ? false : true
        }
        catch {
            exists = false
        }
        
        return exists
    }
    
    // Select all Restaurants
    public class func selectAll() -> [Restaurant]?
    {
        let fetchRequest: NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
        var results = [Restaurant]()
        
        do
        {
            results = try PersistenceService.context.fetch(fetchRequest)
        }
        catch
        {
            return nil
        }
        
        return results
    }
    
    // Get the number of restaurants
    public class func count() -> Int
    {
        let fetchRequest: NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
        var results = [Restaurant]()
        
        do
        {
            results = try PersistenceService.context.fetch(fetchRequest)
            return results.count
        }
        catch
        {
            return 0
        }
    }
}
