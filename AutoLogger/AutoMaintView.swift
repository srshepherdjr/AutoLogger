//
//  ContentView.swift
//  AutoLogger
//
//  Created by Steven Shepherd on 11/8/25.
//

import SwiftUI

struct AutoMaintView: View {
    
    @EnvironmentObject var viewModel: MyViewModel
    @State private var showingAlert = false
    @State private var selectedTab = "gaslist"
    @State private var path = NavigationPath()
    
//    @StateObject var mycarModel = MyCarModel()
    let car: AutoCar
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CarGasView(car: car)
                .tabItem {
                    Label("Fuel", systemImage: "fuelpump")
                }
                .tag("gaslist")
            Text("Maintenance log")
                .tabItem {
                    Label("Maint", systemImage: "wrench.and.screwdriver")
                }
                .tag("maintenancelog")

            Text("Edit car details")
                .tabItem {
                    Label("Edit Car", systemImage: "pencil")
                }
                .tag("editcardetails")
        }
        .navigationTitle("\(car.modelYear) " + car.carMake + " " + car.carModel)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print("Child View button tapped!")
                    viewModel.isNewCarGas.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    let carModel = AutoCar(id: 1, userId: 1, modelYear: 2020, carMake: "Toyota", carModel: "Camry", active: true)
    AutoMaintView(car: carModel)
}
