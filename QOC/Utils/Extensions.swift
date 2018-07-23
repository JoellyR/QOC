//
//  TableViewCells.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//
import UIKit

//File used to keep all extensions in one place.

//Imageview extension used to set a border radius to the imageview.
extension UIImageView {
    
    func setRounded() {
        //let radius = self.frame.width / 2
        self.layer.cornerRadius = Constants.Misc.kImageRadius
        self.layer.masksToBounds = true
    }
    
}

//Extension used to provide a function to easily display an alert on any ViewController.
extension UIViewController {
    
    func alert(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alert(message: String, title: String, completion: @escaping (() -> Swift.Void)) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in
            completion()
        })
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

