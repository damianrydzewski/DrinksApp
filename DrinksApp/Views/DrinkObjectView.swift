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
    @State private var truu = false
    var body: some View {
        Button {
            truu.toggle()
        } label: {
            HStack (spacing: 20){
                AsyncImage(url: urlString, content: { image in
                                    image.resizable()
                                             .aspectRatio(contentMode: .fit)
                                             .frame(maxWidth: 100)
                                    }, placeholder: {
                                        ProgressView()
                                    })
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .shadow(radius: 5)
                
                Text(drinkName)
                    .font(.body).bold()
            }
            .padding(.vertical, 5)
            .sheet(isPresented: $truu) {
                Text("Drink")
            }
        }
    }
}
