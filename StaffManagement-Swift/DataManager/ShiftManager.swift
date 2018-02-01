//
//  ShiftManager.swift
//  StaffManagement-Swift
//
//  Created by Mayara Felix on 2018-02-01.
//  Copyright © 2018 Mayara Felix. All rights reserved.
//

import Foundation
import CoreData

class ShiftManager
{
    // Add a new shift
    public class func add(waiter: Waiter, day: String, startTime: Date, endTime: Date)
    {
        let shift = Shift(context: PersistenceService.context)
        
        shift.day = day
        shift.start_time = startTime as NSDate
        shift.end_time = endTime as NSDate
        shift.waiter = waiter
        
        PersistenceService.saveContext()
    }
    
    // Select all shifts of a waiter
    public class func selectAll(waiter: Waiter) -> [Shift]?
    {
        let fetchRequest: NSFetchRequest<Shift> = Shift.fetchRequest()
        let predicate = NSPredicate(format: "self.waiter = %@", waiter)
        fetchRequest.predicate = predicate
        var results = [Shift]()
        
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
    
    // delete all shifts of a Waiter
    public class func deleteAll(waiter: Waiter) -> Bool
    {
        let fetchRequest: NSFetchRequest<Shift> = Shift.fetchRequest()
        let predicate = NSPredicate(format: "self.waiter = %@", waiter)
        fetchRequest.predicate = predicate
        
        // Delete Shifts
        do
        {
            let result = try PersistenceService.context.fetch(fetchRequest)
            
            for shift in result
            {
                PersistenceService.context.delete(shift)
                PersistenceService.saveContext()
            }
            
            return true
        }
        catch
        {
            return false
        }
    }
    
}
