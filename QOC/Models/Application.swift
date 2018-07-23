//
//  Application.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit


/// Simple model for a single app.
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
        self.title = DataParsingUtil.extractTitle(data: data)
        self.releaseDate = DataParsingUtil.extractReleaseDate(data: data)
        self.summary = DataParsingUtil.extractSummary(data: data)
        self.price = DataParsingUtil.extractPrice(data: data)
        self.currency = DataParsingUtil.extractCurrency(data: data)
        self.category = DataParsingUtil.extractCategory(data: data)
        self.linkToAppStore = DataParsingUtil.extractAppStoreLink(data: data)
        self.publisherName = DataParsingUtil.extractPublisherName(data: data)
        self.publisherLink = DataParsingUtil.extractPublisherLink(data: data)
        self.appImageURL = DataParsingUtil.extractImageURL(data: data, size: Constants.Misc.kAppImageSize)
    }
}
