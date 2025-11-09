//
//  ContentView.swift
//  AutoLogger
//
//  Created by Steven Shepherd on 11/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    @StateObject var viewModel = MyViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding(10)

            .padding(5)
            Text("Maintenance Logger")
            NavigationStack {
                List(viewModel.items) { item in
                    NavigationLink("\(item.modelYear)" + " " + item.carMake + " " + item.carModel, value: item)
//                    { AutoMaintView(car:item) }
//                    label: {
//                            VStack() {
//                             Text("\(item.modelYear)" + " " + item.carMake )
//                                Text(item.carModel)
//                            }
//                        }
                }
                .navigationDestination(for: AutoCar.self) { item in
                    AutoMaintView(car: item)
                }
            }
//            NavigationView {
//                List(viewModel.items) { item in
//                        VStack(alignment: .leading) {
//                            HStack() {
//                                VStack(alignment: .leading) {
//                                    Text("\(item.modelYear) " + item.carMake)
//                                        .font(.headline)
//                                    Text(item.carModel)
//                                        .font(.subheadline)
//                                        .foregroundColor(.gray)
//                                }
//                                Spacer()
//
//                            }
//                        }
//                }
//                .navigationTitle("My Cars")
//
                .onAppear {
                    viewModel.fetchItems()
                }
//            }
            .background() {
                Rectangle()
                    .foregroundStyle(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 15)
            }
            .padding()
            Button("Show Alert") {
                showingAlert = true
            }
            .alert("Important Message", isPresented: $showingAlert) {
                Button("OK") {
                    // Handle OK button tap
                    print("OK tapped")
                }
                Button("Cancel", role: .cancel) {
                    // Handle Cancel button tap
                    print("Cancel tapped")
                }
            } message: {
                Text("Please read this message carefully.")
            }
            Button("Quit") {
                exit(0)
            }
        }
    }
}

#Preview {
    ContentView()
}
