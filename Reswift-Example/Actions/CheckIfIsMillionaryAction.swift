//
//  CheckIfIsMillionaryAction.swift
//  Reswift-Example
//
//  Created by Vinícius Leão Salmont on 03/05/18.
//  Copyright © 2018 Salmont. All rights reserved.
//

import ReSwift

func isAMillionaryIdea(state: AppState, store: Store<AppState>) -> CheckIfIsMillionaryAction {
        
    let isMillionary = arc4random_uniform(2) == 0 ? true : false
    DispatchQueue.main.async {
        store.dispatch(SetIsAMillionaryIdeaAction(isAMillionaryIdea: isMillionary))
    }
    
    return CheckIfIsMillionaryAction()
}

struct CheckIfIsMillionaryAction: Action { }
