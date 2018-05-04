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
    @IBOutlet weak var buttonBuildStartup: UIButton!
    @IBOutlet weak var labelIsMillionaryIdea: UILabel!
    
    @IBAction func anotherIdea(_ sender: Any) {
        store.dispatch(fetchMillionaryIdea)
    }
    
    @IBAction func buildThatStartup(_ sender: Any) {
        store.dispatch(isAMillionaryIdea)
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
    
    private func setupIsMillionaryLabel(isMillionary: Bool) {
        let color: UIColor = isMillionary ? .green : .red
        let text: String = isMillionary ? "YOU'RE RICH" : "YOU'RE BROKE"
        labelIsMillionaryIdea.text = text
        labelIsMillionaryIdea.textColor = color
        labelIsMillionaryIdea.layoutIfNeeded()
    }
}

extension StartupIdeasViewController: StoreSubscriber {
    
    func newState(state: IdeaState) {
        labelIsMillionaryIdea.text = ""
        labelStartupIdea.text = state.idea?.description()
        state.isLoading ? SKActivityIndicator.show() : SKActivityIndicator.dismiss()
        buttonBuildStartup.isEnabled = !state.alreadyChecked
        
        if let isMillionary = state.isMillionary {
           self.setupIsMillionaryLabel(isMillionary: isMillionary)
        }
    }
}
