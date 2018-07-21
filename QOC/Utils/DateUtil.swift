//
//  DateUtil.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit

class DateUtil {
    class func formatDate(dateString: String?) -> String {
        
        if let string = dateString {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ" //Your date format
            let date = dateFormatter.date(from: string)
            
            dateFormatter.dateFormat = "MM/dd/YYYY"
            return dateFormatter.string(from: date!)
        }
        
        return ""
        
    }
}
