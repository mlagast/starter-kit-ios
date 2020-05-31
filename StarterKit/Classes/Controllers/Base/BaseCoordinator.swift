//
//  BaseCoordinator.swift
//  StarterKit
//
//  Created by Matthieu Lagast on 31/05/2020.
//  Copyright © 2020 mlagast. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var currentViewController: UIViewController? { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func end()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
    func removeChildCoordinators()
}

class BaseCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var childCoordinators = [Coordinator]()
    var parentCoordinator: Coordinator?
    
    func start() {
        fatalError("Start method should be implemented.")
    }
    
    func end() {
        fatalError("Start method should be implemented.")
    }
    
    func start(coordinator: Coordinator) {
        self.childCoordinators += [coordinator]
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    func removeChildCoordinators() {
        self.childCoordinators.forEach { $0.removeChildCoordinators() }
        self.childCoordinators.removeAll()
    }
    
    func didFinish(coordinator: Coordinator) {
        if let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) {
            self.childCoordinators.remove(at: index)
        }
    }
}
