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
        
        let titleObj = data["title"] as! [String:Any]
        return titleObj["label"] as! String
        
    }
    
    class func extractReleaseDate(data: [String:Any]) -> String {
        
        let releaseDateObj = data["im:releaseDate"] as! [String:Any]
        
        return DateUtil.formatDate(dateString: releaseDateObj["label"] as! String)
        
    }
    
    class func extractSummary(data: [String:Any]) -> String {
        
        let summaryObj = data["summary"] as! [String: Any]
        
        return summaryObj["label"] as! String
        
    }
    
    class func extractPrice(data: [String:Any]) -> String {
        
        let priceObj = data["im:price"] as! [String: Any]
        
        return priceObj["label"] as! String
        
    }
    
    class func extractCurrency(data: [String:Any]) -> String {
        
        let priceObj = data["im:price"] as! [String: Any]
        
        let attributes = priceObj["attributes"] as! [String: Any]
        
        return attributes["currency"] as! String
        
    }
    
    class func extractCategory(data: [String:Any]) -> String {
        
        let categoryObj = data["category"] as! [String: Any]
        
        let attributes = categoryObj["attributes"] as! [String: Any]
        
        return attributes["label"] as! String
        
    }
    
    class func extractAppStoreLink(data: [String:Any]) -> String {
        
        let linkObj = data["link"] as! [String: Any]
        
        let attributes = linkObj["attributes"] as! [String: Any]
        
        return attributes["href"] as! String
        
    }
    
    class func extractPublisherName(data: [String:Any]) -> String {
        
        let publisherObj = data["im:artist"] as! [String: Any]
        
        return publisherObj["label"] as! String
        
    }
    
    class func extractPublisherLink(data: [String:Any]) -> String {
        
        let publisherObj = data["im:artist"] as! [String: Any]
        
        let attributes = publisherObj["attributes"] as! [String: Any]
        
        return attributes["href"] as! String
        
    }
    
    class func extractImageURL(data: [String:Any], size: String) -> URL! {
        let imageArray = data["im:image"] as! [[String: Any]]
        var url : URL!
        for image in imageArray {
            let attributes = image["attributes"] as! [String:Any]
            if attributes["height"] as! String == size {
                url = URL(string: image["label"] as! String)!
            }
        }
        return url
    }
}
