//
//  AppDetailsViewController.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit

class AppDetailsViewController: UIViewController {
    
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var appImage : UIImageView!
    @IBOutlet var priceLabel : UILabel!
    @IBOutlet var dateLabel : UILabel!
    @IBOutlet var summaryTextView : UITextView!
    @IBOutlet var categoryLabel : UILabel!
    @IBOutlet var storeLinkLabel : UILabel!
    @IBOutlet var publisherButton : UIButton!
    @IBOutlet var appStoreButton : UIButton!
    
    var app: Application!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = app.title
        
        appImage.setRounded()
        Util.loadImage(url: app.appImageURL, imageView: appImage)
        
        titleLabel.text = app.title
        priceLabel.text = "\(app.currency!) \(app.price!)"
        categoryLabel.text = app.category
        dateLabel.text = DateUtil.formatDate(dateString: app.releaseDate)
        summaryTextView.text = app.summary
        publisherButton.setTitle(app.publisherName, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func linkOnClick(_ sender: UIButton) {
        switch sender {
            case appStoreButton:
                openUrl(urlString: app.linkToAppStore)
            case publisherButton:
                openUrl(urlString: app.publisherLink)
            default:
                break
        }
        
    }
    
    func openUrl(urlString: String){
        #if (arch(i386) || arch(x86_64)) && (os(iOS) || os(watchOS) || os(tvOS))
            alert(message: "The simulator does not support Appstore links", title: "Error")
        #else
            if let url = URL(string: urlString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        #endif
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
