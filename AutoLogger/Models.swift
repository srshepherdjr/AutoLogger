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
    var idmycar: Int
    var cargasdate: String
    var carmilesstart: Int
    var carmilesend: Int
    var carmilesnet: Int
    var cargals: Double
    var cargasprice: Double?
}

enum MLAPIErrors: Error {
    case invalidURL
    case invalidAPIResponse
    case InvalidAPIData
}
