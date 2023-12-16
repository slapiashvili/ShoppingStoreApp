//
//  ProductView.swift
//  GroceryApp
//
//  Created by Salome Lapiashvili on 11.12.23.
//

import SwiftUI

struct ProductView: View {
   
    // MARK: -properties
    @ObservedObject var viewModel: GroceryViewModel
    let product: ProductModel

    // MARK: - Price View
    private var priceView: some View {
        let displayPrice: Double
        
        if let discountedPrice = product.discountedPrice {
            displayPrice = discountedPrice
        } else {
            displayPrice = product.price
        }
        
        return Text("$\(String(format: "%.2f", displayPrice))")
            .font(.headline)
            .foregroundColor(.coolGreen)
            .bold()
    }

    // MARK: - Product Image View
    private var productImageView: some View {
        Image(product.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 90)
    }

    // MARK: - Quantity Controls View
    private var quantityControlsView: some View {
        HStack {
            Button(action: {
                viewModel.removeFromCart(productName: product.name)
            }) {
                Image(systemName: "minus.circle")
                    .font(.headline)
                    .foregroundColor(.samiNabijiCream)
            }
            .padding()

            Text("\(viewModel.cartQuantity(for: product.name))")
                .font(.headline)
                .foregroundColor(.white)
                .padding()

            Button(action: {
                viewModel.addToCart(product: product)
            }) {
                Image(systemName: "plus.circle")
                    .font(.headline)
                    .foregroundColor(.samiNabijiCream)
            }
            .padding()
        }
        .background(Color("almostGreen"))
        .cornerRadius(10)
        .padding(1)
    }

    // MARK: - Body View
    var body: some View {
        VStack {
            priceView
            productImageView
            quantityControlsView
        }
        .padding(5)
    }
}
