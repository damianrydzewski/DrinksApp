//
//  DrinkObjectView.swift
//  DrinksApp
//
//  Created by Damian on 16/07/2022.
//

import SwiftUI

struct DrinkView: View {
    @StateObject var drinkDetailVM = DrinkListViewModel()
    @State private var isSheetDisplayed = false
    
    var drinkThumb: URL
    var drinkName: String
    var drinkIDs: String

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
                ForEach(drinkDetailVM.drinkDetail, id: \.idDrink) { drink in
                    ScrollView {
                        VStack {
                            Capsule()
                                .foregroundColor(.secondary)
                                .opacity(0.5)
                                .frame(width: 35, height: 5)
                                .padding(5)
                            
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
                            
                            Text(drink.strInstructions)
                                .font(.caption)
                                .padding(.horizontal)
                            
                            Text("Ingredients")
                                .font(.title2)
                                .padding(.top, 5)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    Group {
                                        VStack {
                                            Text(drink.strIngredient1)
                                                .bold()
                                            Text(drink.strMeasure1)
                                        }
                                        
                                        VStack {
                                            Text(drink.strIngredient2)
                                                .bold()
                                            Text(drink.strMeasure2)
                                        }
                                        
                                        VStack {
                                            Text(drink.strIngredient3)
                                                .bold()
                                            Text(drink.strMeasure3)
                                        }
                                        
                                        VStack {
                                            Text(drink.strIngredient4)
                                                .bold()
                                            Text(drink.strMeasure4)
                                        }
                                        
                                        VStack {
                                            Text(drink.strIngredient5)
                                                .bold()
                                            Text(drink.strMeasure5)
                                        }
                                        
                                        VStack {
                                            Text(drink.strIngredient6)
                                                .bold()
                                            Text(drink.strMeasure6)
                                        }
                                        
                                        VStack {
                                            Text(drink.strIngredient7)
                                                .bold()
                                            Text(drink.strMeasure7)
                                        }
                                        
                                        VStack {
                                            Text(drink.strIngredient8)
                                                .bold()
                                            Text(drink.strMeasure8)
                                        }
                                        
                                        VStack {
                                            Text(drink.strIngredient9)
                                                .bold()
                                            Text(drink.strMeasure9)
                                        }
                                    }
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .background(Color("LightGray"))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .shadow(radius: 2)
                                }
                                
                                .padding(10)
                            }
                        }
                    }
                }
                .task {
                    await drinkDetailVM.getDrinkDetail(drinkID: drinkIDs)
                }
            }
        }
    }
}
