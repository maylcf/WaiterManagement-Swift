//
//  Waiter+CoreDataProperties.swift
//  StaffManagement-Swift
//
//  Created by Mayara Felix on 2018-02-01.
//  Copyright © 2018 Mayara Felix. All rights reserved.
//
//

import Foundation
import CoreData


extension Waiter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Waiter> {
        return NSFetchRequest<Waiter>(entityName: "Waiter")
    }

    @NSManaged public var name: String?
    @NSManaged public var restaurant: Restaurant?
    @NSManaged public var shift: NSSet?

}

// MARK: Generated accessors for shift
extension Waiter {

    @objc(addShiftObject:)
    @NSManaged public func addToShift(_ value: Shift)

    @objc(removeShiftObject:)
    @NSManaged public func removeFromShift(_ value: Shift)

    @objc(addShift:)
    @NSManaged public func addToShift(_ values: NSSet)

    @objc(removeShift:)
    @NSManaged public func removeFromShift(_ values: NSSet)

}
