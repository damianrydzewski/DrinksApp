//
//  DrinkObjectView.swift
//  DrinksApp
//
//  Created by Damian on 16/07/2022.
//

import SwiftUI

struct DrinkObjectView: View {
    var urlString: URL
    var drinkName: String
    
    @State private var isSheetDisplayed = false
    
    var body: some View {
        Button {
            isSheetDisplayed.toggle()
        } label: {
            HStack (spacing: 20){
                AsyncImage(url: urlString, content: { image in
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
                VStack {
                    AsyncImage(url: urlString, content: { image in
                                        image.resizable()
                                                 .aspectRatio(contentMode: .fit)
                                                 .frame(maxWidth: 300)
                                        }, placeholder: {
                                            ProgressView()
                                        })
                    .cornerRadius(25)
                    
                    Text(drinkName)
                        .font(.title).bold()
                    
                    Spacer()
                }
                .task P
            }
        }
    }
}
