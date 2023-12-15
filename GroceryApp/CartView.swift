//
//  CartView.swift
//  GroceryApp
//
//  Created by Salome Lapiashvili on 11.12.23.
//

import SwiftUI

#warning("აქაც ყველაფერი იგივე რაც ContentView-ში")
struct CartView: View {
    @ObservedObject var viewModel: GroceryViewModel

    var body: some View {
        VStack {
            Text("Cart")
                .font(.title)
                .bold()
                .foregroundColor(Color("samiNabijiGreen"))

            List {
                ForEach(viewModel.cart.keys.sorted(by: { $0 < $1 }), id: \.self) { productName in
                    if let quantity = viewModel.cart[productName], let product = viewModel.products.first(where: { $0.name == productName }) {
                        CartItemView(product: product, quantity: quantity, viewModel: viewModel)
                    }
                }
            }

            HStack {
                Button(action: {
                    // TODO: Add logic for checkout
                }) {
                    Text("Checkout")
                        .font(.headline)
                        .foregroundColor(Color("samiNabijiGreen"))
                }

                Spacer()

                Text("Total: $\(String(format: "%.2f", viewModel.totalCartPrice()))")
                    .font(.headline)
            }
            .padding()
        }
    }
}







