//
//  DogsInteractor.swift
//  SwiftUILearningDogs
//
//  Created by Lucas Emiliano Benitez Joncic on 04/08/2023.
//
import Alamofire
import Foundation

class DogsInteractor {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchDogImage(completion: @escaping (Result<Dog, Error>) -> Void) {
        let url = "https://dog.ceo/api/breeds/image/random"
        
        networkManager.getRequest(url: url, parameters: nil) { result in
            switch result {
            case .success(let data):
                // Parsea los datos JSON de la respuesta en un array de objetos Dog
                if let dogImage = try? JSONDecoder().decode(Dog.self, from: data) {
                    completion(.success(dogImage))
                } else {
                    // Error al parsear los datos
                    completion(.failure(NetworkError.invalidData))
                }
            case .failure(let error):
                // Error en la solicitud o respuesta de la API
                completion(.failure(error))
            }
        }
    }
}

extension DogsInteractor {
    static func compose() -> DogsInteractor {
        let network = NetworkManager()
        return .init(networkManager: network)
    }
}
