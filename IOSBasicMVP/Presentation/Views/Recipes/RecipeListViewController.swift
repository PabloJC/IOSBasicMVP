//
//  RecipeListViewController.swift
//  IOSBasicMVP
//
//  Created by Pablo Jiménez on 23/1/17.
//  Copyright © 2017 Pablo Jiménez. All rights reserved.
//

import UIKit

class RecipeListViewController: BaseViewController {

    @IBOutlet weak var recipeListTableView: UITableView!
    var refreshControl: UIRefreshControl = UIRefreshControl()
    
    var presenter: RecipesPresentation!
    var recipes: [Recipe] = [] {
        didSet {
            recipeListTableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getData()
    }
    
    func getData(){
        presenter.getRecipes()
    }
    
    fileprivate func setupView() {
        
        navigationItem.title = Localization.Recipes.navigationBarTitle
        
        recipeListTableView.dataSource = self
        recipeListTableView.delegate = self
        
        recipeListTableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(self.getData), for: .valueChanged)
        
        
        recipeListTableView.rowHeight = 120
        recipeListTableView.register(UINib(nibName: "RecipesTableViewCell",bundle : nil), forCellReuseIdentifier: "RecipeCell")
        
    }

}

extension RecipeListViewController: RecipesView{
    func showNoContentScreen() {
        
    }
    
    func showRecipesData(_ recipes: [Recipe]) {
        self.recipes = recipes
    }
    
    func showProgressIndicator() {
        refreshControl.beginRefreshing()
    }
    
    func hideProgressIndicator() {
        refreshControl.endRefreshing()
    }
}

extension RecipeListViewController: UITableViewDataSource, UITableViewDelegate {

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipesTableViewCell
       
        let recipe = recipes[indexPath.section]
        cell.selectionStyle = .none
    
        cell.setup(recipe)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRecipe(recipes[indexPath.section])
    }
    
    
}

