//
//  MealsAPI.swift
//  Yummy
//
//  Created by Nevena Maksimovic on 5/27/21.
//  Copyright © 2021 Nevena Pantic. All rights reserved.
//

import Foundation
 
protocol MealsAPIDelegate {
    func didUpdate(data: Meals)
}

struct MealsAPI {
    
    var delegate: MealsAPIDelegate?
    
    let mealNameUrl = "www.themealdb.com/api/json/v1/1/"
   
    let mealIngredientUrl = "https://www.themealdb.com/api/json/v1/1/search.php?f="
    
    let randomMealUrl = "https://www.themealdb.com/api/json/v1/1/random.php"
    
    func makeUrlByName(mealTyped: String) {
        let mealUrl = "https://\(mealNameUrl)search.php?s=\(mealTyped)"
        performRequest(mealUrl: mealUrl)
    }
    
    func performRequest(mealUrl: String) {
        
        if let url = URL(string: mealUrl) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {
                (data, response, error)
                in
                if let error = error {
                    print(error)
                }
                if let safeData = data {
                    if let parsedMeals = self.parseJSON(mealData: safeData) {
                        DispatchQueue.main.async {
                            //do {
                            //    sleep(5)
                            //}
                            self.delegate?.didUpdate(data: parsedMeals)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(mealData: Data) -> Meals? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MealsData.self, from: mealData)
            
            
            let strMeal = decodedData.meals[0].strMeal
            let strCategory = decodedData.meals[0].strCategory
            let strArea = decodedData.meals[0].strArea
            let strInstructions = decodedData.meals[0].strInstructions
            
            print(strMeal)
            print(strInstructions)
            return decodedData.meals[0]
    
        } catch {
            print(error)
            return nil
        }
    }
}


