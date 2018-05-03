//
//  FetchIdeaAction.swift
//  Reswift-Example
//
//  Created by Vinícius Leão Salmont on 02/05/18.
//  Copyright © 2018 Salmont. All rights reserved.
//

import ReSwift

func fetchMillionaryIdea(state: AppState, store: Store<AppState>) -> FetchIdeaAction {
    
    API.sharedInstance.loadMillionaryIdea { (idea) in
        guard let idea = idea else { return }
        store.dispatch(SetGenialIdeaAction(idea: idea))
    }
    
    return FetchIdeaAction()
}

struct FetchIdeaAction: Action { }
