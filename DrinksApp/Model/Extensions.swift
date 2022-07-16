//
//  Extensions.swift
//  DrinksApp
//
//  Created by Damian on 15/07/2022.
//

import Foundation


extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
