//
//  CartItemView.swift
//  GroceryApp
//
//  Created by Salome Lapiashvili on 16.12.23.
//

import SwiftUI

struct CartItemView: View {
    let product: ProductModel
    let quantity: Int
    @ObservedObject var viewModel: GroceryViewModel

    var body: some View {
        HStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)

            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.headline)

                Text("$\(String(format: "%.2f", product.price))")
                    .font(.subheadline)
            }

            Spacer()

            Text("Quantity: \(quantity)")

            Button(action: {
                viewModel.removeFromCart(productName: product.name)
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
            
        }
    }
}
