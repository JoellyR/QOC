//
//  Constants.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit

class Constants: NSObject {
    struct URLs {
        static let kAppListURL = "http://phobos.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=100/json"
    }
    
    struct SegueIdentifiers {
        static let kAppDetailsViewController = "AppDetailsController"
    }
    
    struct CellIdentifiers {
        static let kAppItemCellIdentifier = "AppItemCell"
    }
    
    struct LabelText {
        static let kRefreshLabel = "Pull to refresh."
        static let kMainNavTitle = "QoC App Buddy"
    }
    
    
    
}
