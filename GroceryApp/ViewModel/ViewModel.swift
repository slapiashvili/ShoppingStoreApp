//
//  ViewModel.swift
//  GroceryApp
//
//  Created by Salome Lapiashvili on 11.12.23.
//

import SwiftUI

final class GroceryViewModel: ObservableObject {
    
    // MARK: -properties

    @Published var products: [ProductModel] = []
    @Published var cart: [String: Int] = [:]

    init() {
        products = [
            ProductModel(id: 0, name: "Orange", quantityInStock: 10, price: 2.5, image: "orange.image"),
            ProductModel(id: 1, name: "Apple", quantityInStock: 15, price: 1.5, image: "apple.image"),
            ProductModel(id: 2, name: "Banana", quantityInStock: 20, price: 1.0, image: "banana.image"),
            ProductModel(id: 3, name: "Grapes", quantityInStock: 12, price: 3.0, image: "grapes.image"),
            ProductModel(id: 4, name: "Pomegranate", quantityInStock: 8, price: 4.0, image: "pomegranate.image"),
            ProductModel(id: 5, name: "Mango", quantityInStock: 18, price: 2.8, image: "mango.image"),
            ProductModel(id: 6, name: "Strawberry", quantityInStock: 25, price: 2.2, image: "strawberry.image"),
            ProductModel(id: 7, name: "Pineapple", quantityInStock: 10, price: 3.5, image: "pineapple.image")
        ]
    }
    
    // MARK: -methods
    func addToCart(product: ProductModel) {
        let productName = product.name

        if let quantity = cart[productName] {
            if quantity < product.quantityInStock {
                cart[productName] = quantity + 1
            }
        } else {
            cart[productName] = 1
        }
    }

    func cartQuantity(for productName: String) -> Int {
        cart[productName] ?? 0
    }

    func removeFromCart(productName: String) {
        if let quantity = cart[productName], quantity > 0 {
            cart[productName] = quantity - 1

            if cart[productName] == 0 {
                cart.removeValue(forKey: productName)
            }
        }
    }

    func totalCartPrice() -> Double {
        var total = 0.0
        for (productName, quantity) in cart {
            if let product = products.first(where: { $0.name == productName }) {
                total += product.price * Double(quantity)
            }
        }
        return total
    }
}





