//
//  CarGasRow.swift
//  AutoLogger
//
//  Created by Steven Shepherd on 11/8/25.
//
import SwiftUI
import Foundation

struct CarGasView: View {
    @StateObject private var viewModel = MyViewModel()
//    @Environment(MyViewModel.self) var viewModel: MyViewModel
//    @State private var path = NavigationPath()
    let car: AutoCar
    var selected: AutoCarGas?
    
    var body: some View {
            List(viewModel.gasList) { item in
                    CarGasRowView(item: item)
            }
//        VStack {
//            List(viewModel.gasList) { item in
//                    CarGasRowView(item: item)
//                HStack {
//                    Text ( item.cargasdate )
//                    Spacer()
//                    Text ("\(item.cargals, format: .number.precision(.fractionLength(2))) gal")
//                    Text ("@ " + (item.cargasprice?.formatted(.currency(code: "USD")) ?? "0.00"))
//                }
//            }
//            .onAppear {
//                viewModel.fetchCarGasItems(id: car.id)
//            }
//            .sheet(isPresented: $viewModel.isShowingDetails) {
//                GasView(gas: viewModel.selectedCarGas!, car: car)
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
