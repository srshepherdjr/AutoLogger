//
//  GasView.swift
//  AutoLogger
//
//  Created by Steven Shepherd on 11/9/25.
//

import SwiftUI

struct GasView: View {
    @State var viewModel = MyViewModel()
    @State private var path = NavigationPath()
    let gas: AutoCarGas
    let car: AutoCar
//    @State private var path: NavigationPath()
    
    var body: some View {
        Text("Hello, World!")
        Text("\(car.modelYear) " + car.carMake + " " + car.carModel)
        Form {
            HStack {
                Text("ID")
                Spacer()
                Text("\(gas.id)")
            }
            HStack {
                Text("Date")
                Spacer()
                Text(gas.cargasdate)
            }
            HStack {
                Text("Start miles")
                Spacer()
                Text("\(gas.carmilesstart)")
            }
            HStack {
                Text("Start end")
                Spacer()
                Text("\(gas.carmilesend)")
            }
            HStack {
                Text("Start net")
                Spacer()
                Text("\(gas.carmilesnet)")
            }
            HStack {
                Text("Gallons")
                Spacer()
                Text(gas.cargals.formatted())
            }
            HStack {
                Text("Price / gal")
                Spacer()
                Text(gas.cargasprice?.formatted(.currency(code: "USD")) ?? "0.00")
            }
            Spacer()
            HStack {
                Spacer()
                Button("Save") {
                    
                }
                Button("Back") {
                    
                }
            }
        }
    }
}

#Preview {
    let gas = AutoCarGas(id: 1, idmycar: 1, cargasdate: "2025-11-09", carmilesstart: 10000, carmilesend: 10300, carmilesnet: 300, cargals: 10.349, cargasprice: 3.49)
    let carModel = AutoCar(id: 14, userId: 1, modelYear: 2020, carMake: "Toyota", carModel: "Camry", active: true)
    GasView(gas: gas, car: carModel)
}
