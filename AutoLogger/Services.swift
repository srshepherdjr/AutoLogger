import Foundation
internal import Combine
class MyViewModel: ObservableObject {
    @Published var items: [AutoCar] = []
    @Published var gasList: [AutoCarGas] = []
    @Published var selectedCar: AutoCar?
    @Published var selectedCarGas: AutoCarGas?
    @Published var isShowingDetails: Bool = false
    @Published var isNewCarGas: Bool = false
    
    func fetchItems() {
        guard let     url = URL(string: "https://srshepherdjr.ddns.net:8888/api/v1/mycars/findActiveCars") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([AutoCar].self, from: data)
                    DispatchQueue.main.async {
                        self.items = decodedData
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
    
    func fetchCarGasItems(id: Int) {
        guard let     url = URL(string: "https://srshepherdjr.ddns.net:8888/api/v1/cargas/getbycar/\(id)") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([AutoCarGas].self, from: data)
                    DispatchQueue.main.async {
                        self.gasList = decodedData
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
}
