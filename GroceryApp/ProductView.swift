//
//  ProductView.swift
//  GroceryApp
//
//  Created by Salome Lapiashvili on 11.12.23.
//

import SwiftUI


struct ProductView: View {
    @ObservedObject var viewModel: GroceryViewModel
    let product: ProductViewModel
    
    var body: some View {
        VStack {
            Text("$\(String(format: "%.2f", product.price))")
                .font(.headline)
                .foregroundColor(.coolGreen)
                .bold()

            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 90)

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
        .padding(5)
    }
}
