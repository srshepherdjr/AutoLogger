//
//  CarGasRow.swift
//  AutoLogger
//
//  Created by Steven Shepherd on 11/8/25.
//
import SwiftUI
import Foundation

struct CarGasView: View {
    @StateObject var viewModel = MyViewModel()
//    @State private var path = NavigationPath()
    let car: AutoCar

    var body: some View {
//        NavigationStack() {
            List(viewModel.gasList) { item in
                NavigationLink{
                } label: {
                    HStack {
                        Text ( item.cargasdate )
                        //.formatted(date: .short, time: .omitted)
                        Spacer()
                        Text ("\(item.cargals, format: .number.precision(.fractionLength(2))) gal")
                        Text ("@ " + (item.cargasprice?.formatted(.currency(code: "USD")) ?? "0.00"))
                        
                    }
                }
            }
            .onAppear {
                viewModel.fetchCarGasItems(id: car.id)
            }
//            .navigationDestination(for: AutoCarGas.self) { item in
//                GasView(gas: item, car: car)
//            }
//        }

   }
    func stringToDate(dateString: String, format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        // It's often recommended to set a fixed locale for consistent parsing,
        // especially for specific date string formats like ISO 8601.
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: dateString)
    }
}

#Preview {
    let carModel = AutoCar(id: 14, userId: 1, modelYear: 2020, carMake: "Toyota", carModel: "Camry", active: true)
    CarGasView(car: carModel)
}
