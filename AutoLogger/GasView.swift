//
//  GasView.swift
//  AutoLogger
//
//  Created by Steven Shepherd on 11/9/25.
//

import SwiftUI

struct GasView: View {
    @EnvironmentObject var viewModel: MyViewModel
    @Environment(\.dismiss) private var dismiss // moved dismiss functionality here
    @State private var path = NavigationPath()
    @State var isEditing: Bool = true
    @State var gas: AutoCarGas
    @State private var myNumber: Int? = 0
    
    @FocusState private var focusField: Field?
    
    enum Field {
        case gasDate, startMiles, endMiles, netMiles, gallons, pricePerGallon
    }

    let car: AutoCar
    
    var body: some View {
        Text("\(car.modelYear) " + car.carMake + " " + car.carModel)
        Form {
            Section(header: Text("Fill up details")) {
                HStack {
                    Text("ID")
                    Spacer()
                    Text("\(gas.id)")
                }
                HStack {
                    Text("Date")
                    Spacer()
                    if isEditing {
                        TextField("Pick a date.", text: $gas.cargasdate)
                            .focused($focusField, equals: .gasDate)
                            .submitLabel(.next)
                            .onSubmit {
                                focusField = .startMiles
                            }
                    } else {
                        Text(gas.cargasdate)
                    }
                }
                HStack {
                    Text("Start miles")
                    Spacer()
                    if isEditing {
                        TextField("Start miles", value: $gas.carmilesstart, formatter: Self.numberFormatter)
                        #if os(iOS)
                            .keyboardType(.numberPad) // Suggests a numeric keyboard
//                            .border(Color.gray)
//                            .focused($focusField, equals: .startMiles)
                            .submitLabel(.next)
                            .onSubmit {
                                focusField = .endMiles
                            }
                        #endif
                    } else {
                        Text("\(gas.carmilesstart)")
                    }
                }
                HStack {
                    Text("Start end")
                    Spacer()
                    if isEditing {
                        TextField("End miles", value: $gas.carmilesend, formatter: Self.numberFormatter)
                        #if os(iOS)
                            .keyboardType(.numberPad) // Suggests a numeric keyboard
//                            .border(Color.gray)
//                            .focused($focusField, equals: .endMiles)
                            .submitLabel(.next)
                            .onSubmit {
                                focusField = .netMiles
                            }
                        #endif
                    } else {
                        Text("\(gas.carmilesend)")
                    }
                }
                HStack {
                    Text("Start net")
                    Spacer()
                    if isEditing {
                        TextField("Net miles", value: $gas.carmilesnet, formatter: Self.numberFormatter)
                        #if os(iOS)

                            .keyboardType(.numberPad) // Suggests a numeric keyboard
//                            .border(Color.gray)
//                            .focused($focusField, equals: .netMiles)
                            .submitLabel(.next)
                            .onSubmit {
                                focusField = .gallons
                            }
                        #endif
                    } else {
                        Text("\(gas.carmilesnet)")
                    }
                }
                HStack {
                    Text("Gallons")
                    Spacer()
                    if isEditing {
                        TextField("Gallons", value: $gas.cargals, formatter: Self.numberFormatter)
                        #if os(iOS)
                            .keyboardType(.numberPad) // Suggests a numeric keyboard
//                            .border(Color.gray)
//                            .focused($focusField, equals: .gallons)
                            .submitLabel(.next)
                            .onSubmit {
                                focusField = .pricePerGallon
                            }
                        #endif
                    } else {
                        Text(gas.cargals.formatted())
                    }
                }
                HStack {
                    Text("Price / gal")
                    Spacer()
                    if isEditing {
                        TextField("Price / gal", value: $gas.cargasprice, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        #if os(iOS)
                            .keyboardType(.numberPad) // Suggests a numeric keyboard
//                            .border(Color.gray)
//                            .focused($focusField, equals: .pricePerGallon)
                            .submitLabel(.done)
                            .onSubmit {
                                focusField = nil
                                SubmitForm()
                            }
                    #endif
                    } else {
                        Text(gas.cargasprice?.formatted(.currency(code: "USD")) ?? "0.00")
                    }
                }
//                Spacer()
//                HStack {
//                    Spacer()
//                    Button("Save") {
//                        dismiss()
//                    }
//                    Button("Back") {
//                        dismiss()
//                    }
//                }
            }
        }
    }
    // Static NumberFormatter for efficiency
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0 // For integers
        return formatter
    }()
    
    private func SubmitForm() {
        print("Form submitted")
    }
}

#Preview {
    let gas = AutoCarGas(id: 1, idmycar: 1, cargasdate: "2025-11-09", carmilesstart: 10000, carmilesend: 10300, carmilesnet: 300, cargals: 10.349, cargasprice: 3.49)
    let carModel = AutoCar(id: 14, userId: 1, modelYear: 2020, carMake: "Toyota", carModel: "Camry", active: true)
    GasView(gas: gas, car: carModel)
}
