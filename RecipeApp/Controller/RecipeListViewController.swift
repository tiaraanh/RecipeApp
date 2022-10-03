//
//  RecipeListViewController.swift
//  RecipeApp
//
//  Created by Tiara H on 01/10/22.
//

import UIKit

class RecipeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleBars: UINavigationItem!
    
    var recipes: [Recipe] = [
        Recipe(name: "Egg Benedict", thumbnails: "egg_benedict", prepTime: "Prep Time: 1 hour"),
        Recipe(name: "Mushroom Risotto", thumbnails: "mushroom_risotto.jpg", prepTime: "Prep Time: 30 min"),
        Recipe(name: "Full Breakfast", thumbnails: "full_breakfast.jpg", prepTime: "Prep Time: 25 min"),
        Recipe(name: "Hamburger", thumbnails: "hamburger.jpg", prepTime: "Prep Time: 15 min"),
        Recipe(name: "Ham and Egg Sandwich", thumbnails: "ham_and_egg_sandwich.jpg", prepTime: "Prep Time: 20 min"),
        Recipe(name: "Creme Brelee", thumbnails: "creme_brelee.jpg", prepTime: "Prep Time: 10 min"),
        Recipe(name: "White Chocolate Donut", thumbnails: "white_chocolate_donut.jpg", prepTime: "Prep Time: 1 hour"),
        Recipe(name: "Starbucks Coffee", thumbnails: "starbucks_coffee.jpg", prepTime: "Prep Time: 2 hour"),
        Recipe(name: "Vegetable Curry", thumbnails: "vegetable_curry.jpg", prepTime: "Prep Time: 50 min"),
        Recipe(name: "Instant Noodle with Egg", thumbnails: "instant_noodle_with_egg.jpg", prepTime: "Prep Time: 65 min"),
        Recipe(name: "Noodle with BBQ", thumbnails: "vegetable_curry.jpg", prepTime: "Prep Time: 40 min"),
        Recipe(name: "Japanese Noodle", thumbnails: "vegetable_curry.jpg", prepTime: "Prep Time: 30 min"),
        Recipe(name: "Green Tea", thumbnails: "green_tea.jpg", prepTime: "Prep Time: 25 min"),
        Recipe(name: "Thai Shrimp Cake", thumbnails: "thai_shrimp_cake.jpg", prepTime: "Prep Time: 1.5 hour"),
        Recipe(name: "Angry Birds Cake", thumbnails: "angry_birds_cake.jpg", prepTime: "Prep Time: 2 hour"),
        Recipe(name: "Ham and Cheese Panini", thumbnails: "ham_and_cheese_panini.jpg", prepTime: "Prep Time: 35 min")
    ]
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        
        
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCellId", for: indexPath) as! RecipeViewCell
        
        let recipe = recipes[indexPath.row]
        
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = recipe.prepTime
        cell.thumbImageView.image = UIImage(named: recipe.thumbnails)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
        
        return cell
    }
    
    // MARK: - Helper Functions
    
    func reload (_ index: Int) {
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // use segue
//        performSegue(withIdentifier: "secondRecipe", sender: self)
        
        // use storyboard
        if let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondRecipeViewController {
            
            secondViewController.imageView = UIImage(named: recipes[indexPath.row].thumbnails)!
            secondViewController.nameRecipe = recipes[indexPath.row].name
            secondViewController.timeRecipe = recipes[indexPath.row].prepTime
            secondViewController.titles = recipes[indexPath.row].name
     
            
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
        
        
    }
    
    // Swipe
    func delete(at indexPath: IndexPath) {
        recipes.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { action, view, completion in
            self.delete(at: indexPath)
            completion(true)
        }
        
        let actions = UISwipeActionsConfiguration(actions: [delete])
        actions.performsFirstActionWithFullSwipe = true
        return actions
        
    }
    

}
