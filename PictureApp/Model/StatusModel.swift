//
//  ErrorModel.swift
//  PictureApp
//
//  Created by Vitaly on 06.05.2023.
//

import Foundation

struct Status {
    var process: Process
    var description: String
}

enum Process {
    case preparing
    case error
    case success
}
