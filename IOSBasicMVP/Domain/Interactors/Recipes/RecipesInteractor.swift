//
//  RecipesInteractor.swift
//  IOSBasicMVP
//
//  Created by Pablo Jiménez on 23/1/17.
//  Copyright © 2017 Pablo Jiménez. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RxSwift
import ObjectMapper


class RecipesInteractor: RecipesUseCase {
    
    weak var output: RecipesInteractorOutput!
    private var disposeBag = DisposeBag()
    
    func fetchRecipes() {
        
        RecipesApiService
            .fetchArticles()
        .subscribe(onNext: { recipes in
            self.output.recipesFetched(recipes)
        }, onError: { error in
            self.output.recipesFetchFailed()
        })
        .addDisposableTo(disposeBag)
        
    }
}
