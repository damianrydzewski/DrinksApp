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

                
            }
        }
    }
}
