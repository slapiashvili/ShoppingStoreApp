//
//  CartView.swift
//  GroceryApp
//
//  Created by Salome Lapiashvili on 11.12.23.
//

import SwiftUI

struct CartView: View {
    
    // MARK: -properties
    @ObservedObject var viewModel: GroceryViewModel

    // MARK: - Header View
    private var headerView: some View {
        Text("Cart")
            .font(.title)
            .bold()
            .foregroundColor(Color("samiNabijiGreen"))
    }

    // MARK: - Cart Items List View
    private var cartItemsListView: some View {
        List {
            ForEach(viewModel.cart.keys.sorted(by: { $0 < $1 }), id: \.self) { productName in
                if let quantity = viewModel.cart[productName], let product = viewModel.products.first(where: { $0.name == productName }) {
                    CartItemView(product: product, quantity: quantity, viewModel: viewModel)
                }
            }
        }
    }

    // MARK: - Checkout View
    private var checkoutView: some View {
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

    // MARK: - Body View
    var body: some View {
        VStack {
            headerView
            cartItemsListView
            checkoutView
        }
    }
}








