//
//  HomeView.swift
//  CryptoApp
//
//  Created by MM on 13.09.2022.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    @EnvironmentObject var vm: HomeViewModel
    @State private var isShowPortfolio: Bool = true
    
    var body: some View {
        VStack {
            homeHeader
            columnTitles
            
            if !isShowPortfolio {
                allCoinsList
                    .transition(.move(edge: .leading))
            }
            
            if isShowPortfolio {
                portfolioCoinsList
                    .transition(.move(edge: .trailing))
            }
                
            Spacer()
        }
        .animation(.linear, value: isShowPortfolio)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
                .environmentObject(dev.homeVM)
        }
    }
}

extension HomeView {
    
    private var homeHeader: some View {
        HStack {
            CircleButton(iconName: isShowPortfolio ? "plus" : "info")
                .background(
                CirvleButtonAnimationView(isAnimatedCircle: $isShowPortfolio)
                )
            Spacer()
            Text(isShowPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
            Spacer()
            CircleButton(iconName: isShowPortfolio ? "chevron.left" : "chevron.right")
                .onTapGesture {
                    isShowPortfolio.toggle()
                }   
        }
        .padding()
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                
                CoinRowView(coin: coin, isPortfolio: false)
                    .listRowInsets(EdgeInsets(
                        top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    private var portfolioCoinsList: some View {
        List {
            CoinRowView(coin: DeveloperPreview.instance.coin, isPortfolio: true)
                .listRowInsets(EdgeInsets(
                    top: 10, leading: 0, bottom: 10, trailing: 10))
        }
        .listStyle(.plain)
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if isShowPortfolio {
                Text("Portfolio")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5)
        }
        .font(.subheadline)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
