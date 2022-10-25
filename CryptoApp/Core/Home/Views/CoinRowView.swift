//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by MM on 21.10.2022.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let isPortfolio: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            if isPortfolio {
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin, isPortfolio: true)
                .previewLayout(.sizeThatFits)
            CoinRowView(coin: dev.coin, isPortfolio: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

extension CoinRowView {
    
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldings?.asNumberString() ?? "0.00")
            Text(coin.currentHoldingsValue.asNumberString())
        }
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWithDecimals())
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.marketCapChangePercentage24H?.asPercentString() ?? "0.00%")
                .foregroundColor(
                    (coin.marketCapChangePercentage24H ?? 0) >= 0 ?
                Color.theme.green :
                Color.theme.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5)
    }
    
}
