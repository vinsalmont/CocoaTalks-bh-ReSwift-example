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
        store.dispatch(fetchMillionaryIdea)
    }
    
    @IBAction func buildThatStartup(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.dispatch(fetchMillionaryIdea)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        store.subscribe(self) {
            $0.select {
                $0.ideaState
            }
        }
        
        store.dispatch(RoutingAction(destination: .genialIdea))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
}

extension StartupIdeasViewController: StoreSubscriber {
    
    func newState(state: IdeaState) {
        labelStartupIdea.text = state.idea?.description()
        state.isLoading ? SKActivityIndicator.show() : SKActivityIndicator.dismiss()
    }
}
