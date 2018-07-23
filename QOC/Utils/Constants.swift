//
//  Constants.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit

//Class containing constants used throughout the project.
class Constants {
    
    /// Constants for any URL's
    struct URLs {
        static let kAppListURL = "http://phobos.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=100/json"
    }
    /// Constants for segue identifiers
    struct SegueIdentifiers {
        static let kAppDetailsViewController = "AppDetailsController"
    }
    /// Constants for table view cell identifiers.
    struct CellIdentifiers {
        static let kAppItemCellIdentifier = "AppItemCell"
    }
    /// Constants for any static text used in labels.
    struct LabelText {
        static let kRefreshLabel = "Pull to refresh."
        static let kMainNavTitle = "Top 100 Apps"
    }
    /// Miscellaneous static values.
    struct Misc {
        static let kIconImageSize = "53"
        static let kAppImageSize = "100"
        static let kImageRadius: CGFloat = 10
    }
    
    
    
}
