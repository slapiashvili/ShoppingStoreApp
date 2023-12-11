//
//  ViewModel.swift
//  GroceryApp
//
//  Created by Salome Lapiashvili on 11.12.23.
//

import SwiftUI

class GroceryViewModel: ObservableObject {
    @Published var products: [ProductViewModel] = []
    @Published var showAlert: Bool = false
    @Published var cart: [String: Int] = [:]
    @Published var discountedProductIndices: Set<String> = []

    
    init() {
        products = [
            ProductViewModel(id: 0, name: "Orange", quantityInStock: 10, price: 2.5, image: "orange.image"),
            ProductViewModel(id: 1, name: "Apple", quantityInStock: 15, price: 1.5, image: "apple.image"),
            ProductViewModel(id: 2, name: "Banana", quantityInStock: 20, price: 1.0, image: "banana.image"),
            ProductViewModel(id: 3, name: "Grapes", quantityInStock: 12, price: 3.0, image: "grapes.image"),
            ProductViewModel(id: 4, name: "Pomegranate", quantityInStock: 8, price: 4.0, image: "pomegranate.image"),
            ProductViewModel(id: 5, name: "Mango", quantityInStock: 18, price: 2.8, image: "mango.image"),
            ProductViewModel(id: 6, name: "Strawberry", quantityInStock: 25, price: 2.2, image: "strawberry.image"),
            ProductViewModel(id: 7, name: "Pineapple", quantityInStock: 10, price: 3.5, image: "pineapple.image")
        ]
    }

    
    func addToCart(product: ProductViewModel) {
        let productName = product.name

        if let quantity = cart[productName] {
            if quantity < product.quantityInStock {
                cart[productName] = quantity + 1
            } else {
                showAlert = true
            }
        } else {
            // Handle the case where the product name is not found in the cart
        }
    }



    func cartQuantity(for productName: String) -> Int {
        cart[productName] ?? 0
    }



        func removeFromCart(productName: String) {
            guard let quantity = cart[productName], quantity > 0 else {
                return
            }

            cart[productName] = quantity - 1

            if cart[productName] == 0 {
                cart.removeValue(forKey: productName)
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

//    func applyDiscount(for productIndex: Int) {
//            if !discountedProductIndices.contains(productIndex) {
//                products[productIndex].price *= 0.8
//                discountedProductIndices.insert(productIndex)
//            }
//        }
//
//        func discountedPrice(for productIndex: Int) -> Double? {
//            let originalPrice = products[productIndex].price
//            let discountedPrice = originalPrice * 0.8
//            return discountedPrice
//        }
    }

struct ProductViewModel: Identifiable {
    let id: Int
    let name: String
    let quantityInStock: Int
    var price: Double
    let image: String
}



