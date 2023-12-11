//
//  CartView.swift
//  GroceryApp
//
//  Created by Salome Lapiashvili on 11.12.23.
//

import SwiftUI

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
                    //TODO: add the logic in the future if we have more views
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

struct CartItemView: View {
    let product: ProductViewModel
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


