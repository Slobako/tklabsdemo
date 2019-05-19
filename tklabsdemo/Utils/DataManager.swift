//
//  DataManager.swift
//  tklabsdemo
//
//  Created by Slobodan Kovrlija on 5/19/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import Foundation
import UIKit

class DataManager {
    
    static let shared = DataManager()
    
    func populateCategories() -> [Category] {
        
        let personal = Category(icon: UIImage(named: "personal")!,
                                name: CategoryName.personal.rawValue,
                                numberOfTasks: 12)
        let shopping = Category(icon: UIImage(named: "shopping")!,
                                name: CategoryName.shopping.rawValue,
                                numberOfTasks: 9)
        let sport = Category(icon: UIImage(named: "sport")!,
                             name: CategoryName.sport.rawValue,
                             numberOfTasks: 10)
        let event = Category(icon: UIImage(named: "event")!,
                             name: CategoryName.event.rawValue,
                             numberOfTasks: 10)
        let work = Category(icon: UIImage(named: "work")!,
                            name: CategoryName.work.rawValue,
                            numberOfTasks: 25)
        
        return [personal, shopping, sport, event, work]
    }
}
