//
//  ViewController+CoreData.swift
//  NanoChallenge4
//
//  Created by Douglas Cardoso Ferreira on 02/06/20.
//  Copyright © 2020 Denys Roger. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
    
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
}
