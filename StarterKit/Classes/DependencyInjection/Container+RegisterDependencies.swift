//
//  Container+RegisterDependencies.swift
//  StarterKit
//
//  Created by Matthieu Lagast on 31/05/2020.
//  Copyright © 2020 mlagast. All rights reserved.
//

import Swinject

class AppContainer {
    static let shared: Container = Container()
    
    static func setup() {
        AppContainer.shared.registerDependencies()
    }
    
    static func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return AppContainer.shared.resolve(serviceType)
    }
}

extension Container {
    
    func registerDependencies() {
        registerCoordinators()
        registerViewModels()
    }
    
    func registerCoordinators() {}
    
    func registerViewModels() {}
}
