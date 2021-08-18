//
//  DetailViewController.swift
//  Yummy
//
//  Created by Nevena Maksimovic on 6/1/21.
//  Copyright © 2021 Nevena Pantic. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
    // MARK: - Outlets
    
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var instructionsScrollView: UIScrollView!
    
    var mealsAPI = MealsAPI()
    
    override func viewDidLoad() {
    super.viewDidLoad()
        print("viewDidLoad")
        mealsAPI.delegate = self
    }
    
    // MARK: - Actions
    
    @IBAction func chooseAgainButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension DetailViewController: MealsAPIDelegate {
    func didUpdate(data: Meals) {
        
        
        
        //print(data)
        //print(data.strMeal)
        // print(dishNameLabel.text)
        print("MealsAPIDelegate didUpdate")
        dishNameLabel.text = data.strMeal
        categoryLabel.text = data.strCategory
        areaLabel.text = data.strArea
        instructionsLabel.text = data.strInstructions
    }
}
