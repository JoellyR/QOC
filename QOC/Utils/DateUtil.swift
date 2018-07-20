//
//  DateUtil.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit

class DateUtil {
    class func formatDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ" //Your date format
        let date = dateFormatter.date(from: dateString)
        
        dateFormatter.dateFormat = "MM/dd/YYYY"
        return dateFormatter.string(from: date!)
    }
}
