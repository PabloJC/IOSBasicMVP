//
//  RecipesAPIService.swift
//  IOSBasicMVP
//
//  Created by Pablo Jiménez on 23/1/17.
//  Copyright © 2017 Pablo Jiménez. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import AlamofireObjectMapper

class RecipesApiService {
    
    static func fetchArticles() -> Observable<[Recipe]> {
        return Observable<[Recipe]>.create { observer -> Disposable in
            let request = Alamofire
                .request(Endpoints.Recipes.fetch.url, method: .get)
                .validate()
                .responseArray(completionHandler: { (response: DataResponse<[Recipe]>) in
                    switch response.result {
                    case .success(let recipes):
                        observer.onNext(recipes)
                        observer.onCompleted()
                        
                    case .failure(let error):
                        observer.onError(error)
                    }
                })
            
            return Disposables.create(with: {
                request.cancel()
            })
        }
    }
}
