//
//  ProductModel.swift
//  GroceryApp
//
//  Created by Salome Lapiashvili on 16.12.23.
//

import SwiftUI

struct ProductModel: Identifiable {
    let id: Int
    let name: String
    let image: String
    var price: Double
    var discountedPrice: Double?
    var quantityInStock: Int
}

extension ProductModel {
    mutating func applyDiscount(_ discountPercentage: Double) {
        self.discountedPrice = price * (1 - discountPercentage)
    }

    mutating func resetPrice() {
        self.discountedPrice = nil
    }
}

