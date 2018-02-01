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
    public class func add(waiter: Waiter, day: String, startTime: Date, endTime: Date) -> ReturnObject
    {
        let shift = Shift(context: PersistenceService.context)
        
        shift.day = day
        shift.start_time = startTime as NSDate
        shift.end_time = endTime as NSDate
        shift.waiter = waiter
        
        PersistenceService.saveContext()
        
        return ReturnObject(message: "Shift included successfully!", error: false)
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
    public class func deleteAll(waiter: Waiter) -> ReturnObject
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
            
            return ReturnObject(message: "Waiter removed successfully!", error: false)
        }
        catch
        {
            return ReturnObject(message: "Error removing shift.", error: true)
        }
    }
    
    // delete shift
    public class func delete(waiter: Waiter, shift: Shift) -> ReturnObject
    {
        let fetchRequest: NSFetchRequest<Shift> = Shift.fetchRequest()
        //let predicate = NSPredicate(format: "self.waiter = %@ AND self.day = %@", waiter, shift.day)
        
        let p1 = NSPredicate(format: "self.waiter = %@", waiter)
        let p2 = NSPredicate(format: "self.day = %@", shift.day!)
        let p3 = NSPredicate(format: "self.start_time = %@", shift.start_time!)
        let p4 = NSPredicate(format: "self.end_time = %@", shift.end_time!)
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [p1, p2, p3, p4])
        
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
            
            return ReturnObject(message: "Shift removed successfully!", error: false)
        }
        catch
        {
            return ReturnObject(message: "Error removing shift.", error: true)
        }
    }
    
}
