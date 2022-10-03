//
//  Recipe.swift
//  RecipeApp
//
//  Created by Tiara H on 01/10/22.
//

import Foundation

struct Recipe {
    let name: String
    let thumbnails: String
    let prepTime: String


    
    init(name: String, thumbnails: String, prepTime: String) {
        self.name = name
        self.thumbnails = thumbnails
        self.prepTime = prepTime

  
    }
    
}
