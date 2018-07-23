//
//  NetworkUtil.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-21.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit

/// Util to externalize the network calls form the ViewControllers.
class NetworkUtil {
    
    /// Network call to get the list of top 100 apps from the appstore.
    ///
    /// - Parameter responseHandler: The block of code to execute in the ViewController once a response has been received.
    class func getData(responseHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void){
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: Constants.URLs.kAppListURL)!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            responseHandler(data, response, error)
            
        })
        task.resume()
    }
}
