//
//  CarGasRow.swift
//  AutoLogger
//
//  Created by Steven Shepherd on 11/8/25.
//
import SwiftUI
import Foundation

struct CarGasRowView: View {
    @EnvironmentObject var vm: MyViewModel
    let item: AutoCarGas
    let selectedCar: AutoCar
    
    var body: some View {
        NavigationLink(destination: GasView(gas: item, car: selectedCar)) {
            HStack {
                Text ( item.cargasdate )
                    .padding(5)
                //.formatted(date: .short, time: .omitted)
                Text ("\(item.cargals, format: .number.precision(.fractionLength(2))) gal")
                    .padding(5)
                Text ("@ " + (item.cargasprice?.formatted(.currency(code: "USD")) ?? "0.00"))
                    .padding(5)
                Color.clear // Or any color, or a Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Make it fill the available space
                    .contentShape(Rectangle()) // Ensures the entire area is tappable
                    .onTapGesture {
                        vm.selectedCarGas = item
                        vm.isShowingDetails.toggle()
                        print("whitespace tapped; isShowingDetails: \(vm.isShowingDetails)")
                        // Perform your desired action here
                }
            }
        }
//        NavigationLink(destination: DetailView(), isActive: $showDetailView) {
//            EmptyView() // The NavigationLink itself is hidden
//        }
//        .onTapGesture {
//            vm.selectedCarGas = item
//            vm.isShowingDetails.toggle()
//            print(vm.selectedCarGas!)
//            print(selectedCar)
////            GasView(gas: vm.selectedCarGas!, car: selectedCar)
//            print("row tapped; isShowingDetails: \(vm.isShowingDetails)")
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
    let gas = AutoCarGas(id: 14, idmycar: 1, cargasdate: "2025-11-08", carmilesstart: Int(10.00), carmilesend: Int(3.50), carmilesnet: 1000, cargals: 1300, cargasprice: 300)
    let selectedCar = AutoCar(id: 1, userId: 1, modelYear: 2020, carMake: "Corolla", carModel: "Toyota", active: true)
    CarGasRowView(item: gas, selectedCar: selectedCar)
        .environmentObject(MyViewModel())
}
