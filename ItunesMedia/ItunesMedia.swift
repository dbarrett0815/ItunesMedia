//
//  ItunesMeida.swift
//  ItunesMedia
//
//  Created by Davone Barrett on 2/22/19.
//  Copyright © 2019 Davone Barrett. All rights reserved.
//

import Foundation

struct ItunesMedia: Codable {
    let artistName: String
    let id: String
    let name: String
    let artworkUrl: String
    let kind: String
    
    private enum CodingKeys: String, CodingKey {
        case artistName
        case id
        case name
        case artworkUrl = "artworkUrl100"
        case kind
    }
}
