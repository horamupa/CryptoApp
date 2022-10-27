//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by MM on 25.10.2022.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    var dataService = CoinDataService()
    private var cancellabels = Set<AnyCancellable>()
    
    init() {
            addSubscribers()
        }
    
    private func addSubscribers() {
        dataService.$coinList
            .sink { [weak self] reciveCoins in
                self?.allCoins = reciveCoins
            }
            .store(in: &cancellabels)
    }
}
