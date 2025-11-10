//
//  AutoLoggerApp.swift
//  AutoLogger
//
//  Created by Steven Shepherd on 11/8/25.
//

import SwiftUI

@main
struct AutoLoggerApp: App {
    @StateObject var servicesAPI = MyViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(servicesAPI)
        }
    }
}
