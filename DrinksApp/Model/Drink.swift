//
//  Drink.swift
//  DrinksApp
//
//  Created by Damian on 14/07/2022.
//

import Foundation


struct DrinkResponse: Decodable {
    let drinks: [Drink]
}

struct Drink: Decodable {
    let strDrink: String
    let strDrinkThumb: String
    let idDrink: String
}

//test
