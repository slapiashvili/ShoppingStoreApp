//
//  ContentView.swift
//  GroceryApp
//
//  Created by Salome Lapiashvili on 11.12.23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: properties
    @ObservedObject var viewModel = GroceryViewModel()

    // MARK: - Header View
    private var headerView: some View {
        HStack {
            Image(systemName: "line.3.horizontal")
                .font(.title)
            Spacer()
            NavigationLink(destination: CartView(viewModel: viewModel)) {
                Image(systemName: "cart")
                    .font(.title)
            }
            .padding()
        }
        .padding()
        .background(
            Rectangle()
                .ignoresSafeArea(.all, edges: .top)
                .foregroundColor(Color("almostGreen"))
        )
    }

    // MARK: - Welcome View
    private var welcomeView: some View {
        HStack {
            VStack() {
                VStack(alignment: .center, spacing: 2) {
                    Text("Welcome to")
                        .font(.title)
                    Text("Sami Nabiji")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("coolGreen"))
                }

                Text("Find everything you need")
                    .font(.subheadline)
            }
            .padding()

            Spacer()

            Image("sami.nabiji.logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
        }
        .padding(.horizontal, 30)
    }

    // MARK: - Discount View
    private var discountView: some View {
        HStack {
            Text("Try a pro discount")
                .font(.headline)
            Image(systemName: "arrow.right")
                .font(.headline)
                .foregroundColor(.green)
                .padding(.trailing, 5)

            Button(action: {
                // TODO: Add action for the discount
            }) {
                Text("Show 20% off")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.green)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
            }
        }
        .padding()
    }

    // MARK: - Product Grid View
    private var productGridView: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                ForEach(viewModel.products) { product in
                    ProductView(viewModel: viewModel, product: product)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.almostGreen, lineWidth: 1)
                        )
                        .onTapGesture {
                            viewModel.addToCart(product: product)
                        }
                }
            }
            .padding(16)
        }
        .navigationBarHidden(true)
    }

    // MARK: - Body View
    var body: some View {
        NavigationView {
            VStack {
                headerView
                welcomeView
                discountView
                productGridView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

