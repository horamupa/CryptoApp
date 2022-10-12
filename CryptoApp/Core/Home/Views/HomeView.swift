//
//  HomeView.swift
//  CryptoApp
//
//  Created by MM on 13.09.2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isShowPortfolio = false
    
    var body: some View {
        VStack {
            homeHeader
//            .animation(Animation.spring())
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
    }
}

extension HomeView {
    
    var homeHeader: some View {
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
    
}
