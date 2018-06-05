    //
//  StartupIdeasViewController.swift
//  Reswift-Example
//
//  Created by Vinícius Leão Salmont on 02/05/18.
//  Copyright © 2018 Salmont. All rights reserved.
//

import ReSwift
import SKActivityIndicatorView

class StartupIdeasViewController: UIViewController {

    @IBOutlet weak var labelStartupIdea: UILabel!
    
    @IBAction func anotherIdea(_ sender: Any) {
        store.dispatch(FetchIdeaAction())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.dispatch(FetchIdeaAction())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        store.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
}

extension StartupIdeasViewController: StoreSubscriber {
    
    func newState(state: AppState) {
        switch state.ideaState {
        case .loading:
            SKActivityIndicator.show()
        case .finished(let ideaState):
            labelStartupIdea.text = ideaState.idea?.description()
            SKActivityIndicator.dismiss()
        default:
            break
        }
    }
}
