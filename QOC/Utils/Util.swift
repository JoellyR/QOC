//
//  Util.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit

open class Util {

    class func loadImage(url: URL?, imageView: UIImageView) {
        
        if let imageURL = url {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                DispatchQueue.main.async {
                    if let imageData = data {
                        imageView.image = UIImage(data: imageData)
                    }
                }
            }
        }

    }
    
}
