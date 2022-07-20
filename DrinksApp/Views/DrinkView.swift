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
                ImageURL(url: drinkThumb)
                //add here properties
                                             // image.resizable()
                                             //.aspectRatio(contentMode: .fit)
                                            // .frame(maxWidth: 80)
                
                
//                 AsyncImage(url: drinkThumb, content: { image in
//                                     image.resizable()
//                                              .aspectRatio(contentMode: .fit)
//                                              .frame(maxWidth: 80)
//                                     }, placeholder: {
//                                         ProgressView()
//                                     })
//                 .clipShape(Circle())
//                 .shadow(radius: 5)
                
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
                                
                                  
//                                    .foregroundColor(.black)
//                                    .padding(10)
//                                    .background(Color("LightGray"))
//                                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                                    .shadow(radius: 5)
                                
                                
//                                .padding(10)
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
