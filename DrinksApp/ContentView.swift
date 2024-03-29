//
//  ContentView.swift
//  DrinksApp
//
//  Created by Damian on 14/07/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var drinkListVM = DrinkListViewModel()
    @State private var searchText: String = ""

    var body: some View {
        NavigationView{
            List(drinkListVM.drinks, id: \.idDrink) {drink in
                
                DrinkView(drinkThumb: drink.strDrinkThumb!,
                                drinkName: drink.strDrink,
                                drinkIDs: drink.idDrink)
                
            }
            .animation(.default)
            .navigationTitle("Drinks App")
            .listStyle(.plain)
            .searchable(text: $searchText)
            .onChange(of: searchText) { value in
                Task {
                    if !value.isEmpty && value.count > 2 {
                        await drinkListVM.search(name: value)
                    } else {
                        drinkListVM.drinks.removeAll()
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
