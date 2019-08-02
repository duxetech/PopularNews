//
//  News.swift
//  Most Popular News
//
//  Created by Karthik on 23/07/19.
//  Copyright © 2019 Karthik. All rights reserved.
//

// Data Model for News

import Foundation

struct News : Codable {
    let results : [Results]?
}
struct Results  : Codable {
    let url : String?
    let byline : String?
    let title : String?
    let published_date : String?
}
