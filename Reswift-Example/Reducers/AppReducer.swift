//
//  AppReducer.swift
//  Reswift-Example
//
//  Created by Vinícius Leão Salmont on 02/05/18.
//  Copyright © 2018 Salmont. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        ideaState: ideaReducer(action: action, state: state?.ideaState)
    )
}
