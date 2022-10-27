//
//  CoinDataService.swift
//  CryptoApp
//
//  Created by MM on 27.10.2022.
//

import SwiftUI
import Combine

class CoinDataService {
    
    @Published var coinList: [CoinModel] = []
    private var coinSubscription: AnyCancellable?
    
    init() {
        getCoin()
    }
    
    private func getCoin() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
        else {
                    print("Bad URL String")
                    return
        }
        
       coinSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default)) // подписываем на бэкграунд тред
            .tryMap { (output) -> Data in //проверяем, что респонс ок и назначаем дату
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode <= 300
                else { throw URLError(.badServerResponse)}
                return output.data
            }
            .receive(on: DispatchQueue.main) // подписываем обратно на главный тред
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { completion in           // синхронизируем со значением
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] returnedCoins in
                self?.coinList = returnedCoins
                self?.coinSubscription?.cancel()
            }

        
    }
    
    
//    private func getCoins() async {
//        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else {
//            print("Bad URL String")
//            return }
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let decodedData = try JSONDecoder().decode([CoinModel].self, from: data)
//            self.coinList = decodedData
//        }
//        catch {
//            print("newtork data error")
//        }
//    }
    
}
