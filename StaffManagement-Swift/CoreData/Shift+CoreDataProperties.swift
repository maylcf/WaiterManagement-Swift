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

}
