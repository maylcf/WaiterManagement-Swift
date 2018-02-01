//
//  WaiterManager.swift
//  StaffManagement-Swift
//
//  Created by Mayara Felix on 2018-02-01.
//  Copyright © 2018 Mayara Felix. All rights reserved.
//

import Foundation
import CoreData

class WaiterManager
{
    // Add a new restaurant
    public class func addWaiter(name: String) -> Bool
    {
        if (!checkWaiter(name: name))
        {
            let newWaiter = Waiter(context: PersistenceService.context)
            newWaiter.name = name
            PersistenceService.saveContext()
            return true
        }
        else
        {
            return false
        }
    }
    
    public class func delete(name: String) -> Bool
    {
        let fetchRequest: NSFetchRequest<Waiter> = Waiter.fetchRequest()
        let predicate = NSPredicate(format: "self.name = %@", name)
        fetchRequest.predicate = predicate
        
        do
        {
            let result = try PersistenceService.context.fetch(fetchRequest)
            
            for waiter in result
            {
                PersistenceService.context.delete(waiter)
                PersistenceService.saveContext()
            }
            
            return true
        }
        catch
        {
            return false
        }
    }
    
    // Check if the restaurant already exists on the database
    private class func checkWaiter(name: String) -> Bool
    {
        var exists = false;
        
        let fetchRequest: NSFetchRequest<Waiter> = Waiter.fetchRequest()
        let predicate = NSPredicate(format: "self.name = %@", name)
        fetchRequest.predicate = predicate
        
        do {
            let result = try PersistenceService.context.fetch(fetchRequest)
            exists = result.count == 0 ? false : true
        }
        catch {
            exists = false
        }
        
        return exists
    }
    
    // Select all waiters
    public class func selectAll() -> [Waiter]?
    {
        let fetchRequest: NSFetchRequest<Waiter> = Waiter.fetchRequest()
        var results = [Waiter]()
        
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
    
    // Get the number of waiters
    public class func count() -> Int
    {
        let fetchRequest: NSFetchRequest<Waiter> = Waiter.fetchRequest()
        var results = [Waiter]()
        
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
