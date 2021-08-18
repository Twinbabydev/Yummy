//
//  ViewController.swift
//  Yummy
//
//  Created by Nevena Maksimovic on 4/17/21.
//  Copyright © 2021 Nevena Pantic. All rights reserved.
//

import UIKit

// Zdravooo
//
// Prvi
// Projekat
// Sladak
// Zadatak
//
// Jupiii
//
// Imaš vrlo ukusan zadatak da se igraš sa apijem https://www.themealdb.com/api.php :)
// Lepa je dokumentacija, apiKey je 1 za development (a to smo miii :))
// Zadatak je da prikažeš podatke za neki divan recept po izboru!
//
// Prijatnooo :)

class MenuViewController: UIViewController {

 // MARK: - Outlets
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pickPicLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var foodImage1: UIImageView!
    @IBOutlet weak var foodImage2: UIImageView!
    @IBOutlet weak var foodImage3: UIImageView!
    @IBOutlet weak var foodImage4: UIImageView!
    @IBOutlet weak var foodImage5: UIImageView!
    @IBOutlet weak var foodImage6: UIImageView!
    
    var mealsApi = MealsAPI()
    
    var helloLabelArray = ["The people who give you their food give you their heart", "Laughter is brightest where food is best", "Life is a combination of magic and pasta", "Ice cream is exquisite. What a pity it isn't illegal", "A balanced diet is a cookie in each hand", "I only drink Champagne on two occasions, when I am in love and when I am not", "Food is really and truly the most effective medicine", "The belly rules the mind"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        helloLabel.text = helloLabelArray.randomElement()
    }
  
    // MARK: - Navigation
    
    func goToDetailViewController() {
        if let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as DetailViewController? {
        mealsApi.delegate = vc
        present(vc, animated: true)
    }
    }
    // MARK: - Actions
    
    @IBAction func randomPickButton(_ sender: Any) {
        
        goToDetailViewController()
    
        mealsApi.performRequest(mealUrl: mealsApi.randomMealUrl)
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        searchTextField.endEditing(true)
    }
    
    @IBAction func goToResultButton(_ sender: Any) {
    }
}

// MARK: - UITextFieldDelegate

extension MenuViewController: UITextFieldDelegate  {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let mealTyped = textField.text {
            
            goToDetailViewController()
            
             mealsApi.makeUrlByName(mealTyped: mealTyped)
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
}


    
   
