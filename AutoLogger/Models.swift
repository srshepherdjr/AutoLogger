//
//  Untitled.swift
//  Maintenance Logger
//
//  Created by Steven Shepherd on 11/7/25.
//

struct AutoCar: Codable, Identifiable {
    let id: Int
    let userId: Int
    let modelYear: Int
    let carMake: String
    let carModel: String
    let active: Bool
}

enum MLAPIErrors: Error {
    case invalidURL
    case invalidAPIResponse
    case InvalidAPIData
}
