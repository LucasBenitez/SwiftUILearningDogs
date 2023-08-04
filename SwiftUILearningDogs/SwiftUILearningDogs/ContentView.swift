//
//  ContentView.swift
//  SwiftUILearningDogs
//
//  Created by Lucas Emiliano Benitez Joncic on 04/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DogsView<DogsPresenter>.compose()
    }
}
