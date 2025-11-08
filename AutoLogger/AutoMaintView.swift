//
//  ContentView.swift
//  AutoLogger
//
//  Created by Steven Shepherd on 11/8/25.
//

import SwiftUI

struct AutoMaintView: View {
    
    @State private var showingAlert = false
    @StateObject var mycarModel = MyCarModel()
    
    var body: some View {
        VStack {
            Text("Maintenance Logger")
            VStack(alignment: .leading) {
                HStack() {
                    VStack(alignment: .leading) {
                        Text("\(mycarModel.myCar.modelYear) " + mycarModel.myCar.carMake)
                            .font(.headline)
                        Text(mycarModel.myCar.carModel)
                            .font(.subheadline)
                            .foregroundColor(.gray)

                    }
                }
            }
            HStack {
                Image(systemName: "fuelpump")
                    .padding(5)
                Image(systemName: "wrench.and.screwdriver")
                    .padding(5)
                Image(systemName: "pencil")

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
        }
    }
}

#Preview {
    AutoMaintView()
}
