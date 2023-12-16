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
                ProductModel(id: 0, name: "Orange", image: "orange.image", price: 2.5, quantityInStock: 10),
                ProductModel(id: 1, name: "Apple", image: "apple.image", price: 1.5, quantityInStock: 15),
                ProductModel(id: 2, name: "Banana", image: "banana.image", price: 1.0, quantityInStock: 20),
                ProductModel(id: 3, name: "Grapes", image: "grapes.image", price: 3.0, quantityInStock: 12),
                ProductModel(id: 4, name: "Pomegranate", image: "pomegranate.image", price: 4.0, quantityInStock: 8),
                ProductModel(id: 5, name: "Mango", image: "mango.image", price: 2.8, quantityInStock: 18),
                ProductModel(id: 6, name: "Strawberry", image: "strawberry.image", price: 2.2, quantityInStock: 25),
                ProductModel(id: 7, name: "Pineapple", image: "pineapple.image", price: 3.5, quantityInStock: 10)
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
    
    func calculateDiscountedPrice(originalPrice: Double) -> Double {
            let discountPercentage = 0.2
            return originalPrice * (1 - discountPercentage)
    }
    
    func applyDiscount(_ isDiscountApplied: Bool) {
        if isDiscountApplied {
            for index in 0..<products.count {
                let price = products[index].price
                products[index].applyDiscount(0.2)
            }
        } else {
            resetProductPrices()
        }
     
    }

    private func resetProductPrices() {
        for index in 0..<products.count {
            products[index].resetPrice()
        }
    }
}




