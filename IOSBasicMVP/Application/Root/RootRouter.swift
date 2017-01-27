//
//  RootRouter.swift
//  IOSBasicMVP
//
//  Created by Pablo Jiménez on 24/1/17.
//  Copyright © 2017 Pablo Jiménez. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {
    
    func presentRecipesScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = RecipesRouter.assembleModule()
    }
}
