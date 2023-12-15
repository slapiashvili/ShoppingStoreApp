//
//  ContentView.swift
//  GroceryApp
//
//  Created by Salome Lapiashvili on 11.12.23.
//

import SwiftUI


#warning("MARK-ები აქაც დაწერე ჩვეულებრივ როგორც UIKit-ში წერ")
struct ContentView: View {
    @ObservedObject var viewModel = GroceryViewModel()

    #warning("body-ში გაქვს ძალიან ბევრი view ჩალაგებული, შესაბამისად რთული წასაკითხია, აჯობებს რომ body პატარ პატარა view-ებად დაყო ცვლადების სახით მაგ: private var tryDiscount: some View { და აქ გაიტანო შენი HStack-ი და იმ ადგილას უბრალოდ ცვლადის სახელს დაწერ, ხოლო თუ შენს view-ს ჭირდება რაიმე ცვლადი დასახატად მაშინ შეგიძლია გააკეთო ფუნქცია იქ გადააწოდო და ფუნქცია დააბრუნებს some View-ს")
    var body: some View {
        NavigationView {
            VStack {
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
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

