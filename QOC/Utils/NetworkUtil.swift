//
//  NetworkUtil.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-21.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit

class NetworkUtil {

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
