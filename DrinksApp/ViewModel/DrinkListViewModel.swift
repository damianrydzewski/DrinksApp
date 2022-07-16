//
//  DrinkListViewModel.swift
//  DrinksApp
//
//  Created by Damian on 16/07/2022.
//

import Foundation


@MainActor
class DrinkListViewModel: ObservableObject {

    @Published var drinks: [DrinkViewModel] = []
    
    func search(name: String) async {
        do {
             let drinks = try await Webservice().getDrinks(searchTerm: name)
            
            DispatchQueue.main.async {
                self.drinks = drinks.map(DrinkViewModel.init)
            }
        } catch {
             print(error)
        }
    }
}


struct DrinkViewModel {
    let drink: Drink
    
    var strDrink: String {
        drink.strDrink
    }
    
    var strDrinkThumb: URL? {
        URL(string: drink.strDrinkThumb)
    }
    
    var idDrink: String {
        drink.idDrink
    }
}
