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
    let quantityInStock: Int
    var price: Double
    let image: String
}

