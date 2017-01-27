//
//  RecipesPresenter.swift
//  IOSBasicMVP
//
//  Created by Pablo Jiménez on 23/1/17.
//  Copyright © 2017 Pablo Jiménez. All rights reserved.
//

import Foundation

class RecipesPresenter: RecipesPresentation{
    
    weak var view: RecipesView?
    var interactor: RecipesUseCase!
    var router: RecipesWireframe!
    
    var recipes : [Recipe] = []{
        didSet{
            if recipes.count > 0 {
                view?.showRecipesData(recipes)
            }else{
                view?.showNoContentScreen()
            }
        }
    }
    
    func getRecipes() {
        interactor.fetchRecipes()
        view?.showProgressIndicator()
    }
    
    func didSelectRecipe(_ recipe: Recipe) {
        router.presentDetails(forRecipe: recipe)
    }
}

extension RecipesPresenter : RecipesInteractorOutput{
    
    func recipesFetched(_ recipes: [Recipe]) {
        self.recipes = recipes
        view?.hideProgressIndicator()
    }
    
    internal func recipesFetchFailed() {
        view?.showNoContentScreen()
        view?.hideProgressIndicator()
    }
}
