//
//  DataParsingUtil.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit

class DataParsingUtil {

    class func extractTitle(data: [String:Any]) -> String {
        
        if let obj = data["title"] as? [String:Any] {
            return obj["label"] as? String ?? ""
        }
        
        return ""
        
    }
    
    class func extractReleaseDate(data: [String:Any]) -> String {
        
        if let obj = data["im:releaseDate"] as? [String:Any] {
            return DateUtil.formatDate(dateString: obj["label"] as? String)
        }
        return ""
        
        
    }
    
    class func extractSummary(data: [String:Any]) -> String {
        
        if let obj = data["summary"] as? [String: Any] {
            return obj["label"] as? String ?? ""
        }
        
        return ""
        
    }
    
    class func extractPrice(data: [String:Any]) -> String {
        
        if let obj = data["im:price"] as? [String: Any] {
            return obj["label"] as? String ?? ""
        }
        
        return ""
    
    }
    
    class func extractCurrency(data: [String:Any]) -> String {
        
        if let obj = data["im:price"] as? [String: Any] {
            if let attributes = obj["attributes"] as? [String: Any] {
                return attributes["currency"] as? String ?? ""
            }
        }
        
        return ""
        
    }
    
    class func extractCategory(data: [String:Any]) -> String {
        
        if let obj = data["category"] as? [String: Any] {
            if let attributes = obj["attributes"] as? [String: Any] {
                return attributes["label"] as? String ?? ""
            }
        }
        
        return ""
        
    }
    
    class func extractAppStoreLink(data: [String:Any]) -> String {
        
        if let obj = data["link"] as? [String: Any] {
            if let attributes = obj["attributes"] as? [String: Any] {
                return attributes["href"] as? String ?? ""
            }
        }
        
        return ""
        
    }
    
    class func extractPublisherName(data: [String:Any]) -> String {
        
        if let obj = data["im:artist"] as? [String: Any] {
            return obj["label"] as? String ?? ""
        }
        
        return ""
        
    }
    
    class func extractPublisherLink(data: [String:Any]) -> String {
        
        if let obj = data["im:artist"] as? [String: Any] {
            if let attributes = obj["attributes"] as? [String: Any] {
                return attributes["href"] as? String ?? ""
            }
        }
        
        return ""
        
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
