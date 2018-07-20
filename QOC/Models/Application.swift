//
//  Application.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit

class Application {
    
    var title: String!
    var appIcon: String!
    var releaseDate: String!
    var summary: String!
    var price: String!
    var currency: String!
    var category: String!
    var linkToAppStore: String!
    var publisherName: String!
    var publisherLink: String!
    var appImageURL: URL!
    
    init(data: [String: Any]) {
        self.title = Util.extractTitle(data: data)
        self.releaseDate = Util.extractReleaseDate(data: data)
        self.summary = Util.extractSummary(data: data)
        self.price = Util.extractPrice(data: data)
        self.currency = Util.extractCurrency(data: data)
        self.category = Util.extractCategory(data: data)
        self.linkToAppStore = Util.extractAppStoreLink(data: data)
        self.publisherName = Util.extractPublisherName(data: data)
        self.publisherLink = Util.extractPublisherLink(data: data)
        self.appImageURL = Util.extractImageURL(data: data, size: Constants.Misc.kAppImageSize)
    }
}
