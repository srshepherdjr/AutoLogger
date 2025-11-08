import Foundation
internal import Combine
class MyCarModel: ObservableObject {
    @Published var myCar: AutoCar = AutoCar(id: 0, userId: 1, modelYear: 2000, carMake: "Chevrolet", carModel: "Corvette", active: false)

 
    func fetchItem() {
        guard let     url = URL(string: "https://srshepherdjr.ddns.net:8888/api/v1/mycars/1") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(AutoCar.self, from: data)
                    DispatchQueue.main.async {
                        self.myCar = decodedData
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
