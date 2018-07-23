//
//  DateUtil.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit

/// Date Util class.
class DateUtil {
    
    
    /// Used to fromat date into the MM/DD/YYYY format
    ///
    /// - Parameter dateString: original date string.
    /// - Returns: formated date string.
    class func formatDate(dateString: String?) -> String {
        
        if let string = dateString {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ" //Your date format
            let originalDate = dateFormatter.date(from: string)
            
            if let date = originalDate {
                dateFormatter.dateFormat = "MM/dd/YYYY"
                return dateFormatter.string(from: date)
            }
            
        }
        
        return ""
        
    }
}
