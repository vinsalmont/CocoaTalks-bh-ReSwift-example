//
//  RoutingReducer.swift
//  Reswift-Example
//
//  Created by Vinícius Leão Salmont on 02/05/18.
//  Copyright © 2018 Salmont. All rights reserved.
//

import ReSwift

func routingReducer(action: Action, state: RoutingState?) -> RoutingState {
    var newState = state ?? RoutingState()
    
    switch action {
    case let routeAction as RoutingAction:
        newState.destination = routeAction.destination
    default:
        break
    }
    
    return newState
}
