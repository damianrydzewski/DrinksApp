//
//  DrinkObjectView.swift
//  DrinksApp
//
//  Created by Damian on 16/07/2022.
//

import SwiftUI

struct DrinkObjectView: View {
    
    var drinkThumb: URL
    var drinkName: String
    var drinkIDs: String
    
    @State private var isSheetDisplayed = false
    @StateObject var drinkDetail = DrinkListViewModel()

    var body: some View {
        Button {
            isSheetDisplayed.toggle()
        } label: {
            HStack (spacing: 20){
                AsyncImage(url: drinkThumb, content: { image in
                                    image.resizable()
                                             .aspectRatio(contentMode: .fit)
                                             .frame(maxWidth: 80)
                                    }, placeholder: {
                                        ProgressView()
                                    })
                .clipShape(Circle())
                .shadow(radius: 5)
                
                Text(drinkName)
                    .font(.body).bold()
            }
            .padding(.vertical, 5)
            .sheet(isPresented: $isSheetDisplayed) {
                //SECOND SCREEN
                 
                ForEach(drinkDetail.drinkDetail, id: \.idDrink) { drink in
                    AsyncImage(url: drink.strDrinkThumb, content: { image in
                                        image.resizable()
                                                 .aspectRatio(contentMode: .fit)
                                                 .frame(maxWidth: 300)
                                        }, placeholder: {
                                            ProgressView()
                                        })
                    .cornerRadius(25)
                    .shadow(radius: 5)
                    .padding()
                    
                    Text(drink.strDrink)
                        .font(.title).bold()
                        .padding()
                    
                    Text("Instructions: ")
                    Text(drink.strInstructions)
                        .font(.caption)
                    
                    Text("Ingriedents:")
                    ForEach(1...15) {i in
                        Text(drink.strIngredient)
                        Text(drink.strIngredient2)
                        Text(drink.strIngredient3)
                    }


                    
                    Spacer()
                    
                }
                .padding()
                .task {
                    await drinkDetail.displayDrinkDetail(drinkID: drinkIDs)
                }
            }
        }
    }
}
