//
//  ContentView.swift
//  CryptoApp
//
//  Created by MM on 13.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                Text("1")
                    .foregroundColor(Color.theme.accent)
                Text("1")
                    .foregroundColor(Color.theme.secondaryText)
                Text("1")
                    .foregroundColor(Color.red)
                Text("1")
                    .foregroundColor(Color.green)
            }
            .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
