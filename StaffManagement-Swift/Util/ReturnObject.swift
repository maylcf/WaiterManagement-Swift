//
//  ReturnObject.swift
//  StaffManagement-Swift
//
//  Created by Mayara Felix on 2018-02-01.
//  Copyright © 2018 Mayara Felix. All rights reserved.
//

import Foundation

class ReturnObject
{
    var message: String
    var error: Bool
    
    init(message: String, error:Bool)
    {
        self.message = message
        self.error = error
    }
}
