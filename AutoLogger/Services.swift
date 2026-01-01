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
    
    func saveCarGasItem(carGas: AutoCarGas) {
        guard let     url = URL(string: "https://srshepherdjr.ddns.net:8888/api/v1/cargas/\(carGas.id)") else { return }

        print(carGas)
        var request = URLRequest(url: url)
        //method, body, headers
        if (isNewCarGas == true) {
            request.httpMethod = "POST"
        }
            else {
                request.httpMethod = "PUT"
        }
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        let body: carGas

//        request.httpBody = try? JSONSerialization.data(withJSONObject: carGas, options: .fragmentsAllowed)
        request.httpBody = try? JSONEncoder().encode(carGas)
        
        // Make the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return}
            
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(response)
            }
            catch {
                print (error)
            }
        }
        task.resume()
        
        // Evaluate response
        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                do {
//                    let decodedData = try JSONDecoder().decode([AutoCarGas].self, from: data)
//                    DispatchQueue.main.async {
//                        self.gasList = decodedData
//                    }
//                } catch {
//                    print("Error decoding JSON: \(error)")
//                }
//            } else if let error = error {
//                print("Error fetching data: \(error)")
//            }
//        }.resume()
    }
}
