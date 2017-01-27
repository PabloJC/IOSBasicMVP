//
//  RecipesUseCases.swift
//  IOSBasicMVP
//
//  Created by Pablo Jiménez on 24/1/17.
//  Copyright © 2017 Pablo Jiménez. All rights reserved.
//

import Foundation

protocol RecipesUseCase: class {
    weak var output: RecipesInteractorOutput! { get set }
    
    func fetchRecipes()
}

protocol RecipesInteractorOutput: class {
    func recipesFetched(_ recipes: [Recipe])
    func recipesFetchFailed()
}
