//
//  DogImageComponent.swift
//  SwiftUILearningDogs
//
//  Created by Lucas Emiliano Benitez Joncic on 04/08/2023.
//

import SwiftUI

struct DogImageComponent<Content: View,Presenter: DogsPresenterProtocol>: View, DogsViewProtocol {
    func showError(_ message: String) {}
    
    @ObservedObject var presenter: Presenter
    @ViewBuilder var content: Content
    
    var body: some View {
        GeometryReader { geometry in
            if let dogImage = presenter.dataDog {
                AsyncImage(url: URL(string: dogImage.message)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()                    case .failure(_):
                        // Vista de error en caso de fallo en la carga de la imagen
                        Text("Ups! Ocurrió un error")
                    case .empty:
                        ProgressView()
                    @unknown default:
                        ProgressView()
                    }
                }
            } else {
                content
            }
        }
    }
}

struct DogImageComponent_Previews: PreviewProvider {
    static var previews: some View {
        let dogPresenter = DogsPresenter.compose()
        
        return DogImageComponent(presenter: dogPresenter) {
            Text("No se encontró el perrito")
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

extension DogImageComponent {
    static func compose(content: @escaping () -> Content) -> DogImageComponent<Content, DogsPresenter> {
        let presenter = DogsPresenter.compose()
        let view = DogImageComponent<Content,DogsPresenter>.init(presenter: presenter, content: content)
        presenter.view = view
        return view
    }
}

