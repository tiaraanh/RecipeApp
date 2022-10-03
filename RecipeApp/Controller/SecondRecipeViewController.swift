//
//  SecondRecipeViewController.swift
//  RecipeApp
//
//  Created by Tiara H on 01/10/22.
//

import UIKit

class SecondRecipeViewController: UIViewController {
    
    @IBOutlet weak var titleBar: UINavigationItem!
    @IBOutlet weak var thumbsViewImage: UIImageView!
    @IBOutlet weak var namesLabel: UILabel!
    @IBOutlet weak var timesLabel: UILabel!
    
    var imageView = UIImage()
    var nameRecipe = ""
    var timeRecipe = ""
    var titles = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        thumbsViewImage.image = imageView
        namesLabel.text = nameRecipe
        timesLabel.text = timeRecipe
        self.title = self.titles
        
    }
    

}
