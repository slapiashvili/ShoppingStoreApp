//
//  CartItemView.swift
//  GroceryApp
//
//  Created by Salome Lapiashvili on 16.12.23.
//

import SwiftUI

struct CartItemView: View {
    
    // MARK: -properties
    let product: ProductModel
    let quantity: Int
    @ObservedObject var viewModel: GroceryViewModel

    // MARK: - Product Image View
    private var productImageView: some View {
        Image(product.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 40)
    }

    // MARK: - Product Details View
    private var productDetailsView: some View {
        VStack(alignment: .leading) {
            Text(product.name)
                .font(.headline)

            Text("$\(String(format: "%.2f", product.price))")
                .font(.subheadline)
        }
    }

    // MARK: - Quantity View
    private var quantityView: some View {
        Text("Quantity: \(quantity)")
    }

    // MARK: - Remove Button
    private var removeButton: some View {
        Button(action: {
            viewModel.removeFromCart(productName: product.name)
        }) {
            Image(systemName: "trash")
                .foregroundColor(.red)
        }
    }

    // MARK: - Body View
    var body: some View {
        HStack {
            productImageView
            productDetailsView
            Spacer()
            quantityView
            removeButton
        }
    }
}
