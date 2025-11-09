//
//  ContentView.swift
//  AutoLogger
//
//  Created by Steven Shepherd on 11/8/25.
//

import SwiftUI

struct AutoMaintView: View {
    
    @State private var showingAlert = false
    @State private var selectedTab = "gaslist"
    
//    @StateObject var mycarModel = MyCarModel()
    let car: AutoCar
    
    var body: some View {
        VStack {
            Text("Maintenance Logger")
            VStack {
                Text("\(car.modelYear) " + car.carMake)
                    .font(.headline)
                Text(car.carModel)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                }
        }
        TabView(selection: $selectedTab) {
            Text("Gas list")
                .tabItem {
                    Label("One", systemImage: "fuelpump")
                }
                .tag("gaslist")
            Text("Maintenance log")
                .tabItem {
                    Label("Two", systemImage: "wrench.and.screwdriver")
                }
                .tag("maintenancelog")
            Text("Edit car details")
                .tabItem {
                    Label("Three", systemImage: "pencil")
                }
                .tag("editcardetails")
        }

        
//            //            HStack {
////                Image(systemName: "fuelpump")
////                    .padding(5)
////                Image(systemName: "wrench.and.screwdriver")
////                    .padding(5)
////                Image(systemName: "pencil")
////
////            }
//
//            .padding()
//            Button("Show Alert") {
//                showingAlert = true
//            }
//            .alert("Important Message", isPresented: $showingAlert) {
//                Button("OK") {
//                    // Handle OK button tap
//                    print("OK tapped")
//                }
//                Button("Cancel", role: .cancel) {
//                    // Handle Cancel button tap
//                    print("Cancel tapped")
//                }
//            } message: {
//                Text("Please read this message carefully.")
//            }
//        }

    }
}

#Preview {
    let carModel = AutoCar(id: 1, userId: 1, modelYear: 2020, carMake: "Toyota", carModel: "Camry", active: true)
    AutoMaintView(car: carModel)
}
