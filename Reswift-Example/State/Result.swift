//
//  Result.swift
//  Reswift-Example
//
//  Created by Vinícius Leão Salmont on 04/06/18.
//  Copyright © 2018 Salmont. All rights reserved.
//

import Foundation
enum Result<T> {
    case loading
    case failed
    case finished(T)
}

