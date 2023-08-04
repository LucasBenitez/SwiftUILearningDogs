//
//  CircleButton.swift
//  SwiftUILearningDogs
//
//  Created by Lucas Emiliano Benitez Joncic on 04/08/2023.
//

import SwiftUI

struct CircleButton: View {
    var action: () -> Void
    var icon: String
    var colorIcon: Color
    var colorCircle: Color
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .resizable()
                .foregroundColor(colorIcon)
                .padding(20)
                .background(colorCircle)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 5, x: -1, y: 2)
        }
        
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(action: {},
                     icon: "star",
                     colorIcon: .black,
                     colorCircle: .brown)
            .frame(width: 100, height: 100)
    }
}
