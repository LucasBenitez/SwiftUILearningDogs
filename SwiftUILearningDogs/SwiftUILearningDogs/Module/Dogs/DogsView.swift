//
//  DogsView.swift
//  SwiftUILearningDogs
//
//  Created by Lucas Emiliano Benitez Joncic on 04/08/2023.
//

import SwiftUI
import Combine

protocol DogsViewProtocol {
    func showError(_ message: String)
}

struct DogsView <Presenter: DogsPresenterProtocol>: View, DogsViewProtocol {
    @ObservedObject var presenter: Presenter
    
    init(presenter: Presenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        VStack {
            Text("Lista de Perros")
            DogImageComponent(presenter: presenter){}
                .edgesIgnoringSafeArea(.all)
            
            CircleButton(action: presenter.fetchDogImage, icon: "arrow.counterclockwise", colorIcon: .white, colorCircle: .blue)
                .frame(width: 100,height: 100,alignment: .bottom)
        }
        
        .onAppear {
            presenter.fetchDogImage()
        }
    }
    
    func showError(_ message: String) {
        print(message)
    }
}

extension DogsView {
    static func compose() -> DogsView<DogsPresenter> {
        let presenter = DogsPresenter.compose()
        let view = DogsView<DogsPresenter>.init(presenter: presenter)
        presenter.view = view
        return view
    }
}
