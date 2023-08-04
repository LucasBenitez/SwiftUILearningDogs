//
//  DogsPresenter.swift
//  SwiftUILearningDogs
//
//  Created by Lucas Emiliano Benitez Joncic on 04/08/2023.
//

import Foundation
import Combine

protocol DogsPresenterProtocol: AnyObject, ObservableObject {
    func fetchDogImage()
    var dataDog: Dog? { get }
}

class DogsPresenter: DogsPresenterProtocol {
    var interactor: DogsInteractor
    var view: DogsViewProtocol?
    @Published var dataDog: Dog?
    
    init(interactor: DogsInteractor) {
        self.interactor = interactor
    }
    
    
    func fetchDogImage() {
        interactor.fetchDogImage { [weak self] result in
            switch result {
            case .success(let dogImage):
                self?.dataDog = dogImage
            case .failure(let error):
                self?.view?.showError(error.localizedDescription)
            }
        }
    }
}

extension DogsPresenter {
    static func compose() -> DogsPresenter {
        let interactor = DogsInteractor.compose()
        return .init(interactor: interactor)
    }
}
