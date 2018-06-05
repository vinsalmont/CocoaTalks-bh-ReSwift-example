//
//  IdeaReducer.swift
//  Reswift-Example
//
//  Created by Vinícius Leão Salmont on 02/05/18.
//  Copyright © 2018 Salmont. All rights reserved.
//

import ReSwift

func ideaReducer(action: Action, state: Result<IdeaState>?) -> Result<IdeaState> {
    
    switch action {
    case _ as FetchIdeaAction:
        API.sharedInstance.loadMillionaryIdea { (idea) in
            guard let idea = idea else { return }
            store.dispatch(SetGenialIdeaAction(idea: idea))
        }
    case let setGenialIdeaAction as SetGenialIdeaAction:
        return Result<IdeaState>.finished(IdeaState(idea: setGenialIdeaAction.idea))

    default:
        break
    }
    
    return Result<IdeaState>.loading
}
