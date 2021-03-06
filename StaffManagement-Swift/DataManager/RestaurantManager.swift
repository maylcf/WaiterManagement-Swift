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
    public class func addRestaurant(restaurantName: String) -> ReturnObject
    {
        if (!checkRestaurant(name: restaurantName))
        {
            let newRestaurant = Restaurant(context: PersistenceService.context)
            newRestaurant.name = restaurantName
            PersistenceService.saveContext()
            return ReturnObject(message: "Restaurant saved successfully!", error: false)
        }
        else
        {
            return ReturnObject(message: "Restaurant already exists", error: true)
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
    
    public static func getRestaurant() -> Restaurant?
    {
        if (self.count() == 0)
        {
            let actionResult = self.addRestaurant(restaurantName: "TouchBistro")
            
            if actionResult.error
            {
                return nil
            }
        }
        
        if let restaurants = self.selectAll()
        {
            return restaurants[0]
        }
        
        return nil
    }
}
