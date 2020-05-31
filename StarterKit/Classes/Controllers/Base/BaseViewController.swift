//
//  BaseViewController.swift
//  StarterKit
//
//  Created by Matthieu Lagast on 31/05/2020.
//  Copyright © 2020 mlagast. All rights reserved.
//

import UIKit

class BaseViewController<T: BaseViewModel>: UIViewController {
    
    var viewModel: T!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = AppContainer.resolve(T.self)
        viewModel.initContext()
    }
}
