//
//  MessageManager.swift
//  StaffManagement-Swift
//
//  Created by Mayara Felix on 2018-02-01.
//  Copyright © 2018 Mayara Felix. All rights reserved.
//

import Foundation
import UIKit

class MessageManager
{
    static func displaySimpleMessage(vc:UIViewController, title: String?, message: String?)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(confirmAction)
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func displayErrorMessage(vc:UIViewController, message: String?)
    {
        let title = "Error"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(confirmAction)
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func displaySimpleMessage(vc:UIViewController, message: String?, action: UIAlertAction)
    {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
}
