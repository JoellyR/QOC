//
//  TableViewCells.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//
import UIKit

extension UIImageView {
    
    func setRounded() {
        //let radius = self.frame.width / 2
        self.layer.cornerRadius = Constants.Misc.kImageRadius
        self.layer.masksToBounds = true
    }
}

