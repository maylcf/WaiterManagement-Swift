//
//  Shift+CoreDataProperties.swift
//  StaffManagement-Swift
//
//  Created by Mayara Felix on 2018-02-01.
//  Copyright © 2018 Mayara Felix. All rights reserved.
//
//

import Foundation
import CoreData


extension Shift {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Shift> {
        return NSFetchRequest<Shift>(entityName: "Shift")
    }

    @NSManaged public var day: String?
    @NSManaged public var end_time: NSDate?
    @NSManaged public var start_time: NSDate?
    @NSManaged public var waiter: Waiter?
    
    public func getDescTime(date: NSDate?) -> String
    {
        guard let date = date as Date? else {
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let yourDate = formatter.string(from: date)
        return yourDate
    }
    
    public func getFullDateDescription() -> String
    {
        let start = self.getDescTime(date: start_time)
        let end = self.getDescTime(date: end_time)
        return "from \(start) to \(end)"
    }

}
