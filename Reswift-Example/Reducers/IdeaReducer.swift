//
//  IdeaReducer.swift
//  Reswift-Example
//
//  Created by Vinícius Leão Salmont on 02/05/18.
//  Copyright © 2018 Salmont. All rights reserved.
//

import ReSwift

func ideaReducer(action: Action, state: IdeaState?) -> IdeaState {
    var newState = state ?? IdeaState(idea: nil, isLoading: false, isMillionary: nil, alreadyChecked: false)
    
    switch action {
    case _ as FetchIdeaAction:
        newState = IdeaState(idea: state?.idea, isLoading: true, isMillionary: nil, alreadyChecked: false)
    case let setGenialIdeaAction as SetGenialIdeaAction:
        newState.idea = setGenialIdeaAction.idea
        newState.isLoading = false
    case _ as CheckIfIsMillionaryAction:
        newState = IdeaState(idea: state?.idea, isLoading: true, isMillionary: nil, alreadyChecked: true)
    case let setIsAMillionaryIdeaAction as SetIsAMillionaryIdeaAction:
        newState.isMillionary = setIsAMillionaryIdeaAction.isAMillionaryIdea
        newState.isLoading = false
    default:
        break
    }
    
    return newState
}
