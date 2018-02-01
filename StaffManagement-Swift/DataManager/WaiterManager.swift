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
    // Add waiter
    public class func addWaiter(name: String) -> ReturnObject
    {
        if (!checkWaiter(name: name))
        {
            let newWaiter = Waiter(context: PersistenceService.context)
            newWaiter.name = name
            PersistenceService.saveContext()
            return ReturnObject(message: "Waiter saved successfully!", error: false)
        }
        else
        {
            return ReturnObject(message: "This Waiter already exists", error: true)
        }
    }
    
    // delete a waiter
    public class func delete(name: String) -> ReturnObject
    {
        let fetchRequest: NSFetchRequest<Waiter> = Waiter.fetchRequest()
        let predicate = NSPredicate(format: "self.name = %@", name)
        fetchRequest.predicate = predicate
        
        do
        {
            let result = try PersistenceService.context.fetch(fetchRequest)
            
            for waiter in result
            {
                // Delete Shifts
                let deleteShifts: ReturnObject = ShiftManager.deleteAll(waiter: waiter)
                
                // Delete Waiter
                if !deleteShifts.error
                {
                    PersistenceService.context.delete(waiter)
                    PersistenceService.saveContext()
                }
                else
                {
                    return ReturnObject(message: "Error removing waiter's shifts", error: true)
                }
            }
            
            return ReturnObject(message: "Waiter removed successfully!", error: false)
        }
        catch
        {
            return ReturnObject(message: "Error removing waiter.", error: true)
        }
    }
    
    // Check if the restaurant already exists on the database
    private class func checkWaiter(name: String) -> Bool
    {
        var exists = false;
        
        let fetchRequest: NSFetchRequest<Waiter> = Waiter.fetchRequest()
        let predicate = NSPredicate(format: "self.name = %@", name)
        fetchRequest.predicate = predicate
        
        do
        {
            let result = try PersistenceService.context.fetch(fetchRequest)
            exists = result.count == 0 ? false : true
        }
        catch
        {
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
