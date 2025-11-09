//
//  Untitled.swift
//  Maintenance Logger
//
//  Created by Steven Shepherd on 11/7/25.
//

import Foundation

struct AutoCar: Codable, Identifiable, Hashable {
    let id: Int
    let userId: Int
    let modelYear: Int
    let carMake: String
    let carModel: String
    let active: Bool
}

struct AutoCarGas: Codable, Identifiable, Hashable {
    let id: Int
    let idmycar: Int
    let cargasdate: String
    let carmilesstart: Int
    let carmilesend: Int
    let carmilesnet: Int
    let cargals: Double
    let cargasprice: Double?
}

enum MLAPIErrors: Error {
    case invalidURL
    case invalidAPIResponse
    case InvalidAPIData
}
