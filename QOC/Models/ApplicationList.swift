//
//  ApplicationList.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit

class ApplicationList {
    
    var apps: [[String:Any]] = []
    
    init(data:[String:Any]) {
        
        let feed = data["feed"] as! [String:Any]
        let entries = feed["entry"] as! [[String:Any]]
        for entry in entries {
            apps.append(entry)
        }
        
    }
    
}
