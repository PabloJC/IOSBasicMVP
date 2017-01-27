//
//  RouterProtocols.swift
//  IOSBasicMVP
//
//  Created by Pablo Jiménez on 24/1/17.
//  Copyright © 2017 Pablo Jiménez. All rights reserved.
//

import UIKit

protocol RecipesWireframe: class {
    weak var viewController: UIViewController? { get set }
    
    func presentDetails(forRecipe recipe: Recipe)
    
    static func assembleModule() -> UIViewController
}
