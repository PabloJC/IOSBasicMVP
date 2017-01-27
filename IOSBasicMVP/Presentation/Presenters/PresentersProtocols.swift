//
//  PresentersProtocols.swift
//  IOSBasicMVP
//
//  Created by Pablo Jiménez on 24/1/17.
//  Copyright © 2017 Pablo Jiménez. All rights reserved.
//

import Foundation

protocol RecipesPresentation: class {
    weak var view: RecipesView? { get set }
    var interactor: RecipesUseCase! { get set }
    var router: RecipesWireframe! { get set }
    
    func getRecipes()
    func didSelectRecipe(_ recipe: Recipe)
}
