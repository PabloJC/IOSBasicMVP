//
//  RecipesRouter.swift
//  IOSBasicMVP
//
//  Created by Pablo Jiménez on 23/1/17.
//  Copyright © 2017 Pablo Jiménez. All rights reserved.
//

import UIKit

class RecipesRouter : RecipesWireframe{
    
    weak var viewController: UIViewController?
    
    func presentDetails(forRecipe recipe: Recipe) {
        //let detailsModuleViewController = DetailsRouter.assembleModule(article)
        //viewController?.navigationController?.pushViewController(detailsModuleViewController, animated: true)
    }
    
    static func assembleModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "RecipeListStoryboard", bundle: nil) 
        let view = storyboard.instantiateViewController(withIdentifier: "RecipeListViewController") as! RecipeListViewController
        let presenter = RecipesPresenter()
        let interactor = RecipesInteractor()
        let router = RecipesRouter()
        
        let navigation = storyboard.instantiateViewController(withIdentifier: "recipesNavigationViewController") as! UINavigationController
        navigation.viewControllers = [view]

        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        
        
        return navigation

    }
    
}


