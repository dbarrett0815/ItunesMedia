//
//  ItunesFeed.swift
//  ItunesMedia
//
//  Created by Davone Barrett on 2/22/19.
//  Copyright © 2019 Davone Barrett. All rights reserved.
//

import Foundation

struct ItunesFeed: Codable {
    let title: String
    let media: [ItunesMedia]
    
    enum CodingKeys: String, CodingKey {
        case title
        case media = "results"
    }
}
