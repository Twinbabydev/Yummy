//
//  MealsModel.swift
//  Yummy
//
//  Created by Nevena Maksimovic on 5/28/21.
//  Copyright © 2021 Nevena Pantic. All rights reserved.
//

import Foundation

struct MealsData: Codable {
    let meals: [Meals]
   
}

struct Meals: Codable {
       
       let strMeal: String
       let strCategory: String
       let strArea: String
       let strInstructions: String
}
