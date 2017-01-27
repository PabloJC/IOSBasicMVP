//
//  RecipesTableViewCell.swift
//  IOSBasicMVP
//
//  Created by Pablo Jiménez on 23/1/17.
//  Copyright © 2017 Pablo Jiménez. All rights reserved.
//

import UIKit

class RecipesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!

    func setup(_ recipe: Recipe) {
        nameLabel?.text = recipe.name
    }

}
