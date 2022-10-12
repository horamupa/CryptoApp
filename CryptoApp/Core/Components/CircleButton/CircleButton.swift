//
//  CircleButton.swift
//  CryptoApp
//
//  Created by MM on 13.09.2022.
//

import SwiftUI

struct CircleButton: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
            Circle()
                .foregroundColor(Color.theme.background)
            )
            .shadow(color: Color.theme.accent.opacity(0.25), radius: 10, x: 5, y: 10)
            .padding()
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButton(iconName: "info")
                .padding()
                .previewLayout(.sizeThatFits)
            
            CircleButton(iconName: "plus")
                .padding()
                .colorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
