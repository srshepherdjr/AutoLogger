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
    @State private var path = NavigationPath()
    
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
            CarGasView(car: car)
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
    }
}

#Preview {
    let carModel = AutoCar(id: 1, userId: 1, modelYear: 2020, carMake: "Toyota", carModel: "Camry", active: true)
    AutoMaintView(car: carModel)
}
