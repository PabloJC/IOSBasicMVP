//
//  ViewsProtocols.swift
//  IOSBasicMVP
//
//  Created by Pablo Jiménez on 24/1/17.
//  Copyright © 2017 Pablo Jiménez. All rights reserved.
//

import Foundation

protocol RecipesView: BaseProtocol {
    var presenter: RecipesPresentation! { get set }
    
    func showNoContentScreen()
    func showRecipesData(_ articles: [Recipe])
}
