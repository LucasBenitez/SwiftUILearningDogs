//
//  DogsResponse.swift
//  SwiftUILearningDogs
//
//  Created by Lucas Emiliano Benitez Joncic on 04/08/2023.
//

struct Dog: Codable {
    let message: String
    let status: String
}

struct DogFact: Codable {
    let data: [String]
}

