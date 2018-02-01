//
//  Restaurant+CoreDataProperties.swift
//  StaffManagement-Swift
//
//  Created by Mayara Felix on 2018-02-01.
//  Copyright © 2018 Mayara Felix. All rights reserved.
//
//

import Foundation
import CoreData


extension Restaurant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Restaurant> {
        return NSFetchRequest<Restaurant>(entityName: "Restaurant")
    }

    @NSManaged public var name: String?
    @NSManaged public var waiter: NSSet?

}

// MARK: Generated accessors for waiter
extension Restaurant {

    @objc(addWaiterObject:)
    @NSManaged public func addToWaiter(_ value: Waiter)

    @objc(removeWaiterObject:)
    @NSManaged public func removeFromWaiter(_ value: Waiter)

    @objc(addWaiter:)
    @NSManaged public func addToWaiter(_ values: NSSet)

    @objc(removeWaiter:)
    @NSManaged public func removeFromWaiter(_ values: NSSet)

}
