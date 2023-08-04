//
//  SwiftUILearningDogsApp.swift
//  SwiftUILearningDogs
//
//  Created by Lucas Emiliano Benitez Joncic on 04/08/2023.
//

import SwiftUI

@main
struct SwiftUILearningDogsApp: App {
    var body: some Scene {
        WindowGroup {
            DogsView<DogsPresenter>.compose()
        }
    }
}
