//
//  Idea.swift
//  Reswift-Example
//
//  Created by Vinícius Leão Salmont on 02/05/18.
//  Copyright © 2018 Salmont. All rights reserved.
//

import Foundation

struct Idea: Codable {
    let this: String?
    let that: String?
    
    enum CodingKeys: String, CodingKey {
        case this
        case that
    }
    
    func description() -> String {
        guard let this = this else { return "No idea" }
        guard let that = that else { return "No idea" }
        return "So, Basically, It's like a \(this) for \(that)"
    }
}
