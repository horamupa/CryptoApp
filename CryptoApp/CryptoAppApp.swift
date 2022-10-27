//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by MM on 13.09.2022.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
                    .environmentObject(vm)
            }
        }
    }
}
