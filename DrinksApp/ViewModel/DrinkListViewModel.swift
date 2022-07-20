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
    @Published var drinkDetail: [DrinkDetailVM] = []
    
    func search(name: String) async {
        do {
            let drinks = try await APICall().getDrinks(searchTerm: name)
            
            DispatchQueue.main.async {
                self.drinks = drinks.map(DrinkViewModel.init)
            }
        } catch {
             print(error)
        }
    }
    
    
    
    func getDrinkDetail(drinkID: String) async {
        do {
            let drinks = try await APICall().fetchDrinkDetail(drinkID: drinkID)
            
            DispatchQueue.main.async {
                self.drinkDetail = drinks.map(DrinkDetailVM.init)
                
            }
        }catch {
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

struct DrinkDetailVM {
    let drink: DrinkDetail
    
    var idDrink: String {
        drink.idDrink ?? ""
    }
    var strDrink: String {
        drink.strDrink ?? ""
    }
    var strInstructions: String {
        drink.strInstructions ?? ""
    }
    var strDrinkThumb: URL? {
        URL(string: drink.strDrinkThumb ?? "")
    }
    var arrayOfIngredients: [String?] {
        return [drink.strIngredient1,
                drink.strIngredient2,
                drink.strIngredient3,
                drink.strIngredient4,
                drink.strIngredient5,
                drink.strIngredient6,
                drink.strIngredient7,
                drink.strIngredient8,
                drink.strIngredient9,
                drink.strIngredient10,
                drink.strIngredient11,
                drink.strIngredient12,
                drink.strIngredient13,
                drink.strIngredient14,
                drink.strIngredient15]
    }
    var arrayOfMeasure: [String?] {
        return [drink.strMeasure1,
                drink.strMeasure2,
                drink.strMeasure3,
                drink.strMeasure4,
                drink.strMeasure5,
                drink.strMeasure6,
                drink.strMeasure7,
                drink.strMeasure8,
                drink.strMeasure9,
                drink.strMeasure10,
                drink.strMeasure11,
                drink.strMeasure12,
                drink.strMeasure13,
                drink.strMeasure14,
                drink.strMeasure15]
    }
}
