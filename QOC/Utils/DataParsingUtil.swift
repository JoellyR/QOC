//
//  DataParsingUtil.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit

/// Util to externalize the parsing of data so that it can be easily accesible from any class.
class DataParsingUtil {
    
    
    /// Util to extract nested data (1 layer down) with the ability to provide custom values for the fields to drop
    /// through.
    /// - Parameters:
    ///   - from: The main key to parse.
    ///   - subField: The nested field to get the actual data from.
    ///   - data: The orginial full data.
    /// - Returns: The value which was extracted.
    class func extractData(from: String, subField:String, data: [String:Any]) -> String{
        if let obj = data[from] as? [String:Any] {
            return obj[subField] as? String ?? ""
        }
        return ""
    }
    
    
    /// Util to extract nested data (1 layer down) with the sub field always being "label"
    ///
    /// - Parameters:
    ///   - from: The main key to parse.
    ///   - data:  The orginial full data.
    /// - Returns: The value which was extracted.
    class func extractLabel(from: String, data: [String:Any]) -> String{
        if let obj = data[from] as? [String:Any] {
            return obj["label"] as? String ?? ""
        }
        return ""
    }
    
    /// Util to extract a specified attribute from a given field.
    ///
    /// - Parameters:
    ///   - from: The main key to parse.
    ///   - attribute: The key of the attribute value that is to be extracted.
    ///   - data: The orginial full data.
    /// - Returns: The value which was extracted.
    class func extractAttribute(from: String, attribute: String, data: [String:Any]) -> String {
        
        if let obj = data[from] as? [String: Any] {
            if let attributes = obj["attributes"] as? [String: Any] {
                return attributes[attribute] as? String ?? ""
            }
        }
        
        return ""
        
    }
    
    
    /// Below are methods used to extract specific data using the parsing Utils defined above.
    
    class func extractTitle(data: [String:Any]) -> String {
        
        return self.extractLabel(from: "title", data: data)
        
    }
    
    class func extractReleaseDate(data: [String:Any]) -> String {
        
        return self.extractLabel(from: "im:releaseDate", data: data)
        
    }
    
    class func extractSummary(data: [String:Any]) -> String {
        
        return self.extractLabel(from: "summary", data: data)
        
    }
    
    class func extractPrice(data: [String:Any]) -> String {
        
        return self.extractLabel(from: "im:price", data: data)
    
    }
    
    class func extractCurrency(data: [String:Any]) -> String {
        
        return self.extractAttribute(from: "im:price", attribute: "currency", data: data)
        
    }
    
    class func extractCategory(data: [String:Any]) -> String {
        
        return self.extractAttribute(from: "category", attribute: "label", data: data)
        
    }
    
    class func extractAppStoreLink(data: [String:Any]) -> String {
        
        return self.extractAttribute(from: "link", attribute: "href", data: data)
        
    }
    
    class func extractPublisherName(data: [String:Any]) -> String {
        
        return self.extractLabel(from: "im:artist", data: data)
        
    }
    
    class func extractPublisherLink(data: [String:Any]) -> String {
        
        return self.extractAttribute(from: "im:artist", attribute: "href", data: data)
        
    }
    
    class func extractImageURL(data: [String:Any], size: String) -> URL? {
        
        if let imageArray = data["im:image"] as? [[String: Any]] {
            for image in imageArray {
                if let attributes = image["attributes"] as? [String:Any] {
                    if let height = attributes["height"] as? String {
                        if height == size {
                            return URL(string: image["label"] as? String ?? "")!
                        }
                    }
                }
            }
        }
        
        return nil
        
    }
}
