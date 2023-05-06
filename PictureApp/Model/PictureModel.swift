//
//  PictureModel.swift
//  PictureApp
//
//  Created by Vitaly on 06.05.2023.
//

import Foundation

struct Picture: Identifiable, Codable, Equatable {
    let id: String
    let description: String
    let links: Link
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case description = "alt_description"
        case links = "urls"
    }
    
}

struct Link: Codable, Equatable {
    let full: String
    let thumb: String
}
