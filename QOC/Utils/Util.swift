//
//  Util.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit

/// Common Util class.
open class Util {
    
    
    /// Util function used to download an image from a given url and place it into the imageview.
    ///
    /// - Parameters:
    ///   - url: url to the image
    ///   - imageView: imageview in which to display the image
    class func loadImage(url: URL?, imageView: UIImageView) {
        
        if let imageURL = url {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                DispatchQueue.main.async {
                    if let imageData = data {
                        imageView.image = UIImage(data: imageData)
                    }
                }
            }
        }

    }
    
}
