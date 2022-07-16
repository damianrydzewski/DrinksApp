//
//  Webservice.swift
//  DrinksApp
//
//  Created by Damian on 15/07/2022.
//

import Foundation


enum NetworkError: Error {
    case badURL
    case badRequest
}

class Webservice {
    
    
    func getDrinks(searchTerm: String) async throws -> [Drink] {
        
        guard let url = URL(string: "https://thecocktaildb.com/api/json/v1/1/filter.php?i=\(searchTerm.trimmed())") else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
    
        guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {throw NetworkError.badRequest}

        
        let drinkResponse = try? JSONDecoder().decode(DrinkResponse.self, from: data)
        return drinkResponse?.drinks ?? []
    }
}