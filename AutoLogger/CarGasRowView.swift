//
//  CarGasRow.swift
//  AutoLogger
//
//  Created by Steven Shepherd on 11/8/25.
//
import SwiftUI
import Foundation

struct CarGasRowView: View {
//    @StateObject var viewModel = MyViewModel()
    //@Environment(MyViewModel.self)
    @StateObject var vm = MyViewModel()
    let item: AutoCarGas

    var body: some View {
            HStack {
                Text ( item.cargasdate )
                //.formatted(date: .short, time: .omitted)
                Spacer()
                Text ("\(item.cargals, format: .number.precision(.fractionLength(2))) gal")
                Text ("@ " + (item.cargasprice?.formatted(.currency(code: "USD")) ?? "0.00"))
                
            }
            .onTapGesture {
                vm.selectedCarGas = item
                vm.isShowingDetails.toggle()
                print("row tapped; isShowingDetails: \(vm.isShowingDetails)")
            }
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
    CarGasRowView(item: gas)
}
