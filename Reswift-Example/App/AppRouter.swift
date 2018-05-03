//
//  AppRouter.swift
//  Reswift-Example
//
//  Created by Vinícius Leão Salmont on 02/05/18.
//  Copyright © 2018 Salmont. All rights reserved.
//

import ReSwift

final class AppRouter {
    
    let navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.navigationController = UINavigationController()
        window.rootViewController = self.navigationController
        
        store.subscribe(self) {
            $0.select {
                $0.routingState
            }
        }
    }
    
    private func push(with identifier: String, isAnimated: Bool = true) {
        let newViewController = instantiateViewController(with: identifier)
        let newViewControllerType = type(of: newViewController)
        
        if let currentViewController = navigationController.topViewController {
            let currentType = type(of: currentViewController)
            
            if currentType == newViewControllerType {
                return
            }
        }
        
        navigationController.pushViewController(newViewController, animated: isAnimated)
    }
    
    private func instantiateViewController(with identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}

// MARK: - StoreSubscriber
extension AppRouter: StoreSubscriber {
    
    func newState(state: RoutingState) {
        let shouldAnimate = self.navigationController.topViewController != nil
        self.push(with: state.destination.rawValue, isAnimated: shouldAnimate)
    }
}

