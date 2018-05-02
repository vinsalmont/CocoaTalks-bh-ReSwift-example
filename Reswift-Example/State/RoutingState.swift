//
//  RoutingState.swift
//  Reswift-Example
//
//  Created by Vinícius Leão Salmont on 02/05/18.
//  Copyright © 2018 Salmont. All rights reserved.
//

import ReSwift

struct RoutingState: StateType {
    var destination: RoutingDestination
    
    init(destination: RoutingDestination = .dogsList) {
        self.destination = destination
    }
}
