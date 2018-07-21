//
//  DataParsingUtil.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit

class DataParsingUtil {

    class func extractData(from: String, subField:String, data: [String:Any]) -> String{
        if let obj = data[from] as? [String:Any] {
            return obj[subField] as? String ?? ""
        }
        return ""
    }
    
    class func extractLabel(from: String, data: [String:Any]) -> String{
        if let obj = data[from] as? [String:Any] {
            return obj["label"] as? String ?? ""
        }
        return ""
    }
    
    class func extractAttribute(from: String, attribute: String, data: [String:Any]) -> String {
        
        if let obj = data[from] as? [String: Any] {
            if let attributes = obj["attributes"] as? [String: Any] {
                return attributes[attribute] as? String ?? ""
            }
        }
        
        return ""
        
    }
    
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
